Return-Path: <raj.khem@gmail.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF7EC88CB9
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 23:13:49 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.100911.1754090018821340674
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Aug 2025 16:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hTcXRX22;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31f3b54da19so1821809a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754090018; x=1754694818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LBHnomvOkLvTDepFCX/AoVRMuuhD/sbgO/RZF2EEgTA=;
        b=hTcXRX22v/7zuBTpgNQf3VAV/N68a6h4+oYo2bcXpoKZTN6ha4ZIXIWGl3Gp30q7dn
         6r5Qa4wzrujPwYCTIU5e6osIIWVpqg9X32Pp2k5ezElRDiITwITbjEmArVuL8575ZMAL
         GK6E5S1qVi3CKNhzwXrrukyHNntCuEElHSAHP18w/hHmpxcSAUalgB0CRtLCP7f/n/25
         Hh94qy4D3o2uA6w9xlYNvOqZMdYf5g6krNKfMmN57eVNQM+aUmDl4uNP9iNx5BRKxVFM
         FN0xnF6H6+Jr4oPOdYA5/qJLRhg83jRyF6l4JFwEeu+LVePka2I1J9AYPeneaH4ftbs4
         8exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754090018; x=1754694818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBHnomvOkLvTDepFCX/AoVRMuuhD/sbgO/RZF2EEgTA=;
        b=vfidO6iW4YdAGdVaO5XsX3Fw22oot9pLRNW/ftVvb+7HqJ+Ta7zmGnzOoNcFXOUfzO
         PJycfC+ZcmwwomqO3oOZJp+9GTagEQWhxaEBIyeJReuZ9rbXwTIhFG/B54W11gFPn6E/
         lXneoFp+O1OKk1j+bGuwlvzsnhhq4fZ5qT8/RA3rAodgY/AKT7SQWMBlhJFmQfxEongV
         /YOFbtJr+Rsk3vrqU0jHUIgHVZiYfaN0IiyiGdnIzJwvd8nSpwgofq8Mg33liKUhAT47
         ugScWfJ5G4ESmql+aGk3o+gtG/EsKQrv6oCOyNfWUeLVtvMhA2tYMlo4JsqkU/DIdjN6
         +81A==
X-Gm-Message-State: AOJu0YyPV38FD6S/jZrZRFJ4wiIGAV17msP7IGGrkLeLC7w+PzRANdnP
	FAI74iH3qcxpozcb3uEj9oyJHXIuiHKCyU95CP/CRF4qQAyi4BtAxqII68mi4BpjCBc=
X-Gm-Gg: ASbGnct3U2PhDBxBtgdTGxMopAHZrUUk180jU5bKjHQUw0ux08/FZYcHyXPKvjmSEtO
	3pW3yTciCL0/yqCtRH9llRRKWaqVXudRJuqMvDTV4ujXcZ7XriPSKtVzEJCU0jcSg6RRKFDnHEX
	I+rSoYYbPzehkCk7IOtcxvEeyVz4T1MXJ2wtBBCokeyTG8z9Tho6Tl3m56QXNtL5CdkTmA5sDx7
	oqeogBqN7ldSDj+aBoPYqFRR1UuWzKufKXchM8sABfyYkDJMLsXPDQKlkJxHVeCrvJQdvlrpmUa
	2UVylmuqkEomeCCpZXJcNMqurijT3JZ0zcefkf9QeMzndTVidEHEI4poAVPBjUE7IV1J/aXrKs7
	Pm/4iBfUgD4OLpQ==
X-Google-Smtp-Source: AGHT+IEjOm096e6TbTyClOGS8JvddJhz4YjBqj335FJFWcUD1nKhppd20bFLEsEjeiU7sviUFgAPhg==
X-Received: by 2002:a17:90b:4c43:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-321161e9dd4mr2047060a91.2.1754090016647;
        Fri, 01 Aug 2025 16:13:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b423d2f4fcesm2141884a12.33.2025.08.01.16.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 16:13:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] nlohmann-fifo: Fix build with clang
Date: Fri,  1 Aug 2025 16:13:29 -0700
Message-ID: <20250801231332.4167568-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 23:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118825

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Upgrade-to-latest-from-Catch-v1.12.2.patch | 22371 ++++++++++++++++
 ...atch.hpp-Define-SIGSTKSZ-as-constant.patch |    41 +
 .../nlohmann-fifo/nlohmann-fifo_git.bb        |     6 +-
 3 files changed, 22416 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo/00=
01-catch.hpp-Upgrade-to-latest-from-Catch-v1.12.2.patch
 create mode 100644 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo/00=
02-catch.hpp-Define-SIGSTKSZ-as-constant.patch

diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo/0001-catc=
h.hpp-Upgrade-to-latest-from-Catch-v1.12.2.patch b/meta-oe/recipes-devtools=
/nlohmann-fifo/nlohmann-fifo/0001-catch.hpp-Upgrade-to-latest-from-Catch-v1=
.12.2.patch
new file mode 100644
index 0000000000..6237456047
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo/0001-catch.hpp-U=
pgrade-to-latest-from-Catch-v1.12.2.patch
@@ -0,0 +1,22371 @@
+From 1c3b6a5aa0d1a489ae3e7bb65aa9f30151b84c90 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 1 Aug 2025 11:07:01 -0700
+Subject: [PATCH 1/2] catch.hpp: Upgrade to latest from Catch v1.12.2
+
+This is a copy of
+https://github.com/catchorg/Catch2/blob/Catch1.x/single_include/catch.hpp
+
+Upstream-Status: Backport [https://github.com/catchorg/Catch2/blob/Catch1.=
x/single_include/catch.hpp]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/thirdparty/catch/catch.hpp | 22352 ++++++++++++++++--------------
+ 1 file changed, 11689 insertions(+), 10663 deletions(-)
+
+diff --git a/test/thirdparty/catch/catch.hpp b/test/thirdparty/catch/catch=
.hpp
+index 15f7893..fdb046f 100644
+--- a/test/thirdparty/catch/catch.hpp
++++ b/test/thirdparty/catch/catch.hpp
+@@ -1,10663 +1,11689 @@
+-/*=0D
+- *  Catch v1.6.1=0D
+- *  Generated: 2017-01-20 12:33:53.497767=0D
+- *  ----------------------------------------------------------=0D
+- *  This file has been merged from multiple headers. Please don't edit it=
 directly=0D
+- *  Copyright (c) 2012 Two Blue Cubes Ltd. All rights reserved.=0D
+- *=0D
+- *  Distributed under the Boost Software License, Version 1.0. (See accom=
panying=0D
+- *  file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)=
=0D
+- */=0D
+-#ifndef TWOBLUECUBES_SINGLE_INCLUDE_CATCH_HPP_INCLUDED=0D
+-#define TWOBLUECUBES_SINGLE_INCLUDE_CATCH_HPP_INCLUDED=0D
+-=0D
+-#define TWOBLUECUBES_CATCH_HPP_INCLUDED=0D
+-=0D
+-#ifdef __clang__=0D
+-#    pragma clang system_header=0D
+-#elif defined __GNUC__=0D
+-#    pragma GCC system_header=0D
+-#endif=0D
+-=0D
+-// #included from: internal/catch_suppress_warnings.h=0D
+-=0D
+-#ifdef __clang__=0D
+-#   ifdef __ICC // icpc defines the __clang__ macro=0D
+-#       pragma warning(push)=0D
+-#       pragma warning(disable: 161 1682)=0D
+-#   else // __ICC=0D
+-#       pragma clang diagnostic ignored "-Wglobal-constructors"=0D
+-#       pragma clang diagnostic ignored "-Wvariadic-macros"=0D
+-#       pragma clang diagnostic ignored "-Wc99-extensions"=0D
+-#       pragma clang diagnostic ignored "-Wunused-variable"=0D
+-#       pragma clang diagnostic push=0D
+-#       pragma clang diagnostic ignored "-Wpadded"=0D
+-#       pragma clang diagnostic ignored "-Wc++98-compat"=0D
+-#       pragma clang diagnostic ignored "-Wc++98-compat-pedantic"=0D
+-#       pragma clang diagnostic ignored "-Wswitch-enum"=0D
+-#       pragma clang diagnostic ignored "-Wcovered-switch-default"=0D
+-#    endif=0D
+-#elif defined __GNUC__=0D
+-#    pragma GCC diagnostic ignored "-Wvariadic-macros"=0D
+-#    pragma GCC diagnostic ignored "-Wunused-variable"=0D
+-#    pragma GCC diagnostic push=0D
+-#    pragma GCC diagnostic ignored "-Wpadded"=0D
+-#endif=0D
+-#if defined(CATCH_CONFIG_MAIN) || defined(CATCH_CONFIG_RUNNER)=0D
+-#  define CATCH_IMPL=0D
+-#endif=0D
+-=0D
+-#ifdef CATCH_IMPL=0D
+-#  ifndef CLARA_CONFIG_MAIN=0D
+-#    define CLARA_CONFIG_MAIN_NOT_DEFINED=0D
+-#    define CLARA_CONFIG_MAIN=0D
+-#  endif=0D
+-#endif=0D
+-=0D
+-// #included from: internal/catch_notimplemented_exception.h=0D
+-#define TWOBLUECUBES_CATCH_NOTIMPLEMENTED_EXCEPTION_H_INCLUDED=0D
+-=0D
+-// #included from: catch_common.h=0D
+-#define TWOBLUECUBES_CATCH_COMMON_H_INCLUDED=0D
+-=0D
+-// #included from: catch_compiler_capabilities.h=0D
+-#define TWOBLUECUBES_CATCH_COMPILER_CAPABILITIES_HPP_INCLUDED=0D
+-=0D
+-// Detect a number of compiler features - mostly C++11/14 conformance - b=
y compiler=0D
+-// The following features are defined:=0D
+-//=0D
+-// CATCH_CONFIG_CPP11_NULLPTR : is nullptr supported?=0D
+-// CATCH_CONFIG_CPP11_NOEXCEPT : is noexcept supported?=0D
+-// CATCH_CONFIG_CPP11_GENERATED_METHODS : The delete and default keywords=
 for compiler generated methods=0D
+-// CATCH_CONFIG_CPP11_IS_ENUM : std::is_enum is supported?=0D
+-// CATCH_CONFIG_CPP11_TUPLE : std::tuple is supported=0D
+-// CATCH_CONFIG_CPP11_LONG_LONG : is long long supported?=0D
+-// CATCH_CONFIG_CPP11_OVERRIDE : is override supported?=0D
+-// CATCH_CONFIG_CPP11_UNIQUE_PTR : is unique_ptr supported (otherwise use=
 auto_ptr)=0D
+-=0D
+-// CATCH_CONFIG_CPP11_OR_GREATER : Is C++11 supported?=0D
+-=0D
+-// CATCH_CONFIG_VARIADIC_MACROS : are variadic macros supported?=0D
+-// CATCH_CONFIG_COUNTER : is the __COUNTER__ macro supported?=0D
+-// ****************=0D
+-// Note to maintainers: if new toggles are added please document them=0D
+-// in configuration.md, too=0D
+-// ****************=0D
+-=0D
+-// In general each macro has a _NO_<feature name> form=0D
+-// (e.g. CATCH_CONFIG_CPP11_NO_NULLPTR) which disables the feature.=0D
+-// Many features, at point of detection, define an _INTERNAL_ macro, so t=
hey=0D
+-// can be combined, en-mass, with the _NO_ forms later.=0D
+-=0D
+-// All the C++11 features can be disabled with CATCH_CONFIG_NO_CPP11=0D
+-=0D
+-#ifdef __cplusplus=0D
+-=0D
+-#  if __cplusplus >=3D 201103L=0D
+-#    define CATCH_CPP11_OR_GREATER=0D
+-#  endif=0D
+-=0D
+-#  if __cplusplus >=3D 201402L=0D
+-#    define CATCH_CPP14_OR_GREATER=0D
+-#  endif=0D
+-=0D
+-#endif=0D
+-=0D
+-#ifdef __clang__=0D
+-=0D
+-#  if __has_feature(cxx_nullptr)=0D
+-#    define CATCH_INTERNAL_CONFIG_CPP11_NULLPTR=0D
+-#  endif=0D
+-=0D
+-#  if __has_feature(cxx_noexcept)=0D
+-#    define CATCH_INTERNAL_CONFIG_CPP11_NOEXCEPT=0D
+-#  endif=0D
+-=0D
+-#   if defined(CATCH_CPP11_OR_GREATER)=0D
+-#       define CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS _Pragma( "cla=
ng diagnostic ignored \"-Wparentheses\"" )=0D
+-#   endif=0D
+-=0D
+-#endif // __clang__=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
///////=0D
+-// Borland=0D
+-#ifdef __BORLANDC__=0D
+-=0D
+-#endif // __BORLANDC__=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
///////=0D
+-// EDG=0D
+-#ifdef __EDG_VERSION__=0D
+-=0D
+-#endif // __EDG_VERSION__=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
///////=0D
+-// Digital Mars=0D
+-#ifdef __DMC__=0D
+-=0D
+-#endif // __DMC__=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
///////=0D
+-// GCC=0D
+-#ifdef __GNUC__=0D
+-=0D
+-#   if __GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 6 && defined(__GXX_EXPERI=
MENTAL_CXX0X__)=0D
+-#       define CATCH_INTERNAL_CONFIG_CPP11_NULLPTR=0D
+-#   endif=0D
+-=0D
+-#   if !defined(CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS) && defined(=
CATCH_CPP11_OR_GREATER)=0D
+-#       define CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS _Pragma( "GCC=
 diagnostic ignored \"-Wparentheses\"" )=0D
+-#   endif=0D
+-=0D
+-// - otherwise more recent versions define __cplusplus >=3D 201103L=0D
+-// and will get picked up below=0D
+-=0D
+-#endif // __GNUC__=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
///////=0D
+-// Visual C++=0D
+-#ifdef _MSC_VER=0D
+-=0D
+-#if (_MSC_VER >=3D 1600)=0D
+-#   define CATCH_INTERNAL_CONFIG_CPP11_NULLPTR=0D
+-#   define CATCH_INTERNAL_CONFIG_CPP11_UNIQUE_PTR=0D
+-#endif=0D
+-=0D
+-#if (_MSC_VER >=3D 1900 ) // (VC++ 13 (VS2015))=0D
+-#define CATCH_INTERNAL_CONFIG_CPP11_NOEXCEPT=0D
+-#define CATCH_INTERNAL_CONFIG_CPP11_GENERATED_METHODS=0D
+-#define CATCH_INTERNAL_CONFIG_CPP11_SHUFFLE=0D
+-#endif=0D
+-=0D
+-#endif // _MSC_VER=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
///////=0D
+-=0D
+-// Use variadic macros if the compiler supports them=0D
+-#if ( defined _MSC_VER && _MSC_VER > 1400 && !defined __EDGE__) || \=0D
+-    ( defined __WAVE__ && __WAVE_HAS_VARIADICS ) || \=0D
+-    ( defined __GNUC__ && __GNUC__ >=3D 3 ) || \=0D
+-    ( !defined __cplusplus && __STDC_VERSION__ >=3D 199901L || __cplusplu=
s >=3D 201103L )=0D
+-=0D
+-#define CATCH_INTERNAL_CONFIG_VARIADIC_MACROS=0D
+-=0D
+-#endif=0D
+-=0D
+-// Use __COUNTER__ if the compiler supports it=0D
+-#if ( defined _MSC_VER && _MSC_VER >=3D 1300 ) || \=0D
+-    ( defined __GNUC__  && __GNUC__ >=3D 4 && __GNUC_MINOR__ >=3D 3 ) || =
\=0D
+-    ( defined __clang__ && __clang_major__ >=3D 3 )=0D
+-=0D
+-#define CATCH_INTERNAL_CONFIG_COUNTER=0D
+-=0D
+-#endif=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
///////=0D
+-// C++ language feature support=0D
+-=0D
+-// catch all support for C++11=0D
+-#if defined(CATCH_CPP11_OR_GREATER)=0D
+-=0D
+-#  if !defined(CATCH_INTERNAL_CONFIG_CPP11_NULLPTR)=0D
+-#    define CATCH_INTERNAL_CONFIG_CPP11_NULLPTR=0D
+-#  endif=0D
+-=0D
+-#  ifndef CATCH_INTERNAL_CONFIG_CPP11_NOEXCEPT=0D
+-#    define CATCH_INTERNAL_CONFIG_CPP11_NOEXCEPT=0D
+-#  endif=0D
+-=0D
+-#  ifndef CATCH_INTERNAL_CONFIG_CPP11_GENERATED_METHODS=0D
+-#    define CATCH_INTERNAL_CONFIG_CPP11_GENERATED_METHODS=0D
+-#  endif=0D
+-=0D
+-#  ifndef CATCH_INTERNAL_CONFIG_CPP11_IS_ENUM=0D
+-#    define CATCH_INTERNAL_CONFIG_CPP11_IS_ENUM=0D
+-#  endif=0D
+-=0D
+-#  ifndef CATCH_INTERNAL_CONFIG_CPP11_TUPLE=0D
+-#    define CATCH_INTERNAL_CONFIG_CPP11_TUPLE=0D
+-#  endif=0D
+-=0D
+-#  ifndef CATCH_INTERNAL_CONFIG_VARIADIC_MACROS=0D
+-#    define CATCH_INTERNAL_CONFIG_VARIADIC_MACROS=0D
+-#  endif=0D
+-=0D
+-#  if !defined(CATCH_INTERNAL_CONFIG_CPP11_LONG_LONG)=0D
+-#    define CATCH_INTERNAL_CONFIG_CPP11_LONG_LONG=0D
+-#  endif=0D
+-=0D
+-#  if !defined(CATCH_INTERNAL_CONFIG_CPP11_OVERRIDE)=0D
+-#    define CATCH_INTERNAL_CONFIG_CPP11_OVERRIDE=0D
+-#  endif=0D
+-#  if !defined(CATCH_INTERNAL_CONFIG_CPP11_UNIQUE_PTR)=0D
+-#    define CATCH_INTERNAL_CONFIG_CPP11_UNIQUE_PTR=0D
+-#  endif=0D
+-# if !defined(CATCH_INTERNAL_CONFIG_CPP11_SHUFFLE)=0D
+-#   define CATCH_INTERNAL_CONFIG_CPP11_SHUFFLE=0D
+-#  endif=0D
+-=0D
+-#endif // __cplusplus >=3D 201103L=0D
+-=0D
+-// Now set the actual defines based on the above + anything the user has =
configured=0D
+-#if defined(CATCH_INTERNAL_CONFIG_CPP11_NULLPTR) && !defined(CATCH_CONFIG=
_CPP11_NO_NULLPTR) && !defined(CATCH_CONFIG_CPP11_NULLPTR) && !defined(CATC=
H_CONFIG_NO_CPP11)=0D
+-#   define CATCH_CONFIG_CPP11_NULLPTR=0D
+-#endif=0D
+-#if defined(CATCH_INTERNAL_CONFIG_CPP11_NOEXCEPT) && !defined(CATCH_CONFI=
G_CPP11_NO_NOEXCEPT) && !defined(CATCH_CONFIG_CPP11_NOEXCEPT) && !defined(C=
ATCH_CONFIG_NO_CPP11)=0D
+-#   define CATCH_CONFIG_CPP11_NOEXCEPT=0D
+-#endif=0D
+-#if defined(CATCH_INTERNAL_CONFIG_CPP11_GENERATED_METHODS) && !defined(CA=
TCH_CONFIG_CPP11_NO_GENERATED_METHODS) && !defined(CATCH_CONFIG_CPP11_GENER=
ATED_METHODS) && !defined(CATCH_CONFIG_NO_CPP11)=0D
+-#   define CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-#endif=0D
+-#if defined(CATCH_INTERNAL_CONFIG_CPP11_IS_ENUM) && !defined(CATCH_CONFIG=
_CPP11_NO_IS_ENUM) && !defined(CATCH_CONFIG_CPP11_IS_ENUM) && !defined(CATC=
H_CONFIG_NO_CPP11)=0D
+-#   define CATCH_CONFIG_CPP11_IS_ENUM=0D
+-#endif=0D
+-#if defined(CATCH_INTERNAL_CONFIG_CPP11_TUPLE) && !defined(CATCH_CONFIG_C=
PP11_NO_TUPLE) && !defined(CATCH_CONFIG_CPP11_TUPLE) && !defined(CATCH_CONF=
IG_NO_CPP11)=0D
+-#   define CATCH_CONFIG_CPP11_TUPLE=0D
+-#endif=0D
+-#if defined(CATCH_INTERNAL_CONFIG_VARIADIC_MACROS) && !defined(CATCH_CONF=
IG_NO_VARIADIC_MACROS) && !defined(CATCH_CONFIG_VARIADIC_MACROS)=0D
+-#   define CATCH_CONFIG_VARIADIC_MACROS=0D
+-#endif=0D
+-#if defined(CATCH_INTERNAL_CONFIG_CPP11_LONG_LONG) && !defined(CATCH_CONF=
IG_CPP11_NO_LONG_LONG) && !defined(CATCH_CONFIG_CPP11_LONG_LONG) && !define=
d(CATCH_CONFIG_NO_CPP11)=0D
+-#   define CATCH_CONFIG_CPP11_LONG_LONG=0D
+-#endif=0D
+-#if defined(CATCH_INTERNAL_CONFIG_CPP11_OVERRIDE) && !defined(CATCH_CONFI=
G_CPP11_NO_OVERRIDE) && !defined(CATCH_CONFIG_CPP11_OVERRIDE) && !defined(C=
ATCH_CONFIG_NO_CPP11)=0D
+-#   define CATCH_CONFIG_CPP11_OVERRIDE=0D
+-#endif=0D
+-#if defined(CATCH_INTERNAL_CONFIG_CPP11_UNIQUE_PTR) && !defined(CATCH_CON=
FIG_CPP11_NO_UNIQUE_PTR) && !defined(CATCH_CONFIG_CPP11_UNIQUE_PTR) && !def=
ined(CATCH_CONFIG_NO_CPP11)=0D
+-#   define CATCH_CONFIG_CPP11_UNIQUE_PTR=0D
+-#endif=0D
+-// Use of __COUNTER__ is suppressed if __JETBRAINS_IDE__ is #defined (mea=
ning we're being parsed by a JetBrains IDE for=0D
+-// analytics) because, at time of writing, __COUNTER__ is not properly ha=
ndled by it.=0D
+-// This does not affect compilation=0D
+-#if defined(CATCH_INTERNAL_CONFIG_COUNTER) && !defined(CATCH_CONFIG_NO_CO=
UNTER) && !defined(CATCH_CONFIG_COUNTER) && !defined(__JETBRAINS_IDE__)=0D
+-#   define CATCH_CONFIG_COUNTER=0D
+-#endif=0D
+-#if defined(CATCH_INTERNAL_CONFIG_CPP11_SHUFFLE) && !defined(CATCH_CONFIG=
_CPP11_NO_SHUFFLE) && !defined(CATCH_CONFIG_CPP11_SHUFFLE) && !defined(CATC=
H_CONFIG_NO_CPP11)=0D
+-#   define CATCH_CONFIG_CPP11_SHUFFLE=0D
+-#endif=0D
+-=0D
+-#if !defined(CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS)=0D
+-#   define CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS=0D
+-#endif=0D
+-=0D
+-// noexcept support:=0D
+-#if defined(CATCH_CONFIG_CPP11_NOEXCEPT) && !defined(CATCH_NOEXCEPT)=0D
+-#  define CATCH_NOEXCEPT noexcept=0D
+-#  define CATCH_NOEXCEPT_IS(x) noexcept(x)=0D
+-#else=0D
+-#  define CATCH_NOEXCEPT throw()=0D
+-#  define CATCH_NOEXCEPT_IS(x)=0D
+-#endif=0D
+-=0D
+-// nullptr support=0D
+-#ifdef CATCH_CONFIG_CPP11_NULLPTR=0D
+-#   define CATCH_NULL nullptr=0D
+-#else=0D
+-#   define CATCH_NULL NULL=0D
+-#endif=0D
+-=0D
+-// override support=0D
+-#ifdef CATCH_CONFIG_CPP11_OVERRIDE=0D
+-#   define CATCH_OVERRIDE override=0D
+-#else=0D
+-#   define CATCH_OVERRIDE=0D
+-#endif=0D
+-=0D
+-// unique_ptr support=0D
+-#ifdef CATCH_CONFIG_CPP11_UNIQUE_PTR=0D
+-#   define CATCH_AUTO_PTR( T ) std::unique_ptr<T>=0D
+-#else=0D
+-#   define CATCH_AUTO_PTR( T ) std::auto_ptr<T>=0D
+-#endif=0D
+-=0D
+-#define INTERNAL_CATCH_UNIQUE_NAME_LINE2( name, line ) name##line=0D
+-#define INTERNAL_CATCH_UNIQUE_NAME_LINE( name, line ) INTERNAL_CATCH_UNIQ=
UE_NAME_LINE2( name, line )=0D
+-#ifdef CATCH_CONFIG_COUNTER=0D
+-#  define INTERNAL_CATCH_UNIQUE_NAME( name ) INTERNAL_CATCH_UNIQUE_NAME_L=
INE( name, __COUNTER__ )=0D
+-#else=0D
+-#  define INTERNAL_CATCH_UNIQUE_NAME( name ) INTERNAL_CATCH_UNIQUE_NAME_L=
INE( name, __LINE__ )=0D
+-#endif=0D
+-=0D
+-#define INTERNAL_CATCH_STRINGIFY2( expr ) #expr=0D
+-#define INTERNAL_CATCH_STRINGIFY( expr ) INTERNAL_CATCH_STRINGIFY2( expr =
)=0D
+-=0D
+-#include <sstream>=0D
+-#include <stdexcept>=0D
+-#include <algorithm>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct IConfig;=0D
+-=0D
+-    struct CaseSensitive { enum Choice {=0D
+-        Yes,=0D
+-        No=0D
+-    }; };=0D
+-=0D
+-    class NonCopyable {=0D
+-#ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-        NonCopyable( NonCopyable const& )              =3D delete;=0D
+-        NonCopyable( NonCopyable && )                  =3D delete;=0D
+-        NonCopyable& operator =3D ( NonCopyable const& ) =3D delete;=0D
+-        NonCopyable& operator =3D ( NonCopyable && )     =3D delete;=0D
+-#else=0D
+-        NonCopyable( NonCopyable const& info );=0D
+-        NonCopyable& operator =3D ( NonCopyable const& );=0D
+-#endif=0D
+-=0D
+-    protected:=0D
+-        NonCopyable() {}=0D
+-        virtual ~NonCopyable();=0D
+-    };=0D
+-=0D
+-    class SafeBool {=0D
+-    public:=0D
+-        typedef void (SafeBool::*type)() const;=0D
+-=0D
+-        static type makeSafe( bool value ) {=0D
+-            return value ? &SafeBool::trueValue : 0;=0D
+-        }=0D
+-    private:=0D
+-        void trueValue() const {}=0D
+-    };=0D
+-=0D
+-    template<typename ContainerT>=0D
+-    inline void deleteAll( ContainerT& container ) {=0D
+-        typename ContainerT::const_iterator it =3D container.begin();=0D
+-        typename ContainerT::const_iterator itEnd =3D container.end();=0D
+-        for(; it !=3D itEnd; ++it )=0D
+-            delete *it;=0D
+-    }=0D
+-    template<typename AssociativeContainerT>=0D
+-    inline void deleteAllValues( AssociativeContainerT& container ) {=0D
+-        typename AssociativeContainerT::const_iterator it =3D container.b=
egin();=0D
+-        typename AssociativeContainerT::const_iterator itEnd =3D containe=
r.end();=0D
+-        for(; it !=3D itEnd; ++it )=0D
+-            delete it->second;=0D
+-    }=0D
+-=0D
+-    bool startsWith( std::string const& s, std::string const& prefix );=0D
+-    bool endsWith( std::string const& s, std::string const& suffix );=0D
+-    bool contains( std::string const& s, std::string const& infix );=0D
+-    void toLowerInPlace( std::string& s );=0D
+-    std::string toLower( std::string const& s );=0D
+-    std::string trim( std::string const& str );=0D
+-    bool replaceInPlace( std::string& str, std::string const& replaceThis=
, std::string const& withThis );=0D
+-=0D
+-    struct pluralise {=0D
+-        pluralise( std::size_t count, std::string const& label );=0D
+-=0D
+-        friend std::ostream& operator << ( std::ostream& os, pluralise co=
nst& pluraliser );=0D
+-=0D
+-        std::size_t m_count;=0D
+-        std::string m_label;=0D
+-    };=0D
+-=0D
+-    struct SourceLineInfo {=0D
+-=0D
+-        SourceLineInfo();=0D
+-        SourceLineInfo( char const* _file, std::size_t _line );=0D
+-        SourceLineInfo( SourceLineInfo const& other );=0D
+-#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-        SourceLineInfo( SourceLineInfo && )                  =3D default;=
=0D
+-        SourceLineInfo& operator =3D ( SourceLineInfo const& ) =3D defaul=
t;=0D
+-        SourceLineInfo& operator =3D ( SourceLineInfo && )     =3D defaul=
t;=0D
+-#  endif=0D
+-        bool empty() const;=0D
+-        bool operator =3D=3D ( SourceLineInfo const& other ) const;=0D
+-        bool operator < ( SourceLineInfo const& other ) const;=0D
+-=0D
+-        std::string file;=0D
+-        std::size_t line;=0D
+-    };=0D
+-=0D
+-    std::ostream& operator << ( std::ostream& os, SourceLineInfo const& i=
nfo );=0D
+-=0D
+-    // This is just here to avoid compiler warnings with macro constants =
and boolean literals=0D
+-    inline bool alwaysTrue( std::size_t =3D 0 ) { return true; }=0D
+-    inline bool alwaysFalse( std::size_t =3D 0 ) { return false; }=0D
+-=0D
+-    void throwLogicError( std::string const& message, SourceLineInfo cons=
t& locationInfo );=0D
+-=0D
+-    void seedRng( IConfig const& config );=0D
+-    unsigned int rngSeed();=0D
+-=0D
+-    // Use this in variadic streaming macros to allow=0D
+-    //    >> +StreamEndStop=0D
+-    // as well as=0D
+-    //    >> stuff +StreamEndStop=0D
+-    struct StreamEndStop {=0D
+-        std::string operator+() {=0D
+-            return std::string();=0D
+-        }=0D
+-    };=0D
+-    template<typename T>=0D
+-    T const& operator + ( T const& value, StreamEndStop ) {=0D
+-        return value;=0D
+-    }=0D
+-}=0D
+-=0D
+-#define CATCH_INTERNAL_LINEINFO ::Catch::SourceLineInfo( __FILE__, static=
_cast<std::size_t>( __LINE__ ) )=0D
+-#define CATCH_INTERNAL_ERROR( msg ) ::Catch::throwLogicError( msg, CATCH_=
INTERNAL_LINEINFO );=0D
+-=0D
+-#include <ostream>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class NotImplementedException : public std::exception=0D
+-    {=0D
+-    public:=0D
+-        NotImplementedException( SourceLineInfo const& lineInfo );=0D
+-        NotImplementedException( NotImplementedException const& ) {}=0D
+-=0D
+-        virtual ~NotImplementedException() CATCH_NOEXCEPT {}=0D
+-=0D
+-        virtual const char* what() const CATCH_NOEXCEPT;=0D
+-=0D
+-    private:=0D
+-        std::string m_what;=0D
+-        SourceLineInfo m_lineInfo;=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define CATCH_NOT_IMPLEMENTED throw Catch::NotImplementedException( CATCH=
_INTERNAL_LINEINFO )=0D
+-=0D
+-// #included from: internal/catch_context.h=0D
+-#define TWOBLUECUBES_CATCH_CONTEXT_H_INCLUDED=0D
+-=0D
+-// #included from: catch_interfaces_generators.h=0D
+-#define TWOBLUECUBES_CATCH_INTERFACES_GENERATORS_H_INCLUDED=0D
+-=0D
+-#include <string>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct IGeneratorInfo {=0D
+-        virtual ~IGeneratorInfo();=0D
+-        virtual bool moveNext() =3D 0;=0D
+-        virtual std::size_t getCurrentIndex() const =3D 0;=0D
+-    };=0D
+-=0D
+-    struct IGeneratorsForTest {=0D
+-        virtual ~IGeneratorsForTest();=0D
+-=0D
+-        virtual IGeneratorInfo& getGeneratorInfo( std::string const& file=
Info, std::size_t size ) =3D 0;=0D
+-        virtual bool moveNext() =3D 0;=0D
+-    };=0D
+-=0D
+-    IGeneratorsForTest* createGeneratorsForTest();=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_ptr.hpp=0D
+-#define TWOBLUECUBES_CATCH_PTR_HPP_INCLUDED=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic push=0D
+-#pragma clang diagnostic ignored "-Wpadded"=0D
+-#endif=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    // An intrusive reference counting smart pointer.=0D
+-    // T must implement addRef() and release() methods=0D
+-    // typically implementing the IShared interface=0D
+-    template<typename T>=0D
+-    class Ptr {=0D
+-    public:=0D
+-        Ptr() : m_p( CATCH_NULL ){}=0D
+-        Ptr( T* p ) : m_p( p ){=0D
+-            if( m_p )=0D
+-                m_p->addRef();=0D
+-        }=0D
+-        Ptr( Ptr const& other ) : m_p( other.m_p ){=0D
+-            if( m_p )=0D
+-                m_p->addRef();=0D
+-        }=0D
+-        ~Ptr(){=0D
+-            if( m_p )=0D
+-                m_p->release();=0D
+-        }=0D
+-        void reset() {=0D
+-            if( m_p )=0D
+-                m_p->release();=0D
+-            m_p =3D CATCH_NULL;=0D
+-        }=0D
+-        Ptr& operator =3D ( T* p ){=0D
+-            Ptr temp( p );=0D
+-            swap( temp );=0D
+-            return *this;=0D
+-        }=0D
+-        Ptr& operator =3D ( Ptr const& other ){=0D
+-            Ptr temp( other );=0D
+-            swap( temp );=0D
+-            return *this;=0D
+-        }=0D
+-        void swap( Ptr& other ) { std::swap( m_p, other.m_p ); }=0D
+-        T* get() const{ return m_p; }=0D
+-        T& operator*() const { return *m_p; }=0D
+-        T* operator->() const { return m_p; }=0D
+-        bool operator !() const { return m_p =3D=3D CATCH_NULL; }=0D
+-        operator SafeBool::type() const { return SafeBool::makeSafe( m_p =
!=3D CATCH_NULL ); }=0D
+-=0D
+-    private:=0D
+-        T* m_p;=0D
+-    };=0D
+-=0D
+-    struct IShared : NonCopyable {=0D
+-        virtual ~IShared();=0D
+-        virtual void addRef() const =3D 0;=0D
+-        virtual void release() const =3D 0;=0D
+-    };=0D
+-=0D
+-    template<typename T =3D IShared>=0D
+-    struct SharedImpl : T {=0D
+-=0D
+-        SharedImpl() : m_rc( 0 ){}=0D
+-=0D
+-        virtual void addRef() const {=0D
+-            ++m_rc;=0D
+-        }=0D
+-        virtual void release() const {=0D
+-            if( --m_rc =3D=3D 0 )=0D
+-                delete this;=0D
+-        }=0D
+-=0D
+-        mutable unsigned int m_rc;=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic pop=0D
+-#endif=0D
+-=0D
+-#include <memory>=0D
+-#include <vector>=0D
+-#include <stdlib.h>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class TestCase;=0D
+-    class Stream;=0D
+-    struct IResultCapture;=0D
+-    struct IRunner;=0D
+-    struct IGeneratorsForTest;=0D
+-    struct IConfig;=0D
+-=0D
+-    struct IContext=0D
+-    {=0D
+-        virtual ~IContext();=0D
+-=0D
+-        virtual IResultCapture* getResultCapture() =3D 0;=0D
+-        virtual IRunner* getRunner() =3D 0;=0D
+-        virtual size_t getGeneratorIndex( std::string const& fileInfo, si=
ze_t totalSize ) =3D 0;=0D
+-        virtual bool advanceGeneratorsForCurrentTest() =3D 0;=0D
+-        virtual Ptr<IConfig const> getConfig() const =3D 0;=0D
+-    };=0D
+-=0D
+-    struct IMutableContext : IContext=0D
+-    {=0D
+-        virtual ~IMutableContext();=0D
+-        virtual void setResultCapture( IResultCapture* resultCapture ) =
=3D 0;=0D
+-        virtual void setRunner( IRunner* runner ) =3D 0;=0D
+-        virtual void setConfig( Ptr<IConfig const> const& config ) =3D 0;=
=0D
+-    };=0D
+-=0D
+-    IContext& getCurrentContext();=0D
+-    IMutableContext& getCurrentMutableContext();=0D
+-    void cleanUpContext();=0D
+-    Stream createStream( std::string const& streamName );=0D
+-=0D
+-}=0D
+-=0D
+-// #included from: internal/catch_test_registry.hpp=0D
+-#define TWOBLUECUBES_CATCH_TEST_REGISTRY_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_interfaces_testcase.h=0D
+-#define TWOBLUECUBES_CATCH_INTERFACES_TESTCASE_H_INCLUDED=0D
+-=0D
+-#include <vector>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class TestSpec;=0D
+-=0D
+-    struct ITestCase : IShared {=0D
+-        virtual void invoke () const =3D 0;=0D
+-    protected:=0D
+-        virtual ~ITestCase();=0D
+-    };=0D
+-=0D
+-    class TestCase;=0D
+-    struct IConfig;=0D
+-=0D
+-    struct ITestCaseRegistry {=0D
+-        virtual ~ITestCaseRegistry();=0D
+-        virtual std::vector<TestCase> const& getAllTests() const =3D 0;=0D
+-        virtual std::vector<TestCase> const& getAllTestsSorted( IConfig c=
onst& config ) const =3D 0;=0D
+-    };=0D
+-=0D
+-    bool matchTest( TestCase const& testCase, TestSpec const& testSpec, I=
Config const& config );=0D
+-    std::vector<TestCase> filterTests( std::vector<TestCase> const& testC=
ases, TestSpec const& testSpec, IConfig const& config );=0D
+-    std::vector<TestCase> const& getAllTestCasesSorted( IConfig const& co=
nfig );=0D
+-=0D
+-}=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-template<typename C>=0D
+-class MethodTestCase : public SharedImpl<ITestCase> {=0D
+-=0D
+-public:=0D
+-    MethodTestCase( void (C::*method)() ) : m_method( method ) {}=0D
+-=0D
+-    virtual void invoke() const {=0D
+-        C obj;=0D
+-        (obj.*m_method)();=0D
+-    }=0D
+-=0D
+-private:=0D
+-    virtual ~MethodTestCase() {}=0D
+-=0D
+-    void (C::*m_method)();=0D
+-};=0D
+-=0D
+-typedef void(*TestFunction)();=0D
+-=0D
+-struct NameAndDesc {=0D
+-    NameAndDesc( const char* _name =3D "", const char* _description=3D ""=
 )=0D
+-    : name( _name ), description( _description )=0D
+-    {}=0D
+-=0D
+-    const char* name;=0D
+-    const char* description;=0D
+-};=0D
+-=0D
+-void registerTestCase=0D
+-    (   ITestCase* testCase,=0D
+-        char const* className,=0D
+-        NameAndDesc const& nameAndDesc,=0D
+-        SourceLineInfo const& lineInfo );=0D
+-=0D
+-struct AutoReg {=0D
+-=0D
+-    AutoReg=0D
+-        (   TestFunction function,=0D
+-            SourceLineInfo const& lineInfo,=0D
+-            NameAndDesc const& nameAndDesc );=0D
+-=0D
+-    template<typename C>=0D
+-    AutoReg=0D
+-        (   void (C::*method)(),=0D
+-            char const* className,=0D
+-            NameAndDesc const& nameAndDesc,=0D
+-            SourceLineInfo const& lineInfo ) {=0D
+-=0D
+-        registerTestCase=0D
+-            (   new MethodTestCase<C>( method ),=0D
+-                className,=0D
+-                nameAndDesc,=0D
+-                lineInfo );=0D
+-    }=0D
+-=0D
+-    ~AutoReg();=0D
+-=0D
+-private:=0D
+-    AutoReg( AutoReg const& );=0D
+-    void operator=3D ( AutoReg const& );=0D
+-};=0D
+-=0D
+-void registerTestCaseFunction=0D
+-    (   TestFunction function,=0D
+-        SourceLineInfo const& lineInfo,=0D
+-        NameAndDesc const& nameAndDesc );=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-#ifdef CATCH_CONFIG_VARIADIC_MACROS=0D
+-    /////////////////////////////////////////////////////////////////////=
//////////=0D
+-    #define INTERNAL_CATCH_TESTCASE2( TestName, ... ) \=0D
+-        static void TestName(); \=0D
+-        namespace{ Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistr=
ar )( &TestName, CATCH_INTERNAL_LINEINFO, Catch::NameAndDesc( __VA_ARGS__ )=
 ); }\=0D
+-        static void TestName()=0D
+-    #define INTERNAL_CATCH_TESTCASE( ... ) \=0D
+-        INTERNAL_CATCH_TESTCASE2( INTERNAL_CATCH_UNIQUE_NAME( ____C_A_T_C=
_H____T_E_S_T____ ), __VA_ARGS__ )=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////////=0D
+-    #define INTERNAL_CATCH_METHOD_AS_TEST_CASE( QualifiedMethod, ... ) \=
=0D
+-        namespace{ Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistr=
ar )( &QualifiedMethod, "&" #QualifiedMethod, Catch::NameAndDesc( __VA_ARGS=
__ ), CATCH_INTERNAL_LINEINFO ); }=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////////=0D
+-    #define INTERNAL_CATCH_TEST_CASE_METHOD2( TestName, ClassName, ... )\=
=0D
+-        namespace{ \=0D
+-            struct TestName : ClassName{ \=0D
+-                void test(); \=0D
+-            }; \=0D
+-            Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistrar ) ( =
&TestName::test, #ClassName, Catch::NameAndDesc( __VA_ARGS__ ), CATCH_INTER=
NAL_LINEINFO ); \=0D
+-        } \=0D
+-        void TestName::test()=0D
+-    #define INTERNAL_CATCH_TEST_CASE_METHOD( ClassName, ... ) \=0D
+-        INTERNAL_CATCH_TEST_CASE_METHOD2( INTERNAL_CATCH_UNIQUE_NAME( ___=
_C_A_T_C_H____T_E_S_T____ ), ClassName, __VA_ARGS__ )=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////////=0D
+-    #define INTERNAL_CATCH_REGISTER_TESTCASE( Function, ... ) \=0D
+-        Catch::AutoReg( Function, CATCH_INTERNAL_LINEINFO, Catch::NameAnd=
Desc( __VA_ARGS__ ) );=0D
+-=0D
+-#else=0D
+-    /////////////////////////////////////////////////////////////////////=
//////////=0D
+-    #define INTERNAL_CATCH_TESTCASE2( TestName, Name, Desc ) \=0D
+-        static void TestName(); \=0D
+-        namespace{ Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistr=
ar )( &TestName, CATCH_INTERNAL_LINEINFO, Catch::NameAndDesc( Name, Desc ) =
); }\=0D
+-        static void TestName()=0D
+-    #define INTERNAL_CATCH_TESTCASE( Name, Desc ) \=0D
+-        INTERNAL_CATCH_TESTCASE2( INTERNAL_CATCH_UNIQUE_NAME( ____C_A_T_C=
_H____T_E_S_T____ ), Name, Desc )=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////////=0D
+-    #define INTERNAL_CATCH_METHOD_AS_TEST_CASE( QualifiedMethod, Name, De=
sc ) \=0D
+-        namespace{ Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistr=
ar )( &QualifiedMethod, "&" #QualifiedMethod, Catch::NameAndDesc( Name, Des=
c ), CATCH_INTERNAL_LINEINFO ); }=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////////=0D
+-    #define INTERNAL_CATCH_TEST_CASE_METHOD2( TestCaseName, ClassName, Te=
stName, Desc )\=0D
+-        namespace{ \=0D
+-            struct TestCaseName : ClassName{ \=0D
+-                void test(); \=0D
+-            }; \=0D
+-            Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistrar ) ( =
&TestCaseName::test, #ClassName, Catch::NameAndDesc( TestName, Desc ), CATC=
H_INTERNAL_LINEINFO ); \=0D
+-        } \=0D
+-        void TestCaseName::test()=0D
+-    #define INTERNAL_CATCH_TEST_CASE_METHOD( ClassName, TestName, Desc )\=
=0D
+-        INTERNAL_CATCH_TEST_CASE_METHOD2( INTERNAL_CATCH_UNIQUE_NAME( ___=
_C_A_T_C_H____T_E_S_T____ ), ClassName, TestName, Desc )=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////////=0D
+-    #define INTERNAL_CATCH_REGISTER_TESTCASE( Function, Name, Desc ) \=0D
+-        Catch::AutoReg( Function, CATCH_INTERNAL_LINEINFO, Catch::NameAnd=
Desc( Name, Desc ) );=0D
+-#endif=0D
+-=0D
+-// #included from: internal/catch_capture.hpp=0D
+-#define TWOBLUECUBES_CATCH_CAPTURE_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_result_builder.h=0D
+-#define TWOBLUECUBES_CATCH_RESULT_BUILDER_H_INCLUDED=0D
+-=0D
+-// #included from: catch_result_type.h=0D
+-#define TWOBLUECUBES_CATCH_RESULT_TYPE_H_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    // ResultWas::OfType enum=0D
+-    struct ResultWas { enum OfType {=0D
+-        Unknown =3D -1,=0D
+-        Ok =3D 0,=0D
+-        Info =3D 1,=0D
+-        Warning =3D 2,=0D
+-=0D
+-        FailureBit =3D 0x10,=0D
+-=0D
+-        ExpressionFailed =3D FailureBit | 1,=0D
+-        ExplicitFailure =3D FailureBit | 2,=0D
+-=0D
+-        Exception =3D 0x100 | FailureBit,=0D
+-=0D
+-        ThrewException =3D Exception | 1,=0D
+-        DidntThrowException =3D Exception | 2,=0D
+-=0D
+-        FatalErrorCondition =3D 0x200 | FailureBit=0D
+-=0D
+-    }; };=0D
+-=0D
+-    inline bool isOk( ResultWas::OfType resultType ) {=0D
+-        return ( resultType & ResultWas::FailureBit ) =3D=3D 0;=0D
+-    }=0D
+-    inline bool isJustInfo( int flags ) {=0D
+-        return flags =3D=3D ResultWas::Info;=0D
+-    }=0D
+-=0D
+-    // ResultDisposition::Flags enum=0D
+-    struct ResultDisposition { enum Flags {=0D
+-        Normal =3D 0x01,=0D
+-=0D
+-        ContinueOnFailure =3D 0x02,   // Failures fail test, but executio=
n continues=0D
+-        FalseTest =3D 0x04,           // Prefix expression with !=0D
+-        SuppressFail =3D 0x08         // Failures are reported but do not=
 fail the test=0D
+-    }; };=0D
+-=0D
+-    inline ResultDisposition::Flags operator | ( ResultDisposition::Flags=
 lhs, ResultDisposition::Flags rhs ) {=0D
+-        return static_cast<ResultDisposition::Flags>( static_cast<int>( l=
hs ) | static_cast<int>( rhs ) );=0D
+-    }=0D
+-=0D
+-    inline bool shouldContinueOnFailure( int flags )    { return ( flags =
& ResultDisposition::ContinueOnFailure ) !=3D 0; }=0D
+-    inline bool isFalseTest( int flags )                { return ( flags =
& ResultDisposition::FalseTest ) !=3D 0; }=0D
+-    inline bool shouldSuppressFailure( int flags )      { return ( flags =
& ResultDisposition::SuppressFail ) !=3D 0; }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_assertionresult.h=0D
+-#define TWOBLUECUBES_CATCH_ASSERTIONRESULT_H_INCLUDED=0D
+-=0D
+-#include <string>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct AssertionInfo=0D
+-    {=0D
+-        AssertionInfo() {}=0D
+-        AssertionInfo(  std::string const& _macroName,=0D
+-                        SourceLineInfo const& _lineInfo,=0D
+-                        std::string const& _capturedExpression,=0D
+-                        ResultDisposition::Flags _resultDisposition );=0D
+-=0D
+-        std::string macroName;=0D
+-        SourceLineInfo lineInfo;=0D
+-        std::string capturedExpression;=0D
+-        ResultDisposition::Flags resultDisposition;=0D
+-    };=0D
+-=0D
+-    struct AssertionResultData=0D
+-    {=0D
+-        AssertionResultData() : resultType( ResultWas::Unknown ) {}=0D
+-=0D
+-        std::string reconstructedExpression;=0D
+-        std::string message;=0D
+-        ResultWas::OfType resultType;=0D
+-    };=0D
+-=0D
+-    class AssertionResult {=0D
+-    public:=0D
+-        AssertionResult();=0D
+-        AssertionResult( AssertionInfo const& info, AssertionResultData c=
onst& data );=0D
+-        ~AssertionResult();=0D
+-#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-         AssertionResult( AssertionResult const& )              =3D defau=
lt;=0D
+-         AssertionResult( AssertionResult && )                  =3D defau=
lt;=0D
+-         AssertionResult& operator =3D ( AssertionResult const& ) =3D def=
ault;=0D
+-         AssertionResult& operator =3D ( AssertionResult && )     =3D def=
ault;=0D
+-#  endif=0D
+-=0D
+-        bool isOk() const;=0D
+-        bool succeeded() const;=0D
+-        ResultWas::OfType getResultType() const;=0D
+-        bool hasExpression() const;=0D
+-        bool hasMessage() const;=0D
+-        std::string getExpression() const;=0D
+-        std::string getExpressionInMacro() const;=0D
+-        bool hasExpandedExpression() const;=0D
+-        std::string getExpandedExpression() const;=0D
+-        std::string getMessage() const;=0D
+-        SourceLineInfo getSourceInfo() const;=0D
+-        std::string getTestMacroName() const;=0D
+-=0D
+-    protected:=0D
+-        AssertionInfo m_info;=0D
+-        AssertionResultData m_resultData;=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_matchers.hpp=0D
+-#define TWOBLUECUBES_CATCH_MATCHERS_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-namespace Matchers {=0D
+-    namespace Impl {=0D
+-=0D
+-    namespace Generic {=0D
+-        template<typename ExpressionT> class AllOf;=0D
+-        template<typename ExpressionT> class AnyOf;=0D
+-        template<typename ExpressionT> class Not;=0D
+-    }=0D
+-=0D
+-    template<typename ExpressionT>=0D
+-    struct Matcher : SharedImpl<IShared>=0D
+-    {=0D
+-        typedef ExpressionT ExpressionType;=0D
+-=0D
+-        virtual ~Matcher() {}=0D
+-        virtual Ptr<Matcher> clone() const =3D 0;=0D
+-        virtual bool match( ExpressionT const& expr ) const =3D 0;=0D
+-        virtual std::string toString() const =3D 0;=0D
+-=0D
+-        Generic::AllOf<ExpressionT> operator && ( Matcher<ExpressionT> co=
nst& other ) const;=0D
+-        Generic::AnyOf<ExpressionT> operator || ( Matcher<ExpressionT> co=
nst& other ) const;=0D
+-        Generic::Not<ExpressionT> operator ! () const;=0D
+-    };=0D
+-=0D
+-    template<typename DerivedT, typename ExpressionT>=0D
+-    struct MatcherImpl : Matcher<ExpressionT> {=0D
+-=0D
+-        virtual Ptr<Matcher<ExpressionT> > clone() const {=0D
+-            return Ptr<Matcher<ExpressionT> >( new DerivedT( static_cast<=
DerivedT const&>( *this ) ) );=0D
+-        }=0D
+-    };=0D
+-=0D
+-    namespace Generic {=0D
+-        template<typename ExpressionT>=0D
+-        class Not : public MatcherImpl<Not<ExpressionT>, ExpressionT> {=0D
+-        public:=0D
+-            explicit Not( Matcher<ExpressionT> const& matcher ) : m_match=
er(matcher.clone()) {}=0D
+-            Not( Not const& other ) : m_matcher( other.m_matcher ) {}=0D
+-=0D
+-            virtual bool match( ExpressionT const& expr ) const CATCH_OVE=
RRIDE {=0D
+-                return !m_matcher->match( expr );=0D
+-            }=0D
+-=0D
+-            virtual std::string toString() const CATCH_OVERRIDE {=0D
+-                return "not " + m_matcher->toString();=0D
+-            }=0D
+-        private:=0D
+-            Ptr< Matcher<ExpressionT> > m_matcher;=0D
+-        };=0D
+-=0D
+-        template<typename ExpressionT>=0D
+-        class AllOf : public MatcherImpl<AllOf<ExpressionT>, ExpressionT>=
 {=0D
+-        public:=0D
+-=0D
+-            AllOf() {}=0D
+-            AllOf( AllOf const& other ) : m_matchers( other.m_matchers ) =
{}=0D
+-=0D
+-            AllOf& add( Matcher<ExpressionT> const& matcher ) {=0D
+-                m_matchers.push_back( matcher.clone() );=0D
+-                return *this;=0D
+-            }=0D
+-            virtual bool match( ExpressionT const& expr ) const=0D
+-            {=0D
+-                for( std::size_t i =3D 0; i < m_matchers.size(); ++i )=0D
+-                    if( !m_matchers[i]->match( expr ) )=0D
+-                        return false;=0D
+-                return true;=0D
+-            }=0D
+-            virtual std::string toString() const {=0D
+-                std::ostringstream oss;=0D
+-                oss << "( ";=0D
+-                for( std::size_t i =3D 0; i < m_matchers.size(); ++i ) {=
=0D
+-                    if( i !=3D 0 )=0D
+-                        oss << " and ";=0D
+-                    oss << m_matchers[i]->toString();=0D
+-                }=0D
+-                oss << " )";=0D
+-                return oss.str();=0D
+-            }=0D
+-=0D
+-            AllOf operator && ( Matcher<ExpressionT> const& other ) const=
 {=0D
+-                AllOf allOfExpr( *this );=0D
+-                allOfExpr.add( other );=0D
+-                return allOfExpr;=0D
+-            }=0D
+-=0D
+-        private:=0D
+-            std::vector<Ptr<Matcher<ExpressionT> > > m_matchers;=0D
+-        };=0D
+-=0D
+-        template<typename ExpressionT>=0D
+-        class AnyOf : public MatcherImpl<AnyOf<ExpressionT>, ExpressionT>=
 {=0D
+-        public:=0D
+-=0D
+-            AnyOf() {}=0D
+-            AnyOf( AnyOf const& other ) : m_matchers( other.m_matchers ) =
{}=0D
+-=0D
+-            AnyOf& add( Matcher<ExpressionT> const& matcher ) {=0D
+-                m_matchers.push_back( matcher.clone() );=0D
+-                return *this;=0D
+-            }=0D
+-            virtual bool match( ExpressionT const& expr ) const=0D
+-            {=0D
+-                for( std::size_t i =3D 0; i < m_matchers.size(); ++i )=0D
+-                    if( m_matchers[i]->match( expr ) )=0D
+-                        return true;=0D
+-                return false;=0D
+-            }=0D
+-            virtual std::string toString() const {=0D
+-                std::ostringstream oss;=0D
+-                oss << "( ";=0D
+-                for( std::size_t i =3D 0; i < m_matchers.size(); ++i ) {=
=0D
+-                    if( i !=3D 0 )=0D
+-                        oss << " or ";=0D
+-                    oss << m_matchers[i]->toString();=0D
+-                }=0D
+-                oss << " )";=0D
+-                return oss.str();=0D
+-            }=0D
+-=0D
+-            AnyOf operator || ( Matcher<ExpressionT> const& other ) const=
 {=0D
+-                AnyOf anyOfExpr( *this );=0D
+-                anyOfExpr.add( other );=0D
+-                return anyOfExpr;=0D
+-            }=0D
+-=0D
+-        private:=0D
+-            std::vector<Ptr<Matcher<ExpressionT> > > m_matchers;=0D
+-        };=0D
+-=0D
+-    } // namespace Generic=0D
+-=0D
+-    template<typename ExpressionT>=0D
+-    Generic::AllOf<ExpressionT> Matcher<ExpressionT>::operator && ( Match=
er<ExpressionT> const& other ) const {=0D
+-        Generic::AllOf<ExpressionT> allOfExpr;=0D
+-        allOfExpr.add( *this );=0D
+-        allOfExpr.add( other );=0D
+-        return allOfExpr;=0D
+-    }=0D
+-=0D
+-    template<typename ExpressionT>=0D
+-    Generic::AnyOf<ExpressionT> Matcher<ExpressionT>::operator || ( Match=
er<ExpressionT> const& other ) const {=0D
+-        Generic::AnyOf<ExpressionT> anyOfExpr;=0D
+-        anyOfExpr.add( *this );=0D
+-        anyOfExpr.add( other );=0D
+-        return anyOfExpr;=0D
+-    }=0D
+-=0D
+-    template<typename ExpressionT>=0D
+-    Generic::Not<ExpressionT> Matcher<ExpressionT>::operator ! () const {=
=0D
+-        return Generic::Not<ExpressionT>( *this );=0D
+-    }=0D
+-=0D
+-    namespace StdString {=0D
+-=0D
+-        inline std::string makeString( std::string const& str ) { return =
str; }=0D
+-        inline std::string makeString( const char* str ) { return str ? s=
td::string( str ) : std::string(); }=0D
+-=0D
+-        struct CasedString=0D
+-        {=0D
+-            CasedString( std::string const& str, CaseSensitive::Choice ca=
seSensitivity )=0D
+-            :   m_caseSensitivity( caseSensitivity ),=0D
+-                m_str( adjustString( str ) )=0D
+-            {}=0D
+-            std::string adjustString( std::string const& str ) const {=0D
+-                return m_caseSensitivity =3D=3D CaseSensitive::No=0D
+-                    ? toLower( str )=0D
+-                    : str;=0D
+-=0D
+-            }=0D
+-            std::string toStringSuffix() const=0D
+-            {=0D
+-                return m_caseSensitivity =3D=3D CaseSensitive::No=0D
+-                    ? " (case insensitive)"=0D
+-                    : "";=0D
+-            }=0D
+-            CaseSensitive::Choice m_caseSensitivity;=0D
+-            std::string m_str;=0D
+-        };=0D
+-=0D
+-        struct Equals : MatcherImpl<Equals, std::string> {=0D
+-            Equals( std::string const& str, CaseSensitive::Choice caseSen=
sitivity =3D CaseSensitive::Yes )=0D
+-            :   m_data( str, caseSensitivity )=0D
+-            {}=0D
+-            Equals( Equals const& other ) : m_data( other.m_data ){}=0D
+-=0D
+-            virtual ~Equals();=0D
+-=0D
+-            virtual bool match( std::string const& expr ) const {=0D
+-                return m_data.m_str =3D=3D m_data.adjustString( expr );;=
=0D
+-            }=0D
+-            virtual std::string toString() const {=0D
+-                return "equals: \"" + m_data.m_str + "\"" + m_data.toStri=
ngSuffix();=0D
+-            }=0D
+-=0D
+-            CasedString m_data;=0D
+-        };=0D
+-=0D
+-        struct Contains : MatcherImpl<Contains, std::string> {=0D
+-            Contains( std::string const& substr, CaseSensitive::Choice ca=
seSensitivity =3D CaseSensitive::Yes )=0D
+-            : m_data( substr, caseSensitivity ){}=0D
+-            Contains( Contains const& other ) : m_data( other.m_data ){}=
=0D
+-=0D
+-            virtual ~Contains();=0D
+-=0D
+-            virtual bool match( std::string const& expr ) const {=0D
+-                return m_data.adjustString( expr ).find( m_data.m_str ) !=
=3D std::string::npos;=0D
+-            }=0D
+-            virtual std::string toString() const {=0D
+-                return "contains: \"" + m_data.m_str  + "\"" + m_data.toS=
tringSuffix();=0D
+-            }=0D
+-=0D
+-            CasedString m_data;=0D
+-        };=0D
+-=0D
+-        struct StartsWith : MatcherImpl<StartsWith, std::string> {=0D
+-            StartsWith( std::string const& substr, CaseSensitive::Choice =
caseSensitivity =3D CaseSensitive::Yes )=0D
+-            : m_data( substr, caseSensitivity ){}=0D
+-=0D
+-            StartsWith( StartsWith const& other ) : m_data( other.m_data =
){}=0D
+-=0D
+-            virtual ~StartsWith();=0D
+-=0D
+-            virtual bool match( std::string const& expr ) const {=0D
+-                return startsWith( m_data.adjustString( expr ), m_data.m_=
str );=0D
+-            }=0D
+-            virtual std::string toString() const {=0D
+-                return "starts with: \"" + m_data.m_str + "\"" + m_data.t=
oStringSuffix();=0D
+-            }=0D
+-=0D
+-            CasedString m_data;=0D
+-        };=0D
+-=0D
+-        struct EndsWith : MatcherImpl<EndsWith, std::string> {=0D
+-            EndsWith( std::string const& substr, CaseSensitive::Choice ca=
seSensitivity =3D CaseSensitive::Yes )=0D
+-            : m_data( substr, caseSensitivity ){}=0D
+-            EndsWith( EndsWith const& other ) : m_data( other.m_data ){}=
=0D
+-=0D
+-            virtual ~EndsWith();=0D
+-=0D
+-            virtual bool match( std::string const& expr ) const {=0D
+-                return endsWith( m_data.adjustString( expr ), m_data.m_st=
r );=0D
+-            }=0D
+-            virtual std::string toString() const {=0D
+-                return "ends with: \"" + m_data.m_str + "\"" + m_data.toS=
tringSuffix();=0D
+-            }=0D
+-=0D
+-            CasedString m_data;=0D
+-        };=0D
+-    } // namespace StdString=0D
+-    } // namespace Impl=0D
+-=0D
+-    // The following functions create the actual matcher objects.=0D
+-    // This allows the types to be inferred=0D
+-    template<typename ExpressionT>=0D
+-    inline Impl::Generic::Not<ExpressionT> Not( Impl::Matcher<ExpressionT=
> const& m ) {=0D
+-        return Impl::Generic::Not<ExpressionT>( m );=0D
+-    }=0D
+-=0D
+-    template<typename ExpressionT>=0D
+-    inline Impl::Generic::AllOf<ExpressionT> AllOf( Impl::Matcher<Express=
ionT> const& m1,=0D
+-                                                    Impl::Matcher<Express=
ionT> const& m2 ) {=0D
+-        return Impl::Generic::AllOf<ExpressionT>().add( m1 ).add( m2 );=0D
+-    }=0D
+-    template<typename ExpressionT>=0D
+-    inline Impl::Generic::AllOf<ExpressionT> AllOf( Impl::Matcher<Express=
ionT> const& m1,=0D
+-                                                    Impl::Matcher<Express=
ionT> const& m2,=0D
+-                                                    Impl::Matcher<Express=
ionT> const& m3 ) {=0D
+-        return Impl::Generic::AllOf<ExpressionT>().add( m1 ).add( m2 ).ad=
d( m3 );=0D
+-    }=0D
+-    template<typename ExpressionT>=0D
+-    inline Impl::Generic::AnyOf<ExpressionT> AnyOf( Impl::Matcher<Express=
ionT> const& m1,=0D
+-                                                    Impl::Matcher<Express=
ionT> const& m2 ) {=0D
+-        return Impl::Generic::AnyOf<ExpressionT>().add( m1 ).add( m2 );=0D
+-    }=0D
+-    template<typename ExpressionT>=0D
+-    inline Impl::Generic::AnyOf<ExpressionT> AnyOf( Impl::Matcher<Express=
ionT> const& m1,=0D
+-                                                    Impl::Matcher<Express=
ionT> const& m2,=0D
+-                                                    Impl::Matcher<Express=
ionT> const& m3 ) {=0D
+-        return Impl::Generic::AnyOf<ExpressionT>().add( m1 ).add( m2 ).ad=
d( m3 );=0D
+-    }=0D
+-=0D
+-    inline Impl::StdString::Equals      Equals( std::string const& str, C=
aseSensitive::Choice caseSensitivity =3D CaseSensitive::Yes ) {=0D
+-        return Impl::StdString::Equals( str, caseSensitivity );=0D
+-    }=0D
+-    inline Impl::StdString::Equals      Equals( const char* str, CaseSens=
itive::Choice caseSensitivity =3D CaseSensitive::Yes ) {=0D
+-        return Impl::StdString::Equals( Impl::StdString::makeString( str =
), caseSensitivity );=0D
+-    }=0D
+-    inline Impl::StdString::Contains    Contains( std::string const& subs=
tr, CaseSensitive::Choice caseSensitivity =3D CaseSensitive::Yes ) {=0D
+-        return Impl::StdString::Contains( substr, caseSensitivity );=0D
+-    }=0D
+-    inline Impl::StdString::Contains    Contains( const char* substr, Cas=
eSensitive::Choice caseSensitivity =3D CaseSensitive::Yes ) {=0D
+-        return Impl::StdString::Contains( Impl::StdString::makeString( su=
bstr ), caseSensitivity );=0D
+-    }=0D
+-    inline Impl::StdString::StartsWith  StartsWith( std::string const& su=
bstr ) {=0D
+-        return Impl::StdString::StartsWith( substr );=0D
+-    }=0D
+-    inline Impl::StdString::StartsWith  StartsWith( const char* substr ) =
{=0D
+-        return Impl::StdString::StartsWith( Impl::StdString::makeString( =
substr ) );=0D
+-    }=0D
+-    inline Impl::StdString::EndsWith    EndsWith( std::string const& subs=
tr ) {=0D
+-        return Impl::StdString::EndsWith( substr );=0D
+-    }=0D
+-    inline Impl::StdString::EndsWith    EndsWith( const char* substr ) {=
=0D
+-        return Impl::StdString::EndsWith( Impl::StdString::makeString( su=
bstr ) );=0D
+-    }=0D
+-=0D
+-} // namespace Matchers=0D
+-=0D
+-using namespace Matchers;=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct TestFailureException{};=0D
+-=0D
+-    template<typename T> class ExpressionLhs;=0D
+-=0D
+-    struct STATIC_ASSERT_Expression_Too_Complex_Please_Rewrite_As_Binary_=
Comparison;=0D
+-=0D
+-    struct CopyableStream {=0D
+-        CopyableStream() {}=0D
+-        CopyableStream( CopyableStream const& other ) {=0D
+-            oss << other.oss.str();=0D
+-        }=0D
+-        CopyableStream& operator=3D( CopyableStream const& other ) {=0D
+-            oss.str("");=0D
+-            oss << other.oss.str();=0D
+-            return *this;=0D
+-        }=0D
+-        std::ostringstream oss;=0D
+-    };=0D
+-=0D
+-    class ResultBuilder {=0D
+-    public:=0D
+-        ResultBuilder(  char const* macroName,=0D
+-                        SourceLineInfo const& lineInfo,=0D
+-                        char const* capturedExpression,=0D
+-                        ResultDisposition::Flags resultDisposition,=0D
+-                        char const* secondArg =3D "" );=0D
+-=0D
+-        template<typename T>=0D
+-        ExpressionLhs<T const&> operator <=3D ( T const& operand );=0D
+-        ExpressionLhs<bool> operator <=3D ( bool value );=0D
+-=0D
+-        template<typename T>=0D
+-        ResultBuilder& operator << ( T const& value ) {=0D
+-            m_stream.oss << value;=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        template<typename RhsT> STATIC_ASSERT_Expression_Too_Complex_Plea=
se_Rewrite_As_Binary_Comparison& operator && ( RhsT const& );=0D
+-        template<typename RhsT> STATIC_ASSERT_Expression_Too_Complex_Plea=
se_Rewrite_As_Binary_Comparison& operator || ( RhsT const& );=0D
+-=0D
+-        ResultBuilder& setResultType( ResultWas::OfType result );=0D
+-        ResultBuilder& setResultType( bool result );=0D
+-        ResultBuilder& setLhs( std::string const& lhs );=0D
+-        ResultBuilder& setRhs( std::string const& rhs );=0D
+-        ResultBuilder& setOp( std::string const& op );=0D
+-=0D
+-        void endExpression();=0D
+-=0D
+-        std::string reconstructExpression() const;=0D
+-        AssertionResult build() const;=0D
+-=0D
+-        void useActiveException( ResultDisposition::Flags resultDispositi=
on =3D ResultDisposition::Normal );=0D
+-        void captureResult( ResultWas::OfType resultType );=0D
+-        void captureExpression();=0D
+-        void captureExpectedException( std::string const& expectedMessage=
 );=0D
+-        void captureExpectedException( Matchers::Impl::Matcher<std::strin=
g> const& matcher );=0D
+-        void handleResult( AssertionResult const& result );=0D
+-        void react();=0D
+-        bool shouldDebugBreak() const;=0D
+-        bool allowThrows() const;=0D
+-=0D
+-    private:=0D
+-        AssertionInfo m_assertionInfo;=0D
+-        AssertionResultData m_data;=0D
+-        struct ExprComponents {=0D
+-            ExprComponents() : testFalse( false ) {}=0D
+-            bool testFalse;=0D
+-            std::string lhs, rhs, op;=0D
+-        } m_exprComponents;=0D
+-        CopyableStream m_stream;=0D
+-=0D
+-        bool m_shouldDebugBreak;=0D
+-        bool m_shouldThrow;=0D
+-    };=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-// Include after due to circular dependency:=0D
+-// #included from: catch_expression_lhs.hpp=0D
+-#define TWOBLUECUBES_CATCH_EXPRESSION_LHS_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_evaluate.hpp=0D
+-#define TWOBLUECUBES_CATCH_EVALUATE_HPP_INCLUDED=0D
+-=0D
+-#ifdef _MSC_VER=0D
+-#pragma warning(push)=0D
+-#pragma warning(disable:4389) // '=3D=3D' : signed/unsigned mismatch=0D
+-#endif=0D
+-=0D
+-#include <cstddef>=0D
+-=0D
+-namespace Catch {=0D
+-namespace Internal {=0D
+-=0D
+-    enum Operator {=0D
+-        IsEqualTo,=0D
+-        IsNotEqualTo,=0D
+-        IsLessThan,=0D
+-        IsGreaterThan,=0D
+-        IsLessThanOrEqualTo,=0D
+-        IsGreaterThanOrEqualTo=0D
+-    };=0D
+-=0D
+-    template<Operator Op> struct OperatorTraits             { static cons=
t char* getName(){ return "*error*"; } };=0D
+-    template<> struct OperatorTraits<IsEqualTo>             { static cons=
t char* getName(){ return "=3D=3D"; } };=0D
+-    template<> struct OperatorTraits<IsNotEqualTo>          { static cons=
t char* getName(){ return "!=3D"; } };=0D
+-    template<> struct OperatorTraits<IsLessThan>            { static cons=
t char* getName(){ return "<"; } };=0D
+-    template<> struct OperatorTraits<IsGreaterThan>         { static cons=
t char* getName(){ return ">"; } };=0D
+-    template<> struct OperatorTraits<IsLessThanOrEqualTo>   { static cons=
t char* getName(){ return "<=3D"; } };=0D
+-    template<> struct OperatorTraits<IsGreaterThanOrEqualTo>{ static cons=
t char* getName(){ return ">=3D"; } };=0D
+-=0D
+-    template<typename T>=0D
+-    inline T& opCast(T const& t) { return const_cast<T&>(t); }=0D
+-=0D
+-// nullptr_t support based on pull request #154 from Konstantin Baumann=0D
+-#ifdef CATCH_CONFIG_CPP11_NULLPTR=0D
+-    inline std::nullptr_t opCast(std::nullptr_t) { return nullptr; }=0D
+-#endif // CATCH_CONFIG_CPP11_NULLPTR=0D
+-=0D
+-    // So the compare overloads can be operator agnostic we convey the op=
erator as a template=0D
+-    // enum, which is used to specialise an Evaluator for doing the compa=
rison.=0D
+-    template<typename T1, typename T2, Operator Op>=0D
+-    class Evaluator{};=0D
+-=0D
+-    template<typename T1, typename T2>=0D
+-    struct Evaluator<T1, T2, IsEqualTo> {=0D
+-        static bool evaluate( T1 const& lhs, T2 const& rhs) {=0D
+-            return bool( opCast( lhs ) =3D=3D  opCast( rhs ) );=0D
+-        }=0D
+-    };=0D
+-    template<typename T1, typename T2>=0D
+-    struct Evaluator<T1, T2, IsNotEqualTo> {=0D
+-        static bool evaluate( T1 const& lhs, T2 const& rhs ) {=0D
+-            return bool( opCast( lhs ) !=3D opCast( rhs ) );=0D
+-        }=0D
+-    };=0D
+-    template<typename T1, typename T2>=0D
+-    struct Evaluator<T1, T2, IsLessThan> {=0D
+-        static bool evaluate( T1 const& lhs, T2 const& rhs ) {=0D
+-            return bool( opCast( lhs ) < opCast( rhs ) );=0D
+-        }=0D
+-    };=0D
+-    template<typename T1, typename T2>=0D
+-    struct Evaluator<T1, T2, IsGreaterThan> {=0D
+-        static bool evaluate( T1 const& lhs, T2 const& rhs ) {=0D
+-            return bool( opCast( lhs ) > opCast( rhs ) );=0D
+-        }=0D
+-    };=0D
+-    template<typename T1, typename T2>=0D
+-    struct Evaluator<T1, T2, IsGreaterThanOrEqualTo> {=0D
+-        static bool evaluate( T1 const& lhs, T2 const& rhs ) {=0D
+-            return bool( opCast( lhs ) >=3D opCast( rhs ) );=0D
+-        }=0D
+-    };=0D
+-    template<typename T1, typename T2>=0D
+-    struct Evaluator<T1, T2, IsLessThanOrEqualTo> {=0D
+-        static bool evaluate( T1 const& lhs, T2 const& rhs ) {=0D
+-            return bool( opCast( lhs ) <=3D opCast( rhs ) );=0D
+-        }=0D
+-    };=0D
+-=0D
+-    template<Operator Op, typename T1, typename T2>=0D
+-    bool applyEvaluator( T1 const& lhs, T2 const& rhs ) {=0D
+-        return Evaluator<T1, T2, Op>::evaluate( lhs, rhs );=0D
+-    }=0D
+-=0D
+-    // This level of indirection allows us to specialise for integer type=
s=0D
+-    // to avoid signed/ unsigned warnings=0D
+-=0D
+-    // "base" overload=0D
+-    template<Operator Op, typename T1, typename T2>=0D
+-    bool compare( T1 const& lhs, T2 const& rhs ) {=0D
+-        return Evaluator<T1, T2, Op>::evaluate( lhs, rhs );=0D
+-    }=0D
+-=0D
+-    // unsigned X to int=0D
+-    template<Operator Op> bool compare( unsigned int lhs, int rhs ) {=0D
+-        return applyEvaluator<Op>( lhs, static_cast<unsigned int>( rhs ) =
);=0D
+-    }=0D
+-    template<Operator Op> bool compare( unsigned long lhs, int rhs ) {=0D
+-        return applyEvaluator<Op>( lhs, static_cast<unsigned int>( rhs ) =
);=0D
+-    }=0D
+-    template<Operator Op> bool compare( unsigned char lhs, int rhs ) {=0D
+-        return applyEvaluator<Op>( lhs, static_cast<unsigned int>( rhs ) =
);=0D
+-    }=0D
+-=0D
+-    // unsigned X to long=0D
+-    template<Operator Op> bool compare( unsigned int lhs, long rhs ) {=0D
+-        return applyEvaluator<Op>( lhs, static_cast<unsigned long>( rhs )=
 );=0D
+-    }=0D
+-    template<Operator Op> bool compare( unsigned long lhs, long rhs ) {=0D
+-        return applyEvaluator<Op>( lhs, static_cast<unsigned long>( rhs )=
 );=0D
+-    }=0D
+-    template<Operator Op> bool compare( unsigned char lhs, long rhs ) {=0D
+-        return applyEvaluator<Op>( lhs, static_cast<unsigned long>( rhs )=
 );=0D
+-    }=0D
+-=0D
+-    // int to unsigned X=0D
+-    template<Operator Op> bool compare( int lhs, unsigned int rhs ) {=0D
+-        return applyEvaluator<Op>( static_cast<unsigned int>( lhs ), rhs =
);=0D
+-    }=0D
+-    template<Operator Op> bool compare( int lhs, unsigned long rhs ) {=0D
+-        return applyEvaluator<Op>( static_cast<unsigned int>( lhs ), rhs =
);=0D
+-    }=0D
+-    template<Operator Op> bool compare( int lhs, unsigned char rhs ) {=0D
+-        return applyEvaluator<Op>( static_cast<unsigned int>( lhs ), rhs =
);=0D
+-    }=0D
+-=0D
+-    // long to unsigned X=0D
+-    template<Operator Op> bool compare( long lhs, unsigned int rhs ) {=0D
+-        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );=0D
+-    }=0D
+-    template<Operator Op> bool compare( long lhs, unsigned long rhs ) {=0D
+-        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );=0D
+-    }=0D
+-    template<Operator Op> bool compare( long lhs, unsigned char rhs ) {=0D
+-        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );=0D
+-    }=0D
+-=0D
+-    // pointer to long (when comparing against NULL)=0D
+-    template<Operator Op, typename T> bool compare( long lhs, T* rhs ) {=
=0D
+-        return Evaluator<T*, T*, Op>::evaluate( reinterpret_cast<T*>( lhs=
 ), rhs );=0D
+-    }=0D
+-    template<Operator Op, typename T> bool compare( T* lhs, long rhs ) {=
=0D
+-        return Evaluator<T*, T*, Op>::evaluate( lhs, reinterpret_cast<T*>=
( rhs ) );=0D
+-    }=0D
+-=0D
+-    // pointer to int (when comparing against NULL)=0D
+-    template<Operator Op, typename T> bool compare( int lhs, T* rhs ) {=0D
+-        return Evaluator<T*, T*, Op>::evaluate( reinterpret_cast<T*>( lhs=
 ), rhs );=0D
+-    }=0D
+-    template<Operator Op, typename T> bool compare( T* lhs, int rhs ) {=0D
+-        return Evaluator<T*, T*, Op>::evaluate( lhs, reinterpret_cast<T*>=
( rhs ) );=0D
+-    }=0D
+-=0D
+-#ifdef CATCH_CONFIG_CPP11_LONG_LONG=0D
+-    // long long to unsigned X=0D
+-    template<Operator Op> bool compare( long long lhs, unsigned int rhs )=
 {=0D
+-        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );=0D
+-    }=0D
+-    template<Operator Op> bool compare( long long lhs, unsigned long rhs =
) {=0D
+-        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );=0D
+-    }=0D
+-    template<Operator Op> bool compare( long long lhs, unsigned long long=
 rhs ) {=0D
+-        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );=0D
+-    }=0D
+-    template<Operator Op> bool compare( long long lhs, unsigned char rhs =
) {=0D
+-        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );=0D
+-    }=0D
+-=0D
+-    // unsigned long long to X=0D
+-    template<Operator Op> bool compare( unsigned long long lhs, int rhs )=
 {=0D
+-        return applyEvaluator<Op>( static_cast<long>( lhs ), rhs );=0D
+-    }=0D
+-    template<Operator Op> bool compare( unsigned long long lhs, long rhs =
) {=0D
+-        return applyEvaluator<Op>( static_cast<long>( lhs ), rhs );=0D
+-    }=0D
+-    template<Operator Op> bool compare( unsigned long long lhs, long long=
 rhs ) {=0D
+-        return applyEvaluator<Op>( static_cast<long>( lhs ), rhs );=0D
+-    }=0D
+-    template<Operator Op> bool compare( unsigned long long lhs, char rhs =
) {=0D
+-        return applyEvaluator<Op>( static_cast<long>( lhs ), rhs );=0D
+-    }=0D
+-=0D
+-    // pointer to long long (when comparing against NULL)=0D
+-    template<Operator Op, typename T> bool compare( long long lhs, T* rhs=
 ) {=0D
+-        return Evaluator<T*, T*, Op>::evaluate( reinterpret_cast<T*>( lhs=
 ), rhs );=0D
+-    }=0D
+-    template<Operator Op, typename T> bool compare( T* lhs, long long rhs=
 ) {=0D
+-        return Evaluator<T*, T*, Op>::evaluate( lhs, reinterpret_cast<T*>=
( rhs ) );=0D
+-    }=0D
+-#endif // CATCH_CONFIG_CPP11_LONG_LONG=0D
+-=0D
+-#ifdef CATCH_CONFIG_CPP11_NULLPTR=0D
+-    // pointer to nullptr_t (when comparing against nullptr)=0D
+-    template<Operator Op, typename T> bool compare( std::nullptr_t, T* rh=
s ) {=0D
+-        return Evaluator<T*, T*, Op>::evaluate( nullptr, rhs );=0D
+-    }=0D
+-    template<Operator Op, typename T> bool compare( T* lhs, std::nullptr_=
t ) {=0D
+-        return Evaluator<T*, T*, Op>::evaluate( lhs, nullptr );=0D
+-    }=0D
+-#endif // CATCH_CONFIG_CPP11_NULLPTR=0D
+-=0D
+-} // end of namespace Internal=0D
+-} // end of namespace Catch=0D
+-=0D
+-#ifdef _MSC_VER=0D
+-#pragma warning(pop)=0D
+-#endif=0D
+-=0D
+-// #included from: catch_tostring.h=0D
+-#define TWOBLUECUBES_CATCH_TOSTRING_H_INCLUDED=0D
+-=0D
+-#include <sstream>=0D
+-#include <iomanip>=0D
+-#include <limits>=0D
+-#include <vector>=0D
+-#include <cstddef>=0D
+-=0D
+-#ifdef __OBJC__=0D
+-// #included from: catch_objc_arc.hpp=0D
+-#define TWOBLUECUBES_CATCH_OBJC_ARC_HPP_INCLUDED=0D
+-=0D
+-#import <Foundation/Foundation.h>=0D
+-=0D
+-#ifdef __has_feature=0D
+-#define CATCH_ARC_ENABLED __has_feature(objc_arc)=0D
+-#else=0D
+-#define CATCH_ARC_ENABLED 0=0D
+-#endif=0D
+-=0D
+-void arcSafeRelease( NSObject* obj );=0D
+-id performOptionalSelector( id obj, SEL sel );=0D
+-=0D
+-#if !CATCH_ARC_ENABLED=0D
+-inline void arcSafeRelease( NSObject* obj ) {=0D
+-    [obj release];=0D
+-}=0D
+-inline id performOptionalSelector( id obj, SEL sel ) {=0D
+-    if( [obj respondsToSelector: sel] )=0D
+-        return [obj performSelector: sel];=0D
+-    return nil;=0D
+-}=0D
+-#define CATCH_UNSAFE_UNRETAINED=0D
+-#define CATCH_ARC_STRONG=0D
+-#else=0D
+-inline void arcSafeRelease( NSObject* ){}=0D
+-inline id performOptionalSelector( id obj, SEL sel ) {=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic push=0D
+-#pragma clang diagnostic ignored "-Warc-performSelector-leaks"=0D
+-#endif=0D
+-    if( [obj respondsToSelector: sel] )=0D
+-        return [obj performSelector: sel];=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic pop=0D
+-#endif=0D
+-    return nil;=0D
+-}=0D
+-#define CATCH_UNSAFE_UNRETAINED __unsafe_unretained=0D
+-#define CATCH_ARC_STRONG __strong=0D
+-#endif=0D
+-=0D
+-#endif=0D
+-=0D
+-#ifdef CATCH_CONFIG_CPP11_TUPLE=0D
+-#include <tuple>=0D
+-#endif=0D
+-=0D
+-#ifdef CATCH_CONFIG_CPP11_IS_ENUM=0D
+-#include <type_traits>=0D
+-#endif=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-// Why we're here.=0D
+-template<typename T>=0D
+-std::string toString( T const& value );=0D
+-=0D
+-// Built in overloads=0D
+-=0D
+-std::string toString( std::string const& value );=0D
+-std::string toString( std::wstring const& value );=0D
+-std::string toString( const char* const value );=0D
+-std::string toString( char* const value );=0D
+-std::string toString( const wchar_t* const value );=0D
+-std::string toString( wchar_t* const value );=0D
+-std::string toString( int value );=0D
+-std::string toString( unsigned long value );=0D
+-std::string toString( unsigned int value );=0D
+-std::string toString( const double value );=0D
+-std::string toString( const float value );=0D
+-std::string toString( bool value );=0D
+-std::string toString( char value );=0D
+-std::string toString( signed char value );=0D
+-std::string toString( unsigned char value );=0D
+-=0D
+-#ifdef CATCH_CONFIG_CPP11_LONG_LONG=0D
+-std::string toString( long long value );=0D
+-std::string toString( unsigned long long value );=0D
+-#endif=0D
+-=0D
+-#ifdef CATCH_CONFIG_CPP11_NULLPTR=0D
+-std::string toString( std::nullptr_t );=0D
+-#endif=0D
+-=0D
+-#ifdef __OBJC__=0D
+-    std::string toString( NSString const * const& nsstring );=0D
+-    std::string toString( NSString * CATCH_ARC_STRONG const& nsstring );=
=0D
+-    std::string toString( NSObject* const& nsObject );=0D
+-#endif=0D
+-=0D
+-namespace Detail {=0D
+-=0D
+-    extern const std::string unprintableString;=0D
+-=0D
+-    struct BorgType {=0D
+-        template<typename T> BorgType( T const& );=0D
+-    };=0D
+-=0D
+-    struct TrueType { char sizer[1]; };=0D
+-    struct FalseType { char sizer[2]; };=0D
+-=0D
+-    TrueType& testStreamable( std::ostream& );=0D
+-    FalseType testStreamable( FalseType );=0D
+-=0D
+-    FalseType operator<<( std::ostream const&, BorgType const& );=0D
+-=0D
+-    template<typename T>=0D
+-    struct IsStreamInsertable {=0D
+-        static std::ostream &s;=0D
+-        static T  const&t;=0D
+-        enum { value =3D sizeof( testStreamable(s << t) ) =3D=3D sizeof( =
TrueType ) };=0D
+-    };=0D
+-=0D
+-#if defined(CATCH_CONFIG_CPP11_IS_ENUM)=0D
+-    template<typename T,=0D
+-             bool IsEnum =3D std::is_enum<T>::value=0D
+-             >=0D
+-    struct EnumStringMaker=0D
+-    {=0D
+-        static std::string convert( T const& ) { return unprintableString=
; }=0D
+-    };=0D
+-=0D
+-    template<typename T>=0D
+-    struct EnumStringMaker<T,true>=0D
+-    {=0D
+-        static std::string convert( T const& v )=0D
+-        {=0D
+-            return ::Catch::toString(=0D
+-                static_cast<typename std::underlying_type<T>::type>(v)=0D
+-                );=0D
+-        }=0D
+-    };=0D
+-#endif=0D
+-    template<bool C>=0D
+-    struct StringMakerBase {=0D
+-#if defined(CATCH_CONFIG_CPP11_IS_ENUM)=0D
+-        template<typename T>=0D
+-        static std::string convert( T const& v )=0D
+-        {=0D
+-            return EnumStringMaker<T>::convert( v );=0D
+-        }=0D
+-#else=0D
+-        template<typename T>=0D
+-        static std::string convert( T const& ) { return unprintableString=
; }=0D
+-#endif=0D
+-    };=0D
+-=0D
+-    template<>=0D
+-    struct StringMakerBase<true> {=0D
+-        template<typename T>=0D
+-        static std::string convert( T const& _value ) {=0D
+-            std::ostringstream oss;=0D
+-            oss << _value;=0D
+-            return oss.str();=0D
+-        }=0D
+-    };=0D
+-=0D
+-    std::string rawMemoryToString( const void *object, std::size_t size )=
;=0D
+-=0D
+-    template<typename T>=0D
+-    inline std::string rawMemoryToString( const T& object ) {=0D
+-      return rawMemoryToString( &object, sizeof(object) );=0D
+-    }=0D
+-=0D
+-} // end namespace Detail=0D
+-=0D
+-template<typename T>=0D
+-struct StringMaker :=0D
+-    Detail::StringMakerBase<Detail::IsStreamInsertable<T>::value> {};=0D
+-=0D
+-template<typename T>=0D
+-struct StringMaker<T*> {=0D
+-    template<typename U>=0D
+-    static std::string convert( U* p ) {=0D
+-        if( !p )=0D
+-            return "NULL";=0D
+-        else=0D
+-            return Detail::rawMemoryToString( p );=0D
+-    }=0D
+-};=0D
+-=0D
+-template<typename R, typename C>=0D
+-struct StringMaker<R C::*> {=0D
+-    static std::string convert( R C::* p ) {=0D
+-        if( !p )=0D
+-            return "NULL";=0D
+-        else=0D
+-            return Detail::rawMemoryToString( p );=0D
+-    }=0D
+-};=0D
+-=0D
+-namespace Detail {=0D
+-    template<typename InputIterator>=0D
+-    std::string rangeToString( InputIterator first, InputIterator last );=
=0D
+-}=0D
+-=0D
+-//template<typename T, typename Allocator>=0D
+-//struct StringMaker<std::vector<T, Allocator> > {=0D
+-//    static std::string convert( std::vector<T,Allocator> const& v ) {=0D
+-//        return Detail::rangeToString( v.begin(), v.end() );=0D
+-//    }=0D
+-//};=0D
+-=0D
+-template<typename T, typename Allocator>=0D
+-std::string toString( std::vector<T,Allocator> const& v ) {=0D
+-    return Detail::rangeToString( v.begin(), v.end() );=0D
+-}=0D
+-=0D
+-#ifdef CATCH_CONFIG_CPP11_TUPLE=0D
+-=0D
+-// toString for tuples=0D
+-namespace TupleDetail {=0D
+-  template<=0D
+-      typename Tuple,=0D
+-      std::size_t N =3D 0,=0D
+-      bool =3D (N < std::tuple_size<Tuple>::value)=0D
+-      >=0D
+-  struct ElementPrinter {=0D
+-      static void print( const Tuple& tuple, std::ostream& os )=0D
+-      {=0D
+-          os << ( N ? ", " : " " )=0D
+-             << Catch::toString(std::get<N>(tuple));=0D
+-          ElementPrinter<Tuple,N+1>::print(tuple,os);=0D
+-      }=0D
+-  };=0D
+-=0D
+-  template<=0D
+-      typename Tuple,=0D
+-      std::size_t N=0D
+-      >=0D
+-  struct ElementPrinter<Tuple,N,false> {=0D
+-      static void print( const Tuple&, std::ostream& ) {}=0D
+-  };=0D
+-=0D
+-}=0D
+-=0D
+-template<typename ...Types>=0D
+-struct StringMaker<std::tuple<Types...>> {=0D
+-=0D
+-    static std::string convert( const std::tuple<Types...>& tuple )=0D
+-    {=0D
+-        std::ostringstream os;=0D
+-        os << '{';=0D
+-        TupleDetail::ElementPrinter<std::tuple<Types...>>::print( tuple, =
os );=0D
+-        os << " }";=0D
+-        return os.str();=0D
+-    }=0D
+-};=0D
+-#endif // CATCH_CONFIG_CPP11_TUPLE=0D
+-=0D
+-namespace Detail {=0D
+-    template<typename T>=0D
+-    std::string makeString( T const& value ) {=0D
+-        return StringMaker<T>::convert( value );=0D
+-    }=0D
+-} // end namespace Detail=0D
+-=0D
+-/// \brief converts any type to a string=0D
+-///=0D
+-/// The default template forwards on to ostringstream - except when an=0D
+-/// ostringstream overload does not exist - in which case it attempts to =
detect=0D
+-/// that and writes {?}.=0D
+-/// Overload (not specialise) this template for custom typs that you don'=
t want=0D
+-/// to provide an ostream overload for.=0D
+-template<typename T>=0D
+-std::string toString( T const& value ) {=0D
+-    return StringMaker<T>::convert( value );=0D
+-}=0D
+-=0D
+-    namespace Detail {=0D
+-    template<typename InputIterator>=0D
+-    std::string rangeToString( InputIterator first, InputIterator last ) =
{=0D
+-        std::ostringstream oss;=0D
+-        oss << "{ ";=0D
+-        if( first !=3D last ) {=0D
+-            oss << Catch::toString( *first );=0D
+-            for( ++first ; first !=3D last ; ++first )=0D
+-                oss << ", " << Catch::toString( *first );=0D
+-        }=0D
+-        oss << " }";=0D
+-        return oss.str();=0D
+-    }=0D
+-}=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-// Wraps the LHS of an expression and captures the operator and RHS (if a=
ny) -=0D
+-// wrapping them all in a ResultBuilder object=0D
+-template<typename T>=0D
+-class ExpressionLhs {=0D
+-    ExpressionLhs& operator =3D ( ExpressionLhs const& );=0D
+-#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-    ExpressionLhs& operator =3D ( ExpressionLhs && ) =3D delete;=0D
+-#  endif=0D
+-=0D
+-public:=0D
+-    ExpressionLhs( ResultBuilder& rb, T lhs ) : m_rb( rb ), m_lhs( lhs ) =
{}=0D
+-#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-    ExpressionLhs( ExpressionLhs const& ) =3D default;=0D
+-    ExpressionLhs( ExpressionLhs && )     =3D default;=0D
+-#  endif=0D
+-=0D
+-    template<typename RhsT>=0D
+-    ResultBuilder& operator =3D=3D ( RhsT const& rhs ) {=0D
+-        return captureExpression<Internal::IsEqualTo>( rhs );=0D
+-    }=0D
+-=0D
+-    template<typename RhsT>=0D
+-    ResultBuilder& operator !=3D ( RhsT const& rhs ) {=0D
+-        return captureExpression<Internal::IsNotEqualTo>( rhs );=0D
+-    }=0D
+-=0D
+-    template<typename RhsT>=0D
+-    ResultBuilder& operator < ( RhsT const& rhs ) {=0D
+-        return captureExpression<Internal::IsLessThan>( rhs );=0D
+-    }=0D
+-=0D
+-    template<typename RhsT>=0D
+-    ResultBuilder& operator > ( RhsT const& rhs ) {=0D
+-        return captureExpression<Internal::IsGreaterThan>( rhs );=0D
+-    }=0D
+-=0D
+-    template<typename RhsT>=0D
+-    ResultBuilder& operator <=3D ( RhsT const& rhs ) {=0D
+-        return captureExpression<Internal::IsLessThanOrEqualTo>( rhs );=0D
+-    }=0D
+-=0D
+-    template<typename RhsT>=0D
+-    ResultBuilder& operator >=3D ( RhsT const& rhs ) {=0D
+-        return captureExpression<Internal::IsGreaterThanOrEqualTo>( rhs )=
;=0D
+-    }=0D
+-=0D
+-    ResultBuilder& operator =3D=3D ( bool rhs ) {=0D
+-        return captureExpression<Internal::IsEqualTo>( rhs );=0D
+-    }=0D
+-=0D
+-    ResultBuilder& operator !=3D ( bool rhs ) {=0D
+-        return captureExpression<Internal::IsNotEqualTo>( rhs );=0D
+-    }=0D
+-=0D
+-    void endExpression() {=0D
+-        bool value =3D m_lhs ? true : false;=0D
+-        m_rb=0D
+-            .setLhs( Catch::toString( value ) )=0D
+-            .setResultType( value )=0D
+-            .endExpression();=0D
+-    }=0D
+-=0D
+-    // Only simple binary expressions are allowed on the LHS.=0D
+-    // If more complex compositions are required then place the sub expre=
ssion in parentheses=0D
+-    template<typename RhsT> STATIC_ASSERT_Expression_Too_Complex_Please_R=
ewrite_As_Binary_Comparison& operator + ( RhsT const& );=0D
+-    template<typename RhsT> STATIC_ASSERT_Expression_Too_Complex_Please_R=
ewrite_As_Binary_Comparison& operator - ( RhsT const& );=0D
+-    template<typename RhsT> STATIC_ASSERT_Expression_Too_Complex_Please_R=
ewrite_As_Binary_Comparison& operator / ( RhsT const& );=0D
+-    template<typename RhsT> STATIC_ASSERT_Expression_Too_Complex_Please_R=
ewrite_As_Binary_Comparison& operator * ( RhsT const& );=0D
+-    template<typename RhsT> STATIC_ASSERT_Expression_Too_Complex_Please_R=
ewrite_As_Binary_Comparison& operator && ( RhsT const& );=0D
+-    template<typename RhsT> STATIC_ASSERT_Expression_Too_Complex_Please_R=
ewrite_As_Binary_Comparison& operator || ( RhsT const& );=0D
+-=0D
+-private:=0D
+-    template<Internal::Operator Op, typename RhsT>=0D
+-    ResultBuilder& captureExpression( RhsT const& rhs ) {=0D
+-        return m_rb=0D
+-            .setResultType( Internal::compare<Op>( m_lhs, rhs ) )=0D
+-            .setLhs( Catch::toString( m_lhs ) )=0D
+-            .setRhs( Catch::toString( rhs ) )=0D
+-            .setOp( Internal::OperatorTraits<Op>::getName() );=0D
+-    }=0D
+-=0D
+-private:=0D
+-    ResultBuilder& m_rb;=0D
+-    T m_lhs;=0D
+-};=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    template<typename T>=0D
+-    inline ExpressionLhs<T const&> ResultBuilder::operator <=3D ( T const=
& operand ) {=0D
+-        return ExpressionLhs<T const&>( *this, operand );=0D
+-    }=0D
+-=0D
+-    inline ExpressionLhs<bool> ResultBuilder::operator <=3D ( bool value =
) {=0D
+-        return ExpressionLhs<bool>( *this, value );=0D
+-    }=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-// #included from: catch_message.h=0D
+-#define TWOBLUECUBES_CATCH_MESSAGE_H_INCLUDED=0D
+-=0D
+-#include <string>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct MessageInfo {=0D
+-        MessageInfo(    std::string const& _macroName,=0D
+-                        SourceLineInfo const& _lineInfo,=0D
+-                        ResultWas::OfType _type );=0D
+-=0D
+-        std::string macroName;=0D
+-        SourceLineInfo lineInfo;=0D
+-        ResultWas::OfType type;=0D
+-        std::string message;=0D
+-        unsigned int sequence;=0D
+-=0D
+-        bool operator =3D=3D ( MessageInfo const& other ) const {=0D
+-            return sequence =3D=3D other.sequence;=0D
+-        }=0D
+-        bool operator < ( MessageInfo const& other ) const {=0D
+-            return sequence < other.sequence;=0D
+-        }=0D
+-    private:=0D
+-        static unsigned int globalCount;=0D
+-    };=0D
+-=0D
+-    struct MessageBuilder {=0D
+-        MessageBuilder( std::string const& macroName,=0D
+-                        SourceLineInfo const& lineInfo,=0D
+-                        ResultWas::OfType type )=0D
+-        : m_info( macroName, lineInfo, type )=0D
+-        {}=0D
+-=0D
+-        template<typename T>=0D
+-        MessageBuilder& operator << ( T const& value ) {=0D
+-            m_stream << value;=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        MessageInfo m_info;=0D
+-        std::ostringstream m_stream;=0D
+-    };=0D
+-=0D
+-    class ScopedMessage {=0D
+-    public:=0D
+-        ScopedMessage( MessageBuilder const& builder );=0D
+-        ScopedMessage( ScopedMessage const& other );=0D
+-        ~ScopedMessage();=0D
+-=0D
+-        MessageInfo m_info;=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_interfaces_capture.h=0D
+-#define TWOBLUECUBES_CATCH_INTERFACES_CAPTURE_H_INCLUDED=0D
+-=0D
+-#include <string>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class TestCase;=0D
+-    class AssertionResult;=0D
+-    struct AssertionInfo;=0D
+-    struct SectionInfo;=0D
+-    struct SectionEndInfo;=0D
+-    struct MessageInfo;=0D
+-    class ScopedMessageBuilder;=0D
+-    struct Counts;=0D
+-=0D
+-    struct IResultCapture {=0D
+-=0D
+-        virtual ~IResultCapture();=0D
+-=0D
+-        virtual void assertionEnded( AssertionResult const& result ) =3D =
0;=0D
+-        virtual bool sectionStarted(    SectionInfo const& sectionInfo,=0D
+-                                        Counts& assertions ) =3D 0;=0D
+-        virtual void sectionEnded( SectionEndInfo const& endInfo ) =3D 0;=
=0D
+-        virtual void sectionEndedEarly( SectionEndInfo const& endInfo ) =
=3D 0;=0D
+-        virtual void pushScopedMessage( MessageInfo const& message ) =3D =
0;=0D
+-        virtual void popScopedMessage( MessageInfo const& message ) =3D 0=
;=0D
+-=0D
+-        virtual std::string getCurrentTestName() const =3D 0;=0D
+-        virtual const AssertionResult* getLastResult() const =3D 0;=0D
+-=0D
+-        virtual void handleFatalErrorCondition( std::string const& messag=
e ) =3D 0;=0D
+-    };=0D
+-=0D
+-    IResultCapture& getResultCapture();=0D
+-}=0D
+-=0D
+-// #included from: catch_debugger.h=0D
+-#define TWOBLUECUBES_CATCH_DEBUGGER_H_INCLUDED=0D
+-=0D
+-// #included from: catch_platform.h=0D
+-#define TWOBLUECUBES_CATCH_PLATFORM_H_INCLUDED=0D
+-=0D
+-#if defined(__MAC_OS_X_VERSION_MIN_REQUIRED)=0D
+-#  define CATCH_PLATFORM_MAC=0D
+-#elif  defined(__IPHONE_OS_VERSION_MIN_REQUIRED)=0D
+-#  define CATCH_PLATFORM_IPHONE=0D
+-#elif defined(linux) || defined(__linux) || defined(__linux__)=0D
+-#  define CATCH_PLATFORM_LINUX=0D
+-#elif defined(WIN32) || defined(__WIN32__) || defined(_WIN32) || defined(=
_MSC_VER)=0D
+-#  define CATCH_PLATFORM_WINDOWS=0D
+-#  if !defined(NOMINMAX) && !defined(CATCH_CONFIG_NO_NOMINMAX)=0D
+-#    define CATCH_DEFINES_NOMINMAX=0D
+-#  endif=0D
+-#  if !defined(WIN32_LEAN_AND_MEAN) && !defined(CATCH_CONFIG_NO_WIN32_LEA=
N_AND_MEAN)=0D
+-#    define CATCH_DEFINES_WIN32_LEAN_AND_MEAN=0D
+-#  endif=0D
+-#endif=0D
+-=0D
+-#include <string>=0D
+-=0D
+-namespace Catch{=0D
+-=0D
+-    bool isDebuggerActive();=0D
+-    void writeToDebugConsole( std::string const& text );=0D
+-}=0D
+-=0D
+-#ifdef CATCH_PLATFORM_MAC=0D
+-=0D
+-    // The following code snippet based on:=0D
+-    // http://cocoawithlove.com/2008/03/break-into-debugger.html=0D
+-    #ifdef DEBUG=0D
+-        #if defined(__ppc64__) || defined(__ppc__)=0D
+-            #define CATCH_TRAP() \=0D
+-                    __asm__("li r0, 20\nsc\nnop\nli r0, 37\nli r4, 2\nsc\=
nnop\n" \=0D
+-                    : : : "memory","r0","r3","r4" )=0D
+-        #else=0D
+-            #define CATCH_TRAP() _asm__("int $3\n" : : )=0D
+-        #endif=0D
+-    #endif=0D
+-=0D
+-#elif defined(CATCH_PLATFORM_LINUX)=0D
+-    // If we can use inline assembler, do it because this allows us to br=
eak=0D
+-    // directly at the location of the failing check instead of breaking =
inside=0D
+-    // raise() called from it, i.e. one stack frame below.=0D
+-    #if defined(__GNUC__) && (defined(__i386) || defined(__x86_64))=0D
+-        #define CATCH_TRAP() asm volatile ("int $3")=0D
+-    #else // Fall back to the generic way.=0D
+-        #include <signal.h>=0D
+-=0D
+-        #define CATCH_TRAP() raise(SIGTRAP)=0D
+-    #endif=0D
+-#elif defined(_MSC_VER)=0D
+-    #define CATCH_TRAP() __debugbreak()=0D
+-#elif defined(__MINGW32__)=0D
+-    extern "C" __declspec(dllimport) void __stdcall DebugBreak();=0D
+-    #define CATCH_TRAP() DebugBreak()=0D
+-#endif=0D
+-=0D
+-#ifdef CATCH_TRAP=0D
+-    #define CATCH_BREAK_INTO_DEBUGGER() if( Catch::isDebuggerActive() ) {=
 CATCH_TRAP(); }=0D
+-#else=0D
+-    #define CATCH_BREAK_INTO_DEBUGGER() Catch::alwaysTrue();=0D
+-#endif=0D
+-=0D
+-// #included from: catch_interfaces_runner.h=0D
+-#define TWOBLUECUBES_CATCH_INTERFACES_RUNNER_H_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-    class TestCase;=0D
+-=0D
+-    struct IRunner {=0D
+-        virtual ~IRunner();=0D
+-        virtual bool aborting() const =3D 0;=0D
+-    };=0D
+-}=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-// In the event of a failure works out if the debugger needs to be invoke=
d=0D
+-// and/or an exception thrown and takes appropriate action.=0D
+-// This needs to be done as a macro so the debugger will stop in the user=
=0D
+-// source code rather than in Catch library code=0D
+-#define INTERNAL_CATCH_REACT( resultBuilder ) \=0D
+-    if( resultBuilder.shouldDebugBreak() ) CATCH_BREAK_INTO_DEBUGGER(); \=
=0D
+-    resultBuilder.react();=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define INTERNAL_CATCH_TEST( expr, resultDisposition, macroName ) \=0D
+-    do { \=0D
+-        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, #expr, resultDisposition ); \=0D
+-        try { \=0D
+-            CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS \=0D
+-            ( __catchResult <=3D expr ).endExpression(); \=0D
+-        } \=0D
+-        catch( ... ) { \=0D
+-            __catchResult.useActiveException( Catch::ResultDisposition::N=
ormal ); \=0D
+-        } \=0D
+-        INTERNAL_CATCH_REACT( __catchResult ) \=0D
+-    } while( Catch::alwaysFalse( sizeof(expr) ) ) // expr here is never e=
valuated at runtime but it forces the compiler to give it a look=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define INTERNAL_CATCH_IF( expr, resultDisposition, macroName ) \=0D
+-    INTERNAL_CATCH_TEST( expr, resultDisposition, macroName ); \=0D
+-    if( Catch::getResultCapture().getLastResult()->succeeded() )=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define INTERNAL_CATCH_ELSE( expr, resultDisposition, macroName ) \=0D
+-    INTERNAL_CATCH_TEST( expr, resultDisposition, macroName ); \=0D
+-    if( !Catch::getResultCapture().getLastResult()->succeeded() )=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define INTERNAL_CATCH_NO_THROW( expr, resultDisposition, macroName ) \=0D
+-    do { \=0D
+-        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, #expr, resultDisposition ); \=0D
+-        try { \=0D
+-            expr; \=0D
+-            __catchResult.captureResult( Catch::ResultWas::Ok ); \=0D
+-        } \=0D
+-        catch( ... ) { \=0D
+-            __catchResult.useActiveException( resultDisposition ); \=0D
+-        } \=0D
+-        INTERNAL_CATCH_REACT( __catchResult ) \=0D
+-    } while( Catch::alwaysFalse() )=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define INTERNAL_CATCH_THROWS( expr, resultDisposition, matcher, macroNam=
e ) \=0D
+-    do { \=0D
+-        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, #expr, resultDisposition, #matcher ); \=0D
+-        if( __catchResult.allowThrows() ) \=0D
+-            try { \=0D
+-                expr; \=0D
+-                __catchResult.captureResult( Catch::ResultWas::DidntThrow=
Exception ); \=0D
+-            } \=0D
+-            catch( ... ) { \=0D
+-                __catchResult.captureExpectedException( matcher ); \=0D
+-            } \=0D
+-        else \=0D
+-            __catchResult.captureResult( Catch::ResultWas::Ok ); \=0D
+-        INTERNAL_CATCH_REACT( __catchResult ) \=0D
+-    } while( Catch::alwaysFalse() )=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define INTERNAL_CATCH_THROWS_AS( expr, exceptionType, resultDisposition,=
 macroName ) \=0D
+-    do { \=0D
+-        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, #expr, resultDisposition ); \=0D
+-        if( __catchResult.allowThrows() ) \=0D
+-            try { \=0D
+-                expr; \=0D
+-                __catchResult.captureResult( Catch::ResultWas::DidntThrow=
Exception ); \=0D
+-            } \=0D
+-            catch( exceptionType ) { \=0D
+-                __catchResult.captureResult( Catch::ResultWas::Ok ); \=0D
+-            } \=0D
+-            catch( ... ) { \=0D
+-                __catchResult.useActiveException( resultDisposition ); \=
=0D
+-            } \=0D
+-        else \=0D
+-            __catchResult.captureResult( Catch::ResultWas::Ok ); \=0D
+-        INTERNAL_CATCH_REACT( __catchResult ) \=0D
+-    } while( Catch::alwaysFalse() )=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#ifdef CATCH_CONFIG_VARIADIC_MACROS=0D
+-    #define INTERNAL_CATCH_MSG( messageType, resultDisposition, macroName=
, ... ) \=0D
+-        do { \=0D
+-            Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL=
_LINEINFO, "", resultDisposition ); \=0D
+-            __catchResult << __VA_ARGS__ + ::Catch::StreamEndStop(); \=0D
+-            __catchResult.captureResult( messageType ); \=0D
+-            INTERNAL_CATCH_REACT( __catchResult ) \=0D
+-        } while( Catch::alwaysFalse() )=0D
+-#else=0D
+-    #define INTERNAL_CATCH_MSG( messageType, resultDisposition, macroName=
, log ) \=0D
+-        do { \=0D
+-            Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL=
_LINEINFO, "", resultDisposition ); \=0D
+-            __catchResult << log + ::Catch::StreamEndStop(); \=0D
+-            __catchResult.captureResult( messageType ); \=0D
+-            INTERNAL_CATCH_REACT( __catchResult ) \=0D
+-        } while( Catch::alwaysFalse() )=0D
+-#endif=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define INTERNAL_CATCH_INFO( log, macroName ) \=0D
+-    Catch::ScopedMessage INTERNAL_CATCH_UNIQUE_NAME( scopedMessage ) =3D =
Catch::MessageBuilder( macroName, CATCH_INTERNAL_LINEINFO, Catch::ResultWas=
::Info ) << log;=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define INTERNAL_CHECK_THAT( arg, matcher, resultDisposition, macroName )=
 \=0D
+-    do { \=0D
+-        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, #arg ", " #matcher, resultDisposition ); \=0D
+-        try { \=0D
+-            std::string matcherAsString =3D (matcher).toString(); \=0D
+-            __catchResult \=0D
+-                .setLhs( Catch::toString( arg ) ) \=0D
+-                .setRhs( matcherAsString =3D=3D Catch::Detail::unprintabl=
eString ? #matcher : matcherAsString ) \=0D
+-                .setOp( "matches" ) \=0D
+-                .setResultType( (matcher).match( arg ) ); \=0D
+-            __catchResult.captureExpression(); \=0D
+-        } catch( ... ) { \=0D
+-            __catchResult.useActiveException( resultDisposition | Catch::=
ResultDisposition::ContinueOnFailure ); \=0D
+-        } \=0D
+-        INTERNAL_CATCH_REACT( __catchResult ) \=0D
+-    } while( Catch::alwaysFalse() )=0D
+-=0D
+-// #included from: internal/catch_section.h=0D
+-#define TWOBLUECUBES_CATCH_SECTION_H_INCLUDED=0D
+-=0D
+-// #included from: catch_section_info.h=0D
+-#define TWOBLUECUBES_CATCH_SECTION_INFO_H_INCLUDED=0D
+-=0D
+-// #included from: catch_totals.hpp=0D
+-#define TWOBLUECUBES_CATCH_TOTALS_HPP_INCLUDED=0D
+-=0D
+-#include <cstddef>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct Counts {=0D
+-        Counts() : passed( 0 ), failed( 0 ), failedButOk( 0 ) {}=0D
+-=0D
+-        Counts operator - ( Counts const& other ) const {=0D
+-            Counts diff;=0D
+-            diff.passed =3D passed - other.passed;=0D
+-            diff.failed =3D failed - other.failed;=0D
+-            diff.failedButOk =3D failedButOk - other.failedButOk;=0D
+-            return diff;=0D
+-        }=0D
+-        Counts& operator +=3D ( Counts const& other ) {=0D
+-            passed +=3D other.passed;=0D
+-            failed +=3D other.failed;=0D
+-            failedButOk +=3D other.failedButOk;=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        std::size_t total() const {=0D
+-            return passed + failed + failedButOk;=0D
+-        }=0D
+-        bool allPassed() const {=0D
+-            return failed =3D=3D 0 && failedButOk =3D=3D 0;=0D
+-        }=0D
+-        bool allOk() const {=0D
+-            return failed =3D=3D 0;=0D
+-        }=0D
+-=0D
+-        std::size_t passed;=0D
+-        std::size_t failed;=0D
+-        std::size_t failedButOk;=0D
+-    };=0D
+-=0D
+-    struct Totals {=0D
+-=0D
+-        Totals operator - ( Totals const& other ) const {=0D
+-            Totals diff;=0D
+-            diff.assertions =3D assertions - other.assertions;=0D
+-            diff.testCases =3D testCases - other.testCases;=0D
+-            return diff;=0D
+-        }=0D
+-=0D
+-        Totals delta( Totals const& prevTotals ) const {=0D
+-            Totals diff =3D *this - prevTotals;=0D
+-            if( diff.assertions.failed > 0 )=0D
+-                ++diff.testCases.failed;=0D
+-            else if( diff.assertions.failedButOk > 0 )=0D
+-                ++diff.testCases.failedButOk;=0D
+-            else=0D
+-                ++diff.testCases.passed;=0D
+-            return diff;=0D
+-        }=0D
+-=0D
+-        Totals& operator +=3D ( Totals const& other ) {=0D
+-            assertions +=3D other.assertions;=0D
+-            testCases +=3D other.testCases;=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        Counts assertions;=0D
+-        Counts testCases;=0D
+-    };=0D
+-}=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct SectionInfo {=0D
+-        SectionInfo=0D
+-            (   SourceLineInfo const& _lineInfo,=0D
+-                std::string const& _name,=0D
+-                std::string const& _description =3D std::string() );=0D
+-=0D
+-        std::string name;=0D
+-        std::string description;=0D
+-        SourceLineInfo lineInfo;=0D
+-    };=0D
+-=0D
+-    struct SectionEndInfo {=0D
+-        SectionEndInfo( SectionInfo const& _sectionInfo, Counts const& _p=
revAssertions, double _durationInSeconds )=0D
+-        : sectionInfo( _sectionInfo ), prevAssertions( _prevAssertions ),=
 durationInSeconds( _durationInSeconds )=0D
+-        {}=0D
+-=0D
+-        SectionInfo sectionInfo;=0D
+-        Counts prevAssertions;=0D
+-        double durationInSeconds;=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_timer.h=0D
+-#define TWOBLUECUBES_CATCH_TIMER_H_INCLUDED=0D
+-=0D
+-#ifdef CATCH_PLATFORM_WINDOWS=0D
+-typedef unsigned long long uint64_t;=0D
+-#else=0D
+-#include <stdint.h>=0D
+-#endif=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class Timer {=0D
+-    public:=0D
+-        Timer() : m_ticks( 0 ) {}=0D
+-        void start();=0D
+-        unsigned int getElapsedMicroseconds() const;=0D
+-        unsigned int getElapsedMilliseconds() const;=0D
+-        double getElapsedSeconds() const;=0D
+-=0D
+-    private:=0D
+-        uint64_t m_ticks;=0D
+-    };=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-#include <string>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class Section : NonCopyable {=0D
+-    public:=0D
+-        Section( SectionInfo const& info );=0D
+-        ~Section();=0D
+-=0D
+-        // This indicates whether the section should be executed or not=0D
+-        operator bool() const;=0D
+-=0D
+-    private:=0D
+-        SectionInfo m_info;=0D
+-=0D
+-        std::string m_name;=0D
+-        Counts m_assertions;=0D
+-        bool m_sectionIncluded;=0D
+-        Timer m_timer;=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-#ifdef CATCH_CONFIG_VARIADIC_MACROS=0D
+-    #define INTERNAL_CATCH_SECTION( ... ) \=0D
+-        if( Catch::Section const& INTERNAL_CATCH_UNIQUE_NAME( catch_inter=
nal_Section ) =3D Catch::SectionInfo( CATCH_INTERNAL_LINEINFO, __VA_ARGS__ =
) )=0D
+-#else=0D
+-    #define INTERNAL_CATCH_SECTION( name, desc ) \=0D
+-        if( Catch::Section const& INTERNAL_CATCH_UNIQUE_NAME( catch_inter=
nal_Section ) =3D Catch::SectionInfo( CATCH_INTERNAL_LINEINFO, name, desc )=
 )=0D
+-#endif=0D
+-=0D
+-// #included from: internal/catch_generators.hpp=0D
+-#define TWOBLUECUBES_CATCH_GENERATORS_HPP_INCLUDED=0D
+-=0D
+-#include <iterator>=0D
+-#include <vector>=0D
+-#include <string>=0D
+-#include <stdlib.h>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-template<typename T>=0D
+-struct IGenerator {=0D
+-    virtual ~IGenerator() {}=0D
+-    virtual T getValue( std::size_t index ) const =3D 0;=0D
+-    virtual std::size_t size () const =3D 0;=0D
+-};=0D
+-=0D
+-template<typename T>=0D
+-class BetweenGenerator : public IGenerator<T> {=0D
+-public:=0D
+-    BetweenGenerator( T from, T to ) : m_from( from ), m_to( to ){}=0D
+-=0D
+-    virtual T getValue( std::size_t index ) const {=0D
+-        return m_from+static_cast<int>( index );=0D
+-    }=0D
+-=0D
+-    virtual std::size_t size() const {=0D
+-        return static_cast<std::size_t>( 1+m_to-m_from );=0D
+-    }=0D
+-=0D
+-private:=0D
+-=0D
+-    T m_from;=0D
+-    T m_to;=0D
+-};=0D
+-=0D
+-template<typename T>=0D
+-class ValuesGenerator : public IGenerator<T> {=0D
+-public:=0D
+-    ValuesGenerator(){}=0D
+-=0D
+-    void add( T value ) {=0D
+-        m_values.push_back( value );=0D
+-    }=0D
+-=0D
+-    virtual T getValue( std::size_t index ) const {=0D
+-        return m_values[index];=0D
+-    }=0D
+-=0D
+-    virtual std::size_t size() const {=0D
+-        return m_values.size();=0D
+-    }=0D
+-=0D
+-private:=0D
+-    std::vector<T> m_values;=0D
+-};=0D
+-=0D
+-template<typename T>=0D
+-class CompositeGenerator {=0D
+-public:=0D
+-    CompositeGenerator() : m_totalSize( 0 ) {}=0D
+-=0D
+-    // *** Move semantics, similar to auto_ptr ***=0D
+-    CompositeGenerator( CompositeGenerator& other )=0D
+-    :   m_fileInfo( other.m_fileInfo ),=0D
+-        m_totalSize( 0 )=0D
+-    {=0D
+-        move( other );=0D
+-    }=0D
+-=0D
+-    CompositeGenerator& setFileInfo( const char* fileInfo ) {=0D
+-        m_fileInfo =3D fileInfo;=0D
+-        return *this;=0D
+-    }=0D
+-=0D
+-    ~CompositeGenerator() {=0D
+-        deleteAll( m_composed );=0D
+-    }=0D
+-=0D
+-    operator T () const {=0D
+-        size_t overallIndex =3D getCurrentContext().getGeneratorIndex( m_=
fileInfo, m_totalSize );=0D
+-=0D
+-        typename std::vector<const IGenerator<T>*>::const_iterator it =3D=
 m_composed.begin();=0D
+-        typename std::vector<const IGenerator<T>*>::const_iterator itEnd =
=3D m_composed.end();=0D
+-        for( size_t index =3D 0; it !=3D itEnd; ++it )=0D
+-        {=0D
+-            const IGenerator<T>* generator =3D *it;=0D
+-            if( overallIndex >=3D index && overallIndex < index + generat=
or->size() )=0D
+-            {=0D
+-                return generator->getValue( overallIndex-index );=0D
+-            }=0D
+-            index +=3D generator->size();=0D
+-        }=0D
+-        CATCH_INTERNAL_ERROR( "Indexed past end of generated range" );=0D
+-        return T(); // Suppress spurious "not all control paths return a =
value" warning in Visual Studio - if you know how to fix this please do so=
=0D
+-    }=0D
+-=0D
+-    void add( const IGenerator<T>* generator ) {=0D
+-        m_totalSize +=3D generator->size();=0D
+-        m_composed.push_back( generator );=0D
+-    }=0D
+-=0D
+-    CompositeGenerator& then( CompositeGenerator& other ) {=0D
+-        move( other );=0D
+-        return *this;=0D
+-    }=0D
+-=0D
+-    CompositeGenerator& then( T value ) {=0D
+-        ValuesGenerator<T>* valuesGen =3D new ValuesGenerator<T>();=0D
+-        valuesGen->add( value );=0D
+-        add( valuesGen );=0D
+-        return *this;=0D
+-    }=0D
+-=0D
+-private:=0D
+-=0D
+-    void move( CompositeGenerator& other ) {=0D
+-        std::copy( other.m_composed.begin(), other.m_composed.end(), std:=
:back_inserter( m_composed ) );=0D
+-        m_totalSize +=3D other.m_totalSize;=0D
+-        other.m_composed.clear();=0D
+-    }=0D
+-=0D
+-    std::vector<const IGenerator<T>*> m_composed;=0D
+-    std::string m_fileInfo;=0D
+-    size_t m_totalSize;=0D
+-};=0D
+-=0D
+-namespace Generators=0D
+-{=0D
+-    template<typename T>=0D
+-    CompositeGenerator<T> between( T from, T to ) {=0D
+-        CompositeGenerator<T> generators;=0D
+-        generators.add( new BetweenGenerator<T>( from, to ) );=0D
+-        return generators;=0D
+-    }=0D
+-=0D
+-    template<typename T>=0D
+-    CompositeGenerator<T> values( T val1, T val2 ) {=0D
+-        CompositeGenerator<T> generators;=0D
+-        ValuesGenerator<T>* valuesGen =3D new ValuesGenerator<T>();=0D
+-        valuesGen->add( val1 );=0D
+-        valuesGen->add( val2 );=0D
+-        generators.add( valuesGen );=0D
+-        return generators;=0D
+-    }=0D
+-=0D
+-    template<typename T>=0D
+-    CompositeGenerator<T> values( T val1, T val2, T val3 ){=0D
+-        CompositeGenerator<T> generators;=0D
+-        ValuesGenerator<T>* valuesGen =3D new ValuesGenerator<T>();=0D
+-        valuesGen->add( val1 );=0D
+-        valuesGen->add( val2 );=0D
+-        valuesGen->add( val3 );=0D
+-        generators.add( valuesGen );=0D
+-        return generators;=0D
+-    }=0D
+-=0D
+-    template<typename T>=0D
+-    CompositeGenerator<T> values( T val1, T val2, T val3, T val4 ) {=0D
+-        CompositeGenerator<T> generators;=0D
+-        ValuesGenerator<T>* valuesGen =3D new ValuesGenerator<T>();=0D
+-        valuesGen->add( val1 );=0D
+-        valuesGen->add( val2 );=0D
+-        valuesGen->add( val3 );=0D
+-        valuesGen->add( val4 );=0D
+-        generators.add( valuesGen );=0D
+-        return generators;=0D
+-    }=0D
+-=0D
+-} // end namespace Generators=0D
+-=0D
+-using namespace Generators;=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-#define INTERNAL_CATCH_LINESTR2( line ) #line=0D
+-#define INTERNAL_CATCH_LINESTR( line ) INTERNAL_CATCH_LINESTR2( line )=0D
+-=0D
+-#define INTERNAL_CATCH_GENERATE( expr ) expr.setFileInfo( __FILE__ "(" IN=
TERNAL_CATCH_LINESTR( __LINE__ ) ")" )=0D
+-=0D
+-// #included from: internal/catch_interfaces_exception.h=0D
+-#define TWOBLUECUBES_CATCH_INTERFACES_EXCEPTION_H_INCLUDED=0D
+-=0D
+-#include <string>=0D
+-#include <vector>=0D
+-=0D
+-// #included from: catch_interfaces_registry_hub.h=0D
+-#define TWOBLUECUBES_CATCH_INTERFACES_REGISTRY_HUB_H_INCLUDED=0D
+-=0D
+-#include <string>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class TestCase;=0D
+-    struct ITestCaseRegistry;=0D
+-    struct IExceptionTranslatorRegistry;=0D
+-    struct IExceptionTranslator;=0D
+-    struct IReporterRegistry;=0D
+-    struct IReporterFactory;=0D
+-=0D
+-    struct IRegistryHub {=0D
+-        virtual ~IRegistryHub();=0D
+-=0D
+-        virtual IReporterRegistry const& getReporterRegistry() const =3D =
0;=0D
+-        virtual ITestCaseRegistry const& getTestCaseRegistry() const =3D =
0;=0D
+-        virtual IExceptionTranslatorRegistry& getExceptionTranslatorRegis=
try() =3D 0;=0D
+-    };=0D
+-=0D
+-    struct IMutableRegistryHub {=0D
+-        virtual ~IMutableRegistryHub();=0D
+-        virtual void registerReporter( std::string const& name, Ptr<IRepo=
rterFactory> const& factory ) =3D 0;=0D
+-        virtual void registerListener( Ptr<IReporterFactory> const& facto=
ry ) =3D 0;=0D
+-        virtual void registerTest( TestCase const& testInfo ) =3D 0;=0D
+-        virtual void registerTranslator( const IExceptionTranslator* tran=
slator ) =3D 0;=0D
+-    };=0D
+-=0D
+-    IRegistryHub& getRegistryHub();=0D
+-    IMutableRegistryHub& getMutableRegistryHub();=0D
+-    void cleanUp();=0D
+-    std::string translateActiveException();=0D
+-=0D
+-}=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    typedef std::string(*exceptionTranslateFunction)();=0D
+-=0D
+-    struct IExceptionTranslator;=0D
+-    typedef std::vector<const IExceptionTranslator*> ExceptionTranslators=
;=0D
+-=0D
+-    struct IExceptionTranslator {=0D
+-        virtual ~IExceptionTranslator();=0D
+-        virtual std::string translate( ExceptionTranslators::const_iterat=
or it, ExceptionTranslators::const_iterator itEnd ) const =3D 0;=0D
+-    };=0D
+-=0D
+-    struct IExceptionTranslatorRegistry {=0D
+-        virtual ~IExceptionTranslatorRegistry();=0D
+-=0D
+-        virtual std::string translateActiveException() const =3D 0;=0D
+-    };=0D
+-=0D
+-    class ExceptionTranslatorRegistrar {=0D
+-        template<typename T>=0D
+-        class ExceptionTranslator : public IExceptionTranslator {=0D
+-        public:=0D
+-=0D
+-            ExceptionTranslator( std::string(*translateFunction)( T& ) )=
=0D
+-            : m_translateFunction( translateFunction )=0D
+-            {}=0D
+-=0D
+-            virtual std::string translate( ExceptionTranslators::const_it=
erator it, ExceptionTranslators::const_iterator itEnd ) const CATCH_OVERRID=
E {=0D
+-                try {=0D
+-                    if( it =3D=3D itEnd )=0D
+-                        throw;=0D
+-                    else=0D
+-                        return (*it)->translate( it+1, itEnd );=0D
+-                }=0D
+-                catch( T& ex ) {=0D
+-                    return m_translateFunction( ex );=0D
+-                }=0D
+-            }=0D
+-=0D
+-        protected:=0D
+-            std::string(*m_translateFunction)( T& );=0D
+-        };=0D
+-=0D
+-    public:=0D
+-        template<typename T>=0D
+-        ExceptionTranslatorRegistrar( std::string(*translateFunction)( T&=
 ) ) {=0D
+-            getMutableRegistryHub().registerTranslator=0D
+-                ( new ExceptionTranslator<T>( translateFunction ) );=0D
+-        }=0D
+-    };=0D
+-}=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define INTERNAL_CATCH_TRANSLATE_EXCEPTION2( translatorName, signature ) =
\=0D
+-    static std::string translatorName( signature ); \=0D
+-    namespace{ Catch::ExceptionTranslatorRegistrar INTERNAL_CATCH_UNIQUE_=
NAME( catch_internal_ExceptionRegistrar )( &translatorName ); }\=0D
+-    static std::string translatorName( signature )=0D
+-=0D
+-#define INTERNAL_CATCH_TRANSLATE_EXCEPTION( signature ) INTERNAL_CATCH_TR=
ANSLATE_EXCEPTION2( INTERNAL_CATCH_UNIQUE_NAME( catch_internal_ExceptionTra=
nslator ), signature )=0D
+-=0D
+-// #included from: internal/catch_approx.hpp=0D
+-#define TWOBLUECUBES_CATCH_APPROX_HPP_INCLUDED=0D
+-=0D
+-#include <cmath>=0D
+-#include <limits>=0D
+-=0D
+-namespace Catch {=0D
+-namespace Detail {=0D
+-=0D
+-    class Approx {=0D
+-    public:=0D
+-        explicit Approx ( double value )=0D
+-        :   m_epsilon( std::numeric_limits<float>::epsilon()*100 ),=0D
+-            m_scale( 1.0 ),=0D
+-            m_value( value )=0D
+-        {}=0D
+-=0D
+-        Approx( Approx const& other )=0D
+-        :   m_epsilon( other.m_epsilon ),=0D
+-            m_scale( other.m_scale ),=0D
+-            m_value( other.m_value )=0D
+-        {}=0D
+-=0D
+-        static Approx custom() {=0D
+-            return Approx( 0 );=0D
+-        }=0D
+-=0D
+-        Approx operator()( double value ) {=0D
+-            Approx approx( value );=0D
+-            approx.epsilon( m_epsilon );=0D
+-            approx.scale( m_scale );=0D
+-            return approx;=0D
+-        }=0D
+-=0D
+-        friend bool operator =3D=3D ( double lhs, Approx const& rhs ) {=0D
+-            // Thanks to Richard Harris for his help refining this formul=
a=0D
+-            return fabs( lhs - rhs.m_value ) < rhs.m_epsilon * (rhs.m_sca=
le + (std::max)( fabs(lhs), fabs(rhs.m_value) ) );=0D
+-        }=0D
+-=0D
+-        friend bool operator =3D=3D ( Approx const& lhs, double rhs ) {=0D
+-            return operator=3D=3D( rhs, lhs );=0D
+-        }=0D
+-=0D
+-        friend bool operator !=3D ( double lhs, Approx const& rhs ) {=0D
+-            return !operator=3D=3D( lhs, rhs );=0D
+-        }=0D
+-=0D
+-        friend bool operator !=3D ( Approx const& lhs, double rhs ) {=0D
+-            return !operator=3D=3D( rhs, lhs );=0D
+-        }=0D
+-=0D
+-        friend bool operator <=3D ( double lhs, Approx const& rhs )=0D
+-        {=0D
+-          return lhs < rhs.m_value || lhs =3D=3D rhs;=0D
+-        }=0D
+-=0D
+-        friend bool operator <=3D ( Approx const& lhs, double rhs )=0D
+-        {=0D
+-          return lhs.m_value < rhs || lhs =3D=3D rhs;=0D
+-        }=0D
+-=0D
+-        friend bool operator >=3D ( double lhs, Approx const& rhs )=0D
+-        {=0D
+-          return lhs > rhs.m_value || lhs =3D=3D rhs;=0D
+-        }=0D
+-=0D
+-        friend bool operator >=3D ( Approx const& lhs, double rhs )=0D
+-        {=0D
+-          return lhs.m_value > rhs || lhs =3D=3D rhs;=0D
+-        }=0D
+-=0D
+-        Approx& epsilon( double newEpsilon ) {=0D
+-            m_epsilon =3D newEpsilon;=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        Approx& scale( double newScale ) {=0D
+-            m_scale =3D newScale;=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        std::string toString() const {=0D
+-            std::ostringstream oss;=0D
+-            oss << "Approx( " << Catch::toString( m_value ) << " )";=0D
+-            return oss.str();=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        double m_epsilon;=0D
+-        double m_scale;=0D
+-        double m_value;=0D
+-    };=0D
+-}=0D
+-=0D
+-template<>=0D
+-inline std::string toString<Detail::Approx>( Detail::Approx const& value =
) {=0D
+-    return value.toString();=0D
+-}=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: internal/catch_interfaces_tag_alias_registry.h=0D
+-#define TWOBLUECUBES_CATCH_INTERFACES_TAG_ALIAS_REGISTRY_H_INCLUDED=0D
+-=0D
+-// #included from: catch_tag_alias.h=0D
+-#define TWOBLUECUBES_CATCH_TAG_ALIAS_H_INCLUDED=0D
+-=0D
+-#include <string>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct TagAlias {=0D
+-        TagAlias( std::string _tag, SourceLineInfo _lineInfo ) : tag( _ta=
g ), lineInfo( _lineInfo ) {}=0D
+-=0D
+-        std::string tag;=0D
+-        SourceLineInfo lineInfo;=0D
+-    };=0D
+-=0D
+-    struct RegistrarForTagAliases {=0D
+-        RegistrarForTagAliases( char const* alias, char const* tag, Sourc=
eLineInfo const& lineInfo );=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-#define CATCH_REGISTER_TAG_ALIAS( alias, spec ) namespace{ Catch::Registr=
arForTagAliases INTERNAL_CATCH_UNIQUE_NAME( AutoRegisterTagAlias )( alias, =
spec, CATCH_INTERNAL_LINEINFO ); }=0D
+-// #included from: catch_option.hpp=0D
+-#define TWOBLUECUBES_CATCH_OPTION_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    // An optional type=0D
+-    template<typename T>=0D
+-    class Option {=0D
+-    public:=0D
+-        Option() : nullableValue( CATCH_NULL ) {}=0D
+-        Option( T const& _value )=0D
+-        : nullableValue( new( storage ) T( _value ) )=0D
+-        {}=0D
+-        Option( Option const& _other )=0D
+-        : nullableValue( _other ? new( storage ) T( *_other ) : CATCH_NUL=
L )=0D
+-        {}=0D
+-=0D
+-        ~Option() {=0D
+-            reset();=0D
+-        }=0D
+-=0D
+-        Option& operator=3D ( Option const& _other ) {=0D
+-            if( &_other !=3D this ) {=0D
+-                reset();=0D
+-                if( _other )=0D
+-                    nullableValue =3D new( storage ) T( *_other );=0D
+-            }=0D
+-            return *this;=0D
+-        }=0D
+-        Option& operator =3D ( T const& _value ) {=0D
+-            reset();=0D
+-            nullableValue =3D new( storage ) T( _value );=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        void reset() {=0D
+-            if( nullableValue )=0D
+-                nullableValue->~T();=0D
+-            nullableValue =3D CATCH_NULL;=0D
+-        }=0D
+-=0D
+-        T& operator*() { return *nullableValue; }=0D
+-        T const& operator*() const { return *nullableValue; }=0D
+-        T* operator->() { return nullableValue; }=0D
+-        const T* operator->() const { return nullableValue; }=0D
+-=0D
+-        T valueOr( T const& defaultValue ) const {=0D
+-            return nullableValue ? *nullableValue : defaultValue;=0D
+-        }=0D
+-=0D
+-        bool some() const { return nullableValue !=3D CATCH_NULL; }=0D
+-        bool none() const { return nullableValue =3D=3D CATCH_NULL; }=0D
+-=0D
+-        bool operator !() const { return nullableValue =3D=3D CATCH_NULL;=
 }=0D
+-        operator SafeBool::type() const {=0D
+-            return SafeBool::makeSafe( some() );=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        T* nullableValue;=0D
+-        char storage[sizeof(T)];=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct ITagAliasRegistry {=0D
+-        virtual ~ITagAliasRegistry();=0D
+-        virtual Option<TagAlias> find( std::string const& alias ) const =
=3D 0;=0D
+-        virtual std::string expandAliases( std::string const& unexpandedT=
estSpec ) const =3D 0;=0D
+-=0D
+-        static ITagAliasRegistry const& get();=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// These files are included here so the single_include script doesn't put=
 them=0D
+-// in the conditionally compiled sections=0D
+-// #included from: internal/catch_test_case_info.h=0D
+-#define TWOBLUECUBES_CATCH_TEST_CASE_INFO_H_INCLUDED=0D
+-=0D
+-#include <string>=0D
+-#include <set>=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic push=0D
+-#pragma clang diagnostic ignored "-Wpadded"=0D
+-#endif=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct ITestCase;=0D
+-=0D
+-    struct TestCaseInfo {=0D
+-        enum SpecialProperties{=0D
+-            None =3D 0,=0D
+-            IsHidden =3D 1 << 1,=0D
+-            ShouldFail =3D 1 << 2,=0D
+-            MayFail =3D 1 << 3,=0D
+-            Throws =3D 1 << 4=0D
+-        };=0D
+-=0D
+-        TestCaseInfo(   std::string const& _name,=0D
+-                        std::string const& _className,=0D
+-                        std::string const& _description,=0D
+-                        std::set<std::string> const& _tags,=0D
+-                        SourceLineInfo const& _lineInfo );=0D
+-=0D
+-        TestCaseInfo( TestCaseInfo const& other );=0D
+-=0D
+-        friend void setTags( TestCaseInfo& testCaseInfo, std::set<std::st=
ring> const& tags );=0D
+-=0D
+-        bool isHidden() const;=0D
+-        bool throws() const;=0D
+-        bool okToFail() const;=0D
+-        bool expectedToFail() const;=0D
+-=0D
+-        std::string name;=0D
+-        std::string className;=0D
+-        std::string description;=0D
+-        std::set<std::string> tags;=0D
+-        std::set<std::string> lcaseTags;=0D
+-        std::string tagsAsString;=0D
+-        SourceLineInfo lineInfo;=0D
+-        SpecialProperties properties;=0D
+-    };=0D
+-=0D
+-    class TestCase : public TestCaseInfo {=0D
+-    public:=0D
+-=0D
+-        TestCase( ITestCase* testCase, TestCaseInfo const& info );=0D
+-        TestCase( TestCase const& other );=0D
+-=0D
+-        TestCase withName( std::string const& _newName ) const;=0D
+-=0D
+-        void invoke() const;=0D
+-=0D
+-        TestCaseInfo const& getTestCaseInfo() const;=0D
+-=0D
+-        void swap( TestCase& other );=0D
+-        bool operator =3D=3D ( TestCase const& other ) const;=0D
+-        bool operator < ( TestCase const& other ) const;=0D
+-        TestCase& operator =3D ( TestCase const& other );=0D
+-=0D
+-    private:=0D
+-        Ptr<ITestCase> test;=0D
+-    };=0D
+-=0D
+-    TestCase makeTestCase(  ITestCase* testCase,=0D
+-                            std::string const& className,=0D
+-                            std::string const& name,=0D
+-                            std::string const& description,=0D
+-                            SourceLineInfo const& lineInfo );=0D
+-}=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic pop=0D
+-#endif=0D
+-=0D
+-=0D
+-#ifdef __OBJC__=0D
+-// #included from: internal/catch_objc.hpp=0D
+-#define TWOBLUECUBES_CATCH_OBJC_HPP_INCLUDED=0D
+-=0D
+-#import <objc/runtime.h>=0D
+-=0D
+-#include <string>=0D
+-=0D
+-// NB. Any general catch headers included here must be included=0D
+-// in catch.hpp first to make sure they are included by the single=0D
+-// header for non obj-usage=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-// This protocol is really only here for (self) documenting purposes, sin=
ce=0D
+-// all its methods are optional.=0D
+-@protocol OcFixture=0D
+-=0D
+-@optional=0D
+-=0D
+--(void) setUp;=0D
+--(void) tearDown;=0D
+-=0D
+-@end=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class OcMethod : public SharedImpl<ITestCase> {=0D
+-=0D
+-    public:=0D
+-        OcMethod( Class cls, SEL sel ) : m_cls( cls ), m_sel( sel ) {}=0D
+-=0D
+-        virtual void invoke() const {=0D
+-            id obj =3D [[m_cls alloc] init];=0D
+-=0D
+-            performOptionalSelector( obj, @selector(setUp)  );=0D
+-            performOptionalSelector( obj, m_sel );=0D
+-            performOptionalSelector( obj, @selector(tearDown)  );=0D
+-=0D
+-            arcSafeRelease( obj );=0D
+-        }=0D
+-    private:=0D
+-        virtual ~OcMethod() {}=0D
+-=0D
+-        Class m_cls;=0D
+-        SEL m_sel;=0D
+-    };=0D
+-=0D
+-    namespace Detail{=0D
+-=0D
+-        inline std::string getAnnotation(   Class cls,=0D
+-                                            std::string const& annotation=
Name,=0D
+-                                            std::string const& testCaseNa=
me ) {=0D
+-            NSString* selStr =3D [[NSString alloc] initWithFormat:@"Catch=
_%s_%s", annotationName.c_str(), testCaseName.c_str()];=0D
+-            SEL sel =3D NSSelectorFromString( selStr );=0D
+-            arcSafeRelease( selStr );=0D
+-            id value =3D performOptionalSelector( cls, sel );=0D
+-            if( value )=0D
+-                return [(NSString*)value UTF8String];=0D
+-            return "";=0D
+-        }=0D
+-    }=0D
+-=0D
+-    inline size_t registerTestMethods() {=0D
+-        size_t noTestMethods =3D 0;=0D
+-        int noClasses =3D objc_getClassList( CATCH_NULL, 0 );=0D
+-=0D
+-        Class* classes =3D (CATCH_UNSAFE_UNRETAINED Class *)malloc( sizeo=
f(Class) * noClasses);=0D
+-        objc_getClassList( classes, noClasses );=0D
+-=0D
+-        for( int c =3D 0; c < noClasses; c++ ) {=0D
+-            Class cls =3D classes[c];=0D
+-            {=0D
+-                u_int count;=0D
+-                Method* methods =3D class_copyMethodList( cls, &count );=
=0D
+-                for( u_int m =3D 0; m < count ; m++ ) {=0D
+-                    SEL selector =3D method_getName(methods[m]);=0D
+-                    std::string methodName =3D sel_getName(selector);=0D
+-                    if( startsWith( methodName, "Catch_TestCase_" ) ) {=0D
+-                        std::string testCaseName =3D methodName.substr( 1=
5 );=0D
+-                        std::string name =3D Detail::getAnnotation( cls, =
"Name", testCaseName );=0D
+-                        std::string desc =3D Detail::getAnnotation( cls, =
"Description", testCaseName );=0D
+-                        const char* className =3D class_getName( cls );=0D
+-=0D
+-                        getMutableRegistryHub().registerTest( makeTestCas=
e( new OcMethod( cls, selector ), className, name.c_str(), desc.c_str(), So=
urceLineInfo() ) );=0D
+-                        noTestMethods++;=0D
+-                    }=0D
+-                }=0D
+-                free(methods);=0D
+-            }=0D
+-        }=0D
+-        return noTestMethods;=0D
+-    }=0D
+-=0D
+-    namespace Matchers {=0D
+-        namespace Impl {=0D
+-        namespace NSStringMatchers {=0D
+-=0D
+-            template<typename MatcherT>=0D
+-            struct StringHolder : MatcherImpl<MatcherT, NSString*>{=0D
+-                StringHolder( NSString* substr ) : m_substr( [substr copy=
] ){}=0D
+-                StringHolder( StringHolder const& other ) : m_substr( [ot=
her.m_substr copy] ){}=0D
+-                StringHolder() {=0D
+-                    arcSafeRelease( m_substr );=0D
+-                }=0D
+-=0D
+-                NSString* m_substr;=0D
+-            };=0D
+-=0D
+-            struct Equals : StringHolder<Equals> {=0D
+-                Equals( NSString* substr ) : StringHolder( substr ){}=0D
+-=0D
+-                virtual bool match( ExpressionType const& str ) const {=0D
+-                    return  (str !=3D nil || m_substr =3D=3D nil ) &&=0D
+-                            [str isEqualToString:m_substr];=0D
+-                }=0D
+-=0D
+-                virtual std::string toString() const {=0D
+-                    return "equals string: " + Catch::toString( m_substr =
);=0D
+-                }=0D
+-            };=0D
+-=0D
+-            struct Contains : StringHolder<Contains> {=0D
+-                Contains( NSString* substr ) : StringHolder( substr ){}=0D
+-=0D
+-                virtual bool match( ExpressionType const& str ) const {=0D
+-                    return  (str !=3D nil || m_substr =3D=3D nil ) &&=0D
+-                            [str rangeOfString:m_substr].location !=3D NS=
NotFound;=0D
+-                }=0D
+-=0D
+-                virtual std::string toString() const {=0D
+-                    return "contains string: " + Catch::toString( m_subst=
r );=0D
+-                }=0D
+-            };=0D
+-=0D
+-            struct StartsWith : StringHolder<StartsWith> {=0D
+-                StartsWith( NSString* substr ) : StringHolder( substr ){}=
=0D
+-=0D
+-                virtual bool match( ExpressionType const& str ) const {=0D
+-                    return  (str !=3D nil || m_substr =3D=3D nil ) &&=0D
+-                            [str rangeOfString:m_substr].location =3D=3D =
0;=0D
+-                }=0D
+-=0D
+-                virtual std::string toString() const {=0D
+-                    return "starts with: " + Catch::toString( m_substr );=
=0D
+-                }=0D
+-            };=0D
+-            struct EndsWith : StringHolder<EndsWith> {=0D
+-                EndsWith( NSString* substr ) : StringHolder( substr ){}=0D
+-=0D
+-                virtual bool match( ExpressionType const& str ) const {=0D
+-                    return  (str !=3D nil || m_substr =3D=3D nil ) &&=0D
+-                            [str rangeOfString:m_substr].location =3D=3D =
[str length] - [m_substr length];=0D
+-                }=0D
+-=0D
+-                virtual std::string toString() const {=0D
+-                    return "ends with: " + Catch::toString( m_substr );=0D
+-                }=0D
+-            };=0D
+-=0D
+-        } // namespace NSStringMatchers=0D
+-        } // namespace Impl=0D
+-=0D
+-        inline Impl::NSStringMatchers::Equals=0D
+-            Equals( NSString* substr ){ return Impl::NSStringMatchers::Eq=
uals( substr ); }=0D
+-=0D
+-        inline Impl::NSStringMatchers::Contains=0D
+-            Contains( NSString* substr ){ return Impl::NSStringMatchers::=
Contains( substr ); }=0D
+-=0D
+-        inline Impl::NSStringMatchers::StartsWith=0D
+-            StartsWith( NSString* substr ){ return Impl::NSStringMatchers=
::StartsWith( substr ); }=0D
+-=0D
+-        inline Impl::NSStringMatchers::EndsWith=0D
+-            EndsWith( NSString* substr ){ return Impl::NSStringMatchers::=
EndsWith( substr ); }=0D
+-=0D
+-    } // namespace Matchers=0D
+-=0D
+-    using namespace Matchers;=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
//////=0D
+-#define OC_TEST_CASE( name, desc )\=0D
+-+(NSString*) INTERNAL_CATCH_UNIQUE_NAME( Catch_Name_test ) \=0D
+-{\=0D
+-return @ name; \=0D
+-}\=0D
+-+(NSString*) INTERNAL_CATCH_UNIQUE_NAME( Catch_Description_test ) \=0D
+-{ \=0D
+-return @ desc; \=0D
+-} \=0D
+--(void) INTERNAL_CATCH_UNIQUE_NAME( Catch_TestCase_test )=0D
+-=0D
+-#endif=0D
+-=0D
+-#ifdef CATCH_IMPL=0D
+-// #included from: internal/catch_impl.hpp=0D
+-#define TWOBLUECUBES_CATCH_IMPL_HPP_INCLUDED=0D
+-=0D
+-// Collect all the implementation files together here=0D
+-// These are the equivalent of what would usually be cpp files=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic push=0D
+-#pragma clang diagnostic ignored "-Wweak-vtables"=0D
+-#endif=0D
+-=0D
+-// #included from: ../catch_session.hpp=0D
+-#define TWOBLUECUBES_CATCH_RUNNER_HPP_INCLUDED=0D
+-=0D
+-// #included from: internal/catch_commandline.hpp=0D
+-#define TWOBLUECUBES_CATCH_COMMANDLINE_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_config.hpp=0D
+-#define TWOBLUECUBES_CATCH_CONFIG_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_test_spec_parser.hpp=0D
+-#define TWOBLUECUBES_CATCH_TEST_SPEC_PARSER_HPP_INCLUDED=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic push=0D
+-#pragma clang diagnostic ignored "-Wpadded"=0D
+-#endif=0D
+-=0D
+-// #included from: catch_test_spec.hpp=0D
+-#define TWOBLUECUBES_CATCH_TEST_SPEC_HPP_INCLUDED=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic push=0D
+-#pragma clang diagnostic ignored "-Wpadded"=0D
+-#endif=0D
+-=0D
+-// #included from: catch_wildcard_pattern.hpp=0D
+-#define TWOBLUECUBES_CATCH_WILDCARD_PATTERN_HPP_INCLUDED=0D
+-=0D
+-namespace Catch=0D
+-{=0D
+-    class WildcardPattern {=0D
+-        enum WildcardPosition {=0D
+-            NoWildcard =3D 0,=0D
+-            WildcardAtStart =3D 1,=0D
+-            WildcardAtEnd =3D 2,=0D
+-            WildcardAtBothEnds =3D WildcardAtStart | WildcardAtEnd=0D
+-        };=0D
+-=0D
+-    public:=0D
+-=0D
+-        WildcardPattern( std::string const& pattern, CaseSensitive::Choic=
e caseSensitivity )=0D
+-        :   m_caseSensitivity( caseSensitivity ),=0D
+-            m_wildcard( NoWildcard ),=0D
+-            m_pattern( adjustCase( pattern ) )=0D
+-        {=0D
+-            if( startsWith( m_pattern, "*" ) ) {=0D
+-                m_pattern =3D m_pattern.substr( 1 );=0D
+-                m_wildcard =3D WildcardAtStart;=0D
+-            }=0D
+-            if( endsWith( m_pattern, "*" ) ) {=0D
+-                m_pattern =3D m_pattern.substr( 0, m_pattern.size()-1 );=
=0D
+-                m_wildcard =3D static_cast<WildcardPosition>( m_wildcard =
| WildcardAtEnd );=0D
+-            }=0D
+-        }=0D
+-        virtual ~WildcardPattern();=0D
+-        virtual bool matches( std::string const& str ) const {=0D
+-            switch( m_wildcard ) {=0D
+-                case NoWildcard:=0D
+-                    return m_pattern =3D=3D adjustCase( str );=0D
+-                case WildcardAtStart:=0D
+-                    return endsWith( adjustCase( str ), m_pattern );=0D
+-                case WildcardAtEnd:=0D
+-                    return startsWith( adjustCase( str ), m_pattern );=0D
+-                case WildcardAtBothEnds:=0D
+-                    return contains( adjustCase( str ), m_pattern );=0D
+-            }=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic push=0D
+-#pragma clang diagnostic ignored "-Wunreachable-code"=0D
+-#endif=0D
+-            throw std::logic_error( "Unknown enum" );=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic pop=0D
+-#endif=0D
+-        }=0D
+-    private:=0D
+-        std::string adjustCase( std::string const& str ) const {=0D
+-            return m_caseSensitivity =3D=3D CaseSensitive::No ? toLower( =
str ) : str;=0D
+-        }=0D
+-        CaseSensitive::Choice m_caseSensitivity;=0D
+-        WildcardPosition m_wildcard;=0D
+-        std::string m_pattern;=0D
+-    };=0D
+-}=0D
+-=0D
+-#include <string>=0D
+-#include <vector>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class TestSpec {=0D
+-        struct Pattern : SharedImpl<> {=0D
+-            virtual ~Pattern();=0D
+-            virtual bool matches( TestCaseInfo const& testCase ) const =
=3D 0;=0D
+-        };=0D
+-        class NamePattern : public Pattern {=0D
+-        public:=0D
+-            NamePattern( std::string const& name )=0D
+-            : m_wildcardPattern( toLower( name ), CaseSensitive::No )=0D
+-            {}=0D
+-            virtual ~NamePattern();=0D
+-            virtual bool matches( TestCaseInfo const& testCase ) const {=
=0D
+-                return m_wildcardPattern.matches( toLower( testCase.name =
) );=0D
+-            }=0D
+-        private:=0D
+-            WildcardPattern m_wildcardPattern;=0D
+-        };=0D
+-=0D
+-        class TagPattern : public Pattern {=0D
+-        public:=0D
+-            TagPattern( std::string const& tag ) : m_tag( toLower( tag ) =
) {}=0D
+-            virtual ~TagPattern();=0D
+-            virtual bool matches( TestCaseInfo const& testCase ) const {=
=0D
+-                return testCase.lcaseTags.find( m_tag ) !=3D testCase.lca=
seTags.end();=0D
+-            }=0D
+-        private:=0D
+-            std::string m_tag;=0D
+-        };=0D
+-=0D
+-        class ExcludedPattern : public Pattern {=0D
+-        public:=0D
+-            ExcludedPattern( Ptr<Pattern> const& underlyingPattern ) : m_=
underlyingPattern( underlyingPattern ) {}=0D
+-            virtual ~ExcludedPattern();=0D
+-            virtual bool matches( TestCaseInfo const& testCase ) const { =
return !m_underlyingPattern->matches( testCase ); }=0D
+-        private:=0D
+-            Ptr<Pattern> m_underlyingPattern;=0D
+-        };=0D
+-=0D
+-        struct Filter {=0D
+-            std::vector<Ptr<Pattern> > m_patterns;=0D
+-=0D
+-            bool matches( TestCaseInfo const& testCase ) const {=0D
+-                // All patterns in a filter must match for the filter to =
be a match=0D
+-                for( std::vector<Ptr<Pattern> >::const_iterator it =3D m_=
patterns.begin(), itEnd =3D m_patterns.end(); it !=3D itEnd; ++it ) {=0D
+-                    if( !(*it)->matches( testCase ) )=0D
+-                        return false;=0D
+-                }=0D
+-                return true;=0D
+-            }=0D
+-        };=0D
+-=0D
+-    public:=0D
+-        bool hasFilters() const {=0D
+-            return !m_filters.empty();=0D
+-        }=0D
+-        bool matches( TestCaseInfo const& testCase ) const {=0D
+-            // A TestSpec matches if any filter matches=0D
+-            for( std::vector<Filter>::const_iterator it =3D m_filters.beg=
in(), itEnd =3D m_filters.end(); it !=3D itEnd; ++it )=0D
+-                if( it->matches( testCase ) )=0D
+-                    return true;=0D
+-            return false;=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        std::vector<Filter> m_filters;=0D
+-=0D
+-        friend class TestSpecParser;=0D
+-    };=0D
+-}=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic pop=0D
+-#endif=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class TestSpecParser {=0D
+-        enum Mode{ None, Name, QuotedName, Tag, EscapedName };=0D
+-        Mode m_mode;=0D
+-        bool m_exclusion;=0D
+-        std::size_t m_start, m_pos;=0D
+-        std::string m_arg;=0D
+-        std::vector<std::size_t> m_escapeChars;=0D
+-        TestSpec::Filter m_currentFilter;=0D
+-        TestSpec m_testSpec;=0D
+-        ITagAliasRegistry const* m_tagAliases;=0D
+-=0D
+-    public:=0D
+-        TestSpecParser( ITagAliasRegistry const& tagAliases ) : m_tagAlia=
ses( &tagAliases ) {}=0D
+-=0D
+-        TestSpecParser& parse( std::string const& arg ) {=0D
+-            m_mode =3D None;=0D
+-            m_exclusion =3D false;=0D
+-            m_start =3D std::string::npos;=0D
+-            m_arg =3D m_tagAliases->expandAliases( arg );=0D
+-            m_escapeChars.clear();=0D
+-            for( m_pos =3D 0; m_pos < m_arg.size(); ++m_pos )=0D
+-                visitChar( m_arg[m_pos] );=0D
+-            if( m_mode =3D=3D Name )=0D
+-                addPattern<TestSpec::NamePattern>();=0D
+-            return *this;=0D
+-        }=0D
+-        TestSpec testSpec() {=0D
+-            addFilter();=0D
+-            return m_testSpec;=0D
+-        }=0D
+-    private:=0D
+-        void visitChar( char c ) {=0D
+-            if( m_mode =3D=3D None ) {=0D
+-                switch( c ) {=0D
+-                case ' ': return;=0D
+-                case '~': m_exclusion =3D true; return;=0D
+-                case '[': return startNewMode( Tag, ++m_pos );=0D
+-                case '"': return startNewMode( QuotedName, ++m_pos );=0D
+-                case '\\': return escape();=0D
+-                default: startNewMode( Name, m_pos ); break;=0D
+-                }=0D
+-            }=0D
+-            if( m_mode =3D=3D Name ) {=0D
+-                if( c =3D=3D ',' ) {=0D
+-                    addPattern<TestSpec::NamePattern>();=0D
+-                    addFilter();=0D
+-                }=0D
+-                else if( c =3D=3D '[' ) {=0D
+-                    if( subString() =3D=3D "exclude:" )=0D
+-                        m_exclusion =3D true;=0D
+-                    else=0D
+-                        addPattern<TestSpec::NamePattern>();=0D
+-                    startNewMode( Tag, ++m_pos );=0D
+-                }=0D
+-                else if( c =3D=3D '\\' )=0D
+-                    escape();=0D
+-            }=0D
+-            else if( m_mode =3D=3D EscapedName )=0D
+-                m_mode =3D Name;=0D
+-            else if( m_mode =3D=3D QuotedName && c =3D=3D '"' )=0D
+-                addPattern<TestSpec::NamePattern>();=0D
+-            else if( m_mode =3D=3D Tag && c =3D=3D ']' )=0D
+-                addPattern<TestSpec::TagPattern>();=0D
+-        }=0D
+-        void startNewMode( Mode mode, std::size_t start ) {=0D
+-            m_mode =3D mode;=0D
+-            m_start =3D start;=0D
+-        }=0D
+-        void escape() {=0D
+-            m_mode =3D EscapedName;=0D
+-            m_escapeChars.push_back( m_pos );=0D
+-        }=0D
+-        std::string subString() const { return m_arg.substr( m_start, m_p=
os - m_start ); }=0D
+-        template<typename T>=0D
+-        void addPattern() {=0D
+-            std::string token =3D subString();=0D
+-            for( size_t i =3D 0; i < m_escapeChars.size(); ++i )=0D
+-                token =3D token.substr( 0, m_escapeChars[i] ) + token.sub=
str( m_escapeChars[i]+1 );=0D
+-            m_escapeChars.clear();=0D
+-            if( startsWith( token, "exclude:" ) ) {=0D
+-                m_exclusion =3D true;=0D
+-                token =3D token.substr( 8 );=0D
+-            }=0D
+-            if( !token.empty() ) {=0D
+-                Ptr<TestSpec::Pattern> pattern =3D new T( token );=0D
+-                if( m_exclusion )=0D
+-                    pattern =3D new TestSpec::ExcludedPattern( pattern );=
=0D
+-                m_currentFilter.m_patterns.push_back( pattern );=0D
+-            }=0D
+-            m_exclusion =3D false;=0D
+-            m_mode =3D None;=0D
+-        }=0D
+-        void addFilter() {=0D
+-            if( !m_currentFilter.m_patterns.empty() ) {=0D
+-                m_testSpec.m_filters.push_back( m_currentFilter );=0D
+-                m_currentFilter =3D TestSpec::Filter();=0D
+-            }=0D
+-        }=0D
+-    };=0D
+-    inline TestSpec parseTestSpec( std::string const& arg ) {=0D
+-        return TestSpecParser( ITagAliasRegistry::get() ).parse( arg ).te=
stSpec();=0D
+-    }=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic pop=0D
+-#endif=0D
+-=0D
+-// #included from: catch_interfaces_config.h=0D
+-#define TWOBLUECUBES_CATCH_INTERFACES_CONFIG_H_INCLUDED=0D
+-=0D
+-#include <iostream>=0D
+-#include <string>=0D
+-#include <vector>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct Verbosity { enum Level {=0D
+-        NoOutput =3D 0,=0D
+-        Quiet,=0D
+-        Normal=0D
+-    }; };=0D
+-=0D
+-    struct WarnAbout { enum What {=0D
+-        Nothing =3D 0x00,=0D
+-        NoAssertions =3D 0x01=0D
+-    }; };=0D
+-=0D
+-    struct ShowDurations { enum OrNot {=0D
+-        DefaultForReporter,=0D
+-        Always,=0D
+-        Never=0D
+-    }; };=0D
+-    struct RunTests { enum InWhatOrder {=0D
+-        InDeclarationOrder,=0D
+-        InLexicographicalOrder,=0D
+-        InRandomOrder=0D
+-    }; };=0D
+-    struct UseColour { enum YesOrNo {=0D
+-        Auto,=0D
+-        Yes,=0D
+-        No=0D
+-    }; };=0D
+-=0D
+-    class TestSpec;=0D
+-=0D
+-    struct IConfig : IShared {=0D
+-=0D
+-        virtual ~IConfig();=0D
+-=0D
+-        virtual bool allowThrows() const =3D 0;=0D
+-        virtual std::ostream& stream() const =3D 0;=0D
+-        virtual std::string name() const =3D 0;=0D
+-        virtual bool includeSuccessfulResults() const =3D 0;=0D
+-        virtual bool shouldDebugBreak() const =3D 0;=0D
+-        virtual bool warnAboutMissingAssertions() const =3D 0;=0D
+-        virtual int abortAfter() const =3D 0;=0D
+-        virtual bool showInvisibles() const =3D 0;=0D
+-        virtual ShowDurations::OrNot showDurations() const =3D 0;=0D
+-        virtual TestSpec const& testSpec() const =3D 0;=0D
+-        virtual RunTests::InWhatOrder runOrder() const =3D 0;=0D
+-        virtual unsigned int rngSeed() const =3D 0;=0D
+-        virtual UseColour::YesOrNo useColour() const =3D 0;=0D
+-    };=0D
+-}=0D
+-=0D
+-// #included from: catch_stream.h=0D
+-#define TWOBLUECUBES_CATCH_STREAM_H_INCLUDED=0D
+-=0D
+-// #included from: catch_streambuf.h=0D
+-#define TWOBLUECUBES_CATCH_STREAMBUF_H_INCLUDED=0D
+-=0D
+-#include <streambuf>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class StreamBufBase : public std::streambuf {=0D
+-    public:=0D
+-        virtual ~StreamBufBase() CATCH_NOEXCEPT;=0D
+-    };=0D
+-}=0D
+-=0D
+-#include <streambuf>=0D
+-#include <ostream>=0D
+-#include <fstream>=0D
+-#include <memory>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    std::ostream& cout();=0D
+-    std::ostream& cerr();=0D
+-=0D
+-    struct IStream {=0D
+-        virtual ~IStream() CATCH_NOEXCEPT;=0D
+-        virtual std::ostream& stream() const =3D 0;=0D
+-    };=0D
+-=0D
+-    class FileStream : public IStream {=0D
+-        mutable std::ofstream m_ofs;=0D
+-    public:=0D
+-        FileStream( std::string const& filename );=0D
+-        virtual ~FileStream() CATCH_NOEXCEPT;=0D
+-    public: // IStream=0D
+-        virtual std::ostream& stream() const CATCH_OVERRIDE;=0D
+-    };=0D
+-=0D
+-    class CoutStream : public IStream {=0D
+-        mutable std::ostream m_os;=0D
+-    public:=0D
+-        CoutStream();=0D
+-        virtual ~CoutStream() CATCH_NOEXCEPT;=0D
+-=0D
+-    public: // IStream=0D
+-        virtual std::ostream& stream() const CATCH_OVERRIDE;=0D
+-    };=0D
+-=0D
+-    class DebugOutStream : public IStream {=0D
+-        CATCH_AUTO_PTR( StreamBufBase ) m_streamBuf;=0D
+-        mutable std::ostream m_os;=0D
+-    public:=0D
+-        DebugOutStream();=0D
+-        virtual ~DebugOutStream() CATCH_NOEXCEPT;=0D
+-=0D
+-    public: // IStream=0D
+-        virtual std::ostream& stream() const CATCH_OVERRIDE;=0D
+-    };=0D
+-}=0D
+-=0D
+-#include <memory>=0D
+-#include <vector>=0D
+-#include <string>=0D
+-#include <iostream>=0D
+-#include <ctime>=0D
+-=0D
+-#ifndef CATCH_CONFIG_CONSOLE_WIDTH=0D
+-#define CATCH_CONFIG_CONSOLE_WIDTH 80=0D
+-#endif=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct ConfigData {=0D
+-=0D
+-        ConfigData()=0D
+-        :   listTests( false ),=0D
+-            listTags( false ),=0D
+-            listReporters( false ),=0D
+-            listTestNamesOnly( false ),=0D
+-            showSuccessfulTests( false ),=0D
+-            shouldDebugBreak( false ),=0D
+-            noThrow( false ),=0D
+-            showHelp( false ),=0D
+-            showInvisibles( false ),=0D
+-            filenamesAsTags( false ),=0D
+-            abortAfter( -1 ),=0D
+-            rngSeed( 0 ),=0D
+-            verbosity( Verbosity::Normal ),=0D
+-            warnings( WarnAbout::Nothing ),=0D
+-            showDurations( ShowDurations::DefaultForReporter ),=0D
+-            runOrder( RunTests::InDeclarationOrder ),=0D
+-            useColour( UseColour::Auto )=0D
+-        {}=0D
+-=0D
+-        bool listTests;=0D
+-        bool listTags;=0D
+-        bool listReporters;=0D
+-        bool listTestNamesOnly;=0D
+-=0D
+-        bool showSuccessfulTests;=0D
+-        bool shouldDebugBreak;=0D
+-        bool noThrow;=0D
+-        bool showHelp;=0D
+-        bool showInvisibles;=0D
+-        bool filenamesAsTags;=0D
+-=0D
+-        int abortAfter;=0D
+-        unsigned int rngSeed;=0D
+-=0D
+-        Verbosity::Level verbosity;=0D
+-        WarnAbout::What warnings;=0D
+-        ShowDurations::OrNot showDurations;=0D
+-        RunTests::InWhatOrder runOrder;=0D
+-        UseColour::YesOrNo useColour;=0D
+-=0D
+-        std::string outputFilename;=0D
+-        std::string name;=0D
+-        std::string processName;=0D
+-=0D
+-        std::vector<std::string> reporterNames;=0D
+-        std::vector<std::string> testsOrTags;=0D
+-    };=0D
+-=0D
+-    class Config : public SharedImpl<IConfig> {=0D
+-    private:=0D
+-        Config( Config const& other );=0D
+-        Config& operator =3D ( Config const& other );=0D
+-        virtual void dummy();=0D
+-    public:=0D
+-=0D
+-        Config()=0D
+-        {}=0D
+-=0D
+-        Config( ConfigData const& data )=0D
+-        :   m_data( data ),=0D
+-            m_stream( openStream() )=0D
+-        {=0D
+-            if( !data.testsOrTags.empty() ) {=0D
+-                TestSpecParser parser( ITagAliasRegistry::get() );=0D
+-                for( std::size_t i =3D 0; i < data.testsOrTags.size(); ++=
i )=0D
+-                    parser.parse( data.testsOrTags[i] );=0D
+-                m_testSpec =3D parser.testSpec();=0D
+-            }=0D
+-        }=0D
+-=0D
+-        virtual ~Config() {=0D
+-        }=0D
+-=0D
+-        std::string const& getFilename() const {=0D
+-            return m_data.outputFilename ;=0D
+-        }=0D
+-=0D
+-        bool listTests() const { return m_data.listTests; }=0D
+-        bool listTestNamesOnly() const { return m_data.listTestNamesOnly;=
 }=0D
+-        bool listTags() const { return m_data.listTags; }=0D
+-        bool listReporters() const { return m_data.listReporters; }=0D
+-=0D
+-        std::string getProcessName() const { return m_data.processName; }=
=0D
+-=0D
+-        bool shouldDebugBreak() const { return m_data.shouldDebugBreak; }=
=0D
+-=0D
+-        std::vector<std::string> getReporterNames() const { return m_data=
.reporterNames; }=0D
+-=0D
+-        int abortAfter() const { return m_data.abortAfter; }=0D
+-=0D
+-        TestSpec const& testSpec() const { return m_testSpec; }=0D
+-=0D
+-        bool showHelp() const { return m_data.showHelp; }=0D
+-        bool showInvisibles() const { return m_data.showInvisibles; }=0D
+-=0D
+-        // IConfig interface=0D
+-        virtual bool allowThrows() const        { return !m_data.noThrow;=
 }=0D
+-        virtual std::ostream& stream() const    { return m_stream->stream=
(); }=0D
+-        virtual std::string name() const        { return m_data.name.empt=
y() ? m_data.processName : m_data.name; }=0D
+-        virtual bool includeSuccessfulResults() const   { return m_data.s=
howSuccessfulTests; }=0D
+-        virtual bool warnAboutMissingAssertions() const { return m_data.w=
arnings & WarnAbout::NoAssertions; }=0D
+-        virtual ShowDurations::OrNot showDurations() const { return m_dat=
a.showDurations; }=0D
+-        virtual RunTests::InWhatOrder runOrder() const  { return m_data.r=
unOrder; }=0D
+-        virtual unsigned int rngSeed() const    { return m_data.rngSeed; =
}=0D
+-        virtual UseColour::YesOrNo useColour() const { return m_data.useC=
olour; }=0D
+-=0D
+-    private:=0D
+-=0D
+-        IStream const* openStream() {=0D
+-            if( m_data.outputFilename.empty() )=0D
+-                return new CoutStream();=0D
+-            else if( m_data.outputFilename[0] =3D=3D '%' ) {=0D
+-                if( m_data.outputFilename =3D=3D "%debug" )=0D
+-                    return new DebugOutStream();=0D
+-                else=0D
+-                    throw std::domain_error( "Unrecognised stream: " + m_=
data.outputFilename );=0D
+-            }=0D
+-            else=0D
+-                return new FileStream( m_data.outputFilename );=0D
+-        }=0D
+-        ConfigData m_data;=0D
+-=0D
+-        CATCH_AUTO_PTR( IStream const ) m_stream;=0D
+-        TestSpec m_testSpec;=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_clara.h=0D
+-#define TWOBLUECUBES_CATCH_CLARA_H_INCLUDED=0D
+-=0D
+-// Use Catch's value for console width (store Clara's off to the side, if=
 present)=0D
+-#ifdef CLARA_CONFIG_CONSOLE_WIDTH=0D
+-#define CATCH_TEMP_CLARA_CONFIG_CONSOLE_WIDTH CLARA_CONFIG_CONSOLE_WIDTH=
=0D
+-#undef CLARA_CONFIG_CONSOLE_WIDTH=0D
+-#endif=0D
+-#define CLARA_CONFIG_CONSOLE_WIDTH CATCH_CONFIG_CONSOLE_WIDTH=0D
+-=0D
+-// Declare Clara inside the Catch namespace=0D
+-#define STITCH_CLARA_OPEN_NAMESPACE namespace Catch {=0D
+-// #included from: ../external/clara.h=0D
+-=0D
+-// Version 0.0.2.4=0D
+-=0D
+-// Only use header guard if we are not using an outer namespace=0D
+-#if !defined(TWOBLUECUBES_CLARA_H_INCLUDED) || defined(STITCH_CLARA_OPEN_=
NAMESPACE)=0D
+-=0D
+-#ifndef STITCH_CLARA_OPEN_NAMESPACE=0D
+-#define TWOBLUECUBES_CLARA_H_INCLUDED=0D
+-#define STITCH_CLARA_OPEN_NAMESPACE=0D
+-#define STITCH_CLARA_CLOSE_NAMESPACE=0D
+-#else=0D
+-#define STITCH_CLARA_CLOSE_NAMESPACE }=0D
+-#endif=0D
+-=0D
+-#define STITCH_TBC_TEXT_FORMAT_OPEN_NAMESPACE STITCH_CLARA_OPEN_NAMESPACE=
=0D
+-=0D
+-// ----------- #included from tbc_text_format.h -----------=0D
+-=0D
+-// Only use header guard if we are not using an outer namespace=0D
+-#if !defined(TBC_TEXT_FORMAT_H_INCLUDED) || defined(STITCH_TBC_TEXT_FORMA=
T_OUTER_NAMESPACE)=0D
+-#ifndef STITCH_TBC_TEXT_FORMAT_OUTER_NAMESPACE=0D
+-#define TBC_TEXT_FORMAT_H_INCLUDED=0D
+-#endif=0D
+-=0D
+-#include <string>=0D
+-#include <vector>=0D
+-#include <sstream>=0D
+-#include <algorithm>=0D
+-=0D
+-// Use optional outer namespace=0D
+-#ifdef STITCH_TBC_TEXT_FORMAT_OUTER_NAMESPACE=0D
+-namespace STITCH_TBC_TEXT_FORMAT_OUTER_NAMESPACE {=0D
+-#endif=0D
+-=0D
+-namespace Tbc {=0D
+-=0D
+-#ifdef TBC_TEXT_FORMAT_CONSOLE_WIDTH=0D
+-    const unsigned int consoleWidth =3D TBC_TEXT_FORMAT_CONSOLE_WIDTH;=0D
+-#else=0D
+-    const unsigned int consoleWidth =3D 80;=0D
+-#endif=0D
+-=0D
+-    struct TextAttributes {=0D
+-        TextAttributes()=0D
+-        :   initialIndent( std::string::npos ),=0D
+-            indent( 0 ),=0D
+-            width( consoleWidth-1 ),=0D
+-            tabChar( '\t' )=0D
+-        {}=0D
+-=0D
+-        TextAttributes& setInitialIndent( std::size_t _value )  { initial=
Indent =3D _value; return *this; }=0D
+-        TextAttributes& setIndent( std::size_t _value )         { indent =
=3D _value; return *this; }=0D
+-        TextAttributes& setWidth( std::size_t _value )          { width =
=3D _value; return *this; }=0D
+-        TextAttributes& setTabChar( char _value )               { tabChar=
 =3D _value; return *this; }=0D
+-=0D
+-        std::size_t initialIndent;  // indent of first line, or npos=0D
+-        std::size_t indent;         // indent of subsequent lines, or all=
 if initialIndent is npos=0D
+-        std::size_t width;          // maximum width of text, including i=
ndent. Longer text will wrap=0D
+-        char tabChar;               // If this char is seen the indent is=
 changed to current pos=0D
+-    };=0D
+-=0D
+-    class Text {=0D
+-    public:=0D
+-        Text( std::string const& _str, TextAttributes const& _attr =3D Te=
xtAttributes() )=0D
+-        : attr( _attr )=0D
+-        {=0D
+-            std::string wrappableChars =3D " [({.,/|\\-";=0D
+-            std::size_t indent =3D _attr.initialIndent !=3D std::string::=
npos=0D
+-                ? _attr.initialIndent=0D
+-                : _attr.indent;=0D
+-            std::string remainder =3D _str;=0D
+-=0D
+-            while( !remainder.empty() ) {=0D
+-                if( lines.size() >=3D 1000 ) {=0D
+-                    lines.push_back( "... message truncated due to excess=
ive size" );=0D
+-                    return;=0D
+-                }=0D
+-                std::size_t tabPos =3D std::string::npos;=0D
+-                std::size_t width =3D (std::min)( remainder.size(), _attr=
.width - indent );=0D
+-                std::size_t pos =3D remainder.find_first_of( '\n' );=0D
+-                if( pos <=3D width ) {=0D
+-                    width =3D pos;=0D
+-                }=0D
+-                pos =3D remainder.find_last_of( _attr.tabChar, width );=0D
+-                if( pos !=3D std::string::npos ) {=0D
+-                    tabPos =3D pos;=0D
+-                    if( remainder[width] =3D=3D '\n' )=0D
+-                        width--;=0D
+-                    remainder =3D remainder.substr( 0, tabPos ) + remaind=
er.substr( tabPos+1 );=0D
+-                }=0D
+-=0D
+-                if( width =3D=3D remainder.size() ) {=0D
+-                    spliceLine( indent, remainder, width );=0D
+-                }=0D
+-                else if( remainder[width] =3D=3D '\n' ) {=0D
+-                    spliceLine( indent, remainder, width );=0D
+-                    if( width <=3D 1 || remainder.size() !=3D 1 )=0D
+-                        remainder =3D remainder.substr( 1 );=0D
+-                    indent =3D _attr.indent;=0D
+-                }=0D
+-                else {=0D
+-                    pos =3D remainder.find_last_of( wrappableChars, width=
 );=0D
+-                    if( pos !=3D std::string::npos && pos > 0 ) {=0D
+-                        spliceLine( indent, remainder, pos );=0D
+-                        if( remainder[0] =3D=3D ' ' )=0D
+-                            remainder =3D remainder.substr( 1 );=0D
+-                    }=0D
+-                    else {=0D
+-                        spliceLine( indent, remainder, width-1 );=0D
+-                        lines.back() +=3D "-";=0D
+-                    }=0D
+-                    if( lines.size() =3D=3D 1 )=0D
+-                        indent =3D _attr.indent;=0D
+-                    if( tabPos !=3D std::string::npos )=0D
+-                        indent +=3D tabPos;=0D
+-                }=0D
+-            }=0D
+-        }=0D
+-=0D
+-        void spliceLine( std::size_t _indent, std::string& _remainder, st=
d::size_t _pos ) {=0D
+-            lines.push_back( std::string( _indent, ' ' ) + _remainder.sub=
str( 0, _pos ) );=0D
+-            _remainder =3D _remainder.substr( _pos );=0D
+-        }=0D
+-=0D
+-        typedef std::vector<std::string>::const_iterator const_iterator;=
=0D
+-=0D
+-        const_iterator begin() const { return lines.begin(); }=0D
+-        const_iterator end() const { return lines.end(); }=0D
+-        std::string const& last() const { return lines.back(); }=0D
+-        std::size_t size() const { return lines.size(); }=0D
+-        std::string const& operator[]( std::size_t _index ) const { retur=
n lines[_index]; }=0D
+-        std::string toString() const {=0D
+-            std::ostringstream oss;=0D
+-            oss << *this;=0D
+-            return oss.str();=0D
+-        }=0D
+-=0D
+-        inline friend std::ostream& operator << ( std::ostream& _stream, =
Text const& _text ) {=0D
+-            for( Text::const_iterator it =3D _text.begin(), itEnd =3D _te=
xt.end();=0D
+-                it !=3D itEnd; ++it ) {=0D
+-                if( it !=3D _text.begin() )=0D
+-                    _stream << "\n";=0D
+-                _stream << *it;=0D
+-            }=0D
+-            return _stream;=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        std::string str;=0D
+-        TextAttributes attr;=0D
+-        std::vector<std::string> lines;=0D
+-    };=0D
+-=0D
+-} // end namespace Tbc=0D
+-=0D
+-#ifdef STITCH_TBC_TEXT_FORMAT_OUTER_NAMESPACE=0D
+-} // end outer namespace=0D
+-#endif=0D
+-=0D
+-#endif // TBC_TEXT_FORMAT_H_INCLUDED=0D
+-=0D
+-// ----------- end of #include from tbc_text_format.h -----------=0D
+-// ........... back in clara.h=0D
+-=0D
+-#undef STITCH_TBC_TEXT_FORMAT_OPEN_NAMESPACE=0D
+-=0D
+-// ----------- #included from clara_compilers.h -----------=0D
+-=0D
+-#ifndef TWOBLUECUBES_CLARA_COMPILERS_H_INCLUDED=0D
+-#define TWOBLUECUBES_CLARA_COMPILERS_H_INCLUDED=0D
+-=0D
+-// Detect a number of compiler features - mostly C++11/14 conformance - b=
y compiler=0D
+-// The following features are defined:=0D
+-//=0D
+-// CLARA_CONFIG_CPP11_NULLPTR : is nullptr supported?=0D
+-// CLARA_CONFIG_CPP11_NOEXCEPT : is noexcept supported?=0D
+-// CLARA_CONFIG_CPP11_GENERATED_METHODS : The delete and default keywords=
 for compiler generated methods=0D
+-// CLARA_CONFIG_CPP11_OVERRIDE : is override supported?=0D
+-// CLARA_CONFIG_CPP11_UNIQUE_PTR : is unique_ptr supported (otherwise use=
 auto_ptr)=0D
+-=0D
+-// CLARA_CONFIG_CPP11_OR_GREATER : Is C++11 supported?=0D
+-=0D
+-// CLARA_CONFIG_VARIADIC_MACROS : are variadic macros supported?=0D
+-=0D
+-// In general each macro has a _NO_<feature name> form=0D
+-// (e.g. CLARA_CONFIG_CPP11_NO_NULLPTR) which disables the feature.=0D
+-// Many features, at point of detection, define an _INTERNAL_ macro, so t=
hey=0D
+-// can be combined, en-mass, with the _NO_ forms later.=0D
+-=0D
+-// All the C++11 features can be disabled with CLARA_CONFIG_NO_CPP11=0D
+-=0D
+-#ifdef __clang__=0D
+-=0D
+-#if __has_feature(cxx_nullptr)=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_NULLPTR=0D
+-#endif=0D
+-=0D
+-#if __has_feature(cxx_noexcept)=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_NOEXCEPT=0D
+-#endif=0D
+-=0D
+-#endif // __clang__=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
///////=0D
+-// GCC=0D
+-#ifdef __GNUC__=0D
+-=0D
+-#if __GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 6 && defined(__GXX_EXPERIMEN=
TAL_CXX0X__)=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_NULLPTR=0D
+-#endif=0D
+-=0D
+-// - otherwise more recent versions define __cplusplus >=3D 201103L=0D
+-// and will get picked up below=0D
+-=0D
+-#endif // __GNUC__=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
///////=0D
+-// Visual C++=0D
+-#ifdef _MSC_VER=0D
+-=0D
+-#if (_MSC_VER >=3D 1600)=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_NULLPTR=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_UNIQUE_PTR=0D
+-#endif=0D
+-=0D
+-#if (_MSC_VER >=3D 1900 ) // (VC++ 13 (VS2015))=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_NOEXCEPT=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_GENERATED_METHODS=0D
+-#endif=0D
+-=0D
+-#endif // _MSC_VER=0D
+-=0D
+-/////////////////////////////////////////////////////////////////////////=
///////=0D
+-// C++ language feature support=0D
+-=0D
+-// catch all support for C++11=0D
+-#if defined(__cplusplus) && __cplusplus >=3D 201103L=0D
+-=0D
+-#define CLARA_CPP11_OR_GREATER=0D
+-=0D
+-#if !defined(CLARA_INTERNAL_CONFIG_CPP11_NULLPTR)=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_NULLPTR=0D
+-#endif=0D
+-=0D
+-#ifndef CLARA_INTERNAL_CONFIG_CPP11_NOEXCEPT=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_NOEXCEPT=0D
+-#endif=0D
+-=0D
+-#ifndef CLARA_INTERNAL_CONFIG_CPP11_GENERATED_METHODS=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_GENERATED_METHODS=0D
+-#endif=0D
+-=0D
+-#if !defined(CLARA_INTERNAL_CONFIG_CPP11_OVERRIDE)=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_OVERRIDE=0D
+-#endif=0D
+-#if !defined(CLARA_INTERNAL_CONFIG_CPP11_UNIQUE_PTR)=0D
+-#define CLARA_INTERNAL_CONFIG_CPP11_UNIQUE_PTR=0D
+-#endif=0D
+-=0D
+-#endif // __cplusplus >=3D 201103L=0D
+-=0D
+-// Now set the actual defines based on the above + anything the user has =
configured=0D
+-#if defined(CLARA_INTERNAL_CONFIG_CPP11_NULLPTR) && !defined(CLARA_CONFIG=
_CPP11_NO_NULLPTR) && !defined(CLARA_CONFIG_CPP11_NULLPTR) && !defined(CLAR=
A_CONFIG_NO_CPP11)=0D
+-#define CLARA_CONFIG_CPP11_NULLPTR=0D
+-#endif=0D
+-#if defined(CLARA_INTERNAL_CONFIG_CPP11_NOEXCEPT) && !defined(CLARA_CONFI=
G_CPP11_NO_NOEXCEPT) && !defined(CLARA_CONFIG_CPP11_NOEXCEPT) && !defined(C=
LARA_CONFIG_NO_CPP11)=0D
+-#define CLARA_CONFIG_CPP11_NOEXCEPT=0D
+-#endif=0D
+-#if defined(CLARA_INTERNAL_CONFIG_CPP11_GENERATED_METHODS) && !defined(CL=
ARA_CONFIG_CPP11_NO_GENERATED_METHODS) && !defined(CLARA_CONFIG_CPP11_GENER=
ATED_METHODS) && !defined(CLARA_CONFIG_NO_CPP11)=0D
+-#define CLARA_CONFIG_CPP11_GENERATED_METHODS=0D
+-#endif=0D
+-#if defined(CLARA_INTERNAL_CONFIG_CPP11_OVERRIDE) && !defined(CLARA_CONFI=
G_NO_OVERRIDE) && !defined(CLARA_CONFIG_CPP11_OVERRIDE) && !defined(CLARA_C=
ONFIG_NO_CPP11)=0D
+-#define CLARA_CONFIG_CPP11_OVERRIDE=0D
+-#endif=0D
+-#if defined(CLARA_INTERNAL_CONFIG_CPP11_UNIQUE_PTR) && !defined(CLARA_CON=
FIG_NO_UNIQUE_PTR) && !defined(CLARA_CONFIG_CPP11_UNIQUE_PTR) && !defined(C=
LARA_CONFIG_NO_CPP11)=0D
+-#define CLARA_CONFIG_CPP11_UNIQUE_PTR=0D
+-#endif=0D
+-=0D
+-// noexcept support:=0D
+-#if defined(CLARA_CONFIG_CPP11_NOEXCEPT) && !defined(CLARA_NOEXCEPT)=0D
+-#define CLARA_NOEXCEPT noexcept=0D
+-#  define CLARA_NOEXCEPT_IS(x) noexcept(x)=0D
+-#else=0D
+-#define CLARA_NOEXCEPT throw()=0D
+-#  define CLARA_NOEXCEPT_IS(x)=0D
+-#endif=0D
+-=0D
+-// nullptr support=0D
+-#ifdef CLARA_CONFIG_CPP11_NULLPTR=0D
+-#define CLARA_NULL nullptr=0D
+-#else=0D
+-#define CLARA_NULL NULL=0D
+-#endif=0D
+-=0D
+-// override support=0D
+-#ifdef CLARA_CONFIG_CPP11_OVERRIDE=0D
+-#define CLARA_OVERRIDE override=0D
+-#else=0D
+-#define CLARA_OVERRIDE=0D
+-#endif=0D
+-=0D
+-// unique_ptr support=0D
+-#ifdef CLARA_CONFIG_CPP11_UNIQUE_PTR=0D
+-#   define CLARA_AUTO_PTR( T ) std::unique_ptr<T>=0D
+-#else=0D
+-#   define CLARA_AUTO_PTR( T ) std::auto_ptr<T>=0D
+-#endif=0D
+-=0D
+-#endif // TWOBLUECUBES_CLARA_COMPILERS_H_INCLUDED=0D
+-=0D
+-// ----------- end of #include from clara_compilers.h -----------=0D
+-// ........... back in clara.h=0D
+-=0D
+-#include <map>=0D
+-#include <stdexcept>=0D
+-#include <memory>=0D
+-=0D
+-#if defined(WIN32) || defined(__WIN32__) || defined(_WIN32) || defined(_M=
SC_VER)=0D
+-#define CLARA_PLATFORM_WINDOWS=0D
+-#endif=0D
+-=0D
+-// Use optional outer namespace=0D
+-#ifdef STITCH_CLARA_OPEN_NAMESPACE=0D
+-STITCH_CLARA_OPEN_NAMESPACE=0D
+-#endif=0D
+-=0D
+-namespace Clara {=0D
+-=0D
+-    struct UnpositionalTag {};=0D
+-=0D
+-    extern UnpositionalTag _;=0D
+-=0D
+-#ifdef CLARA_CONFIG_MAIN=0D
+-    UnpositionalTag _;=0D
+-#endif=0D
+-=0D
+-    namespace Detail {=0D
+-=0D
+-#ifdef CLARA_CONSOLE_WIDTH=0D
+-    const unsigned int consoleWidth =3D CLARA_CONFIG_CONSOLE_WIDTH;=0D
+-#else=0D
+-    const unsigned int consoleWidth =3D 80;=0D
+-#endif=0D
+-=0D
+-        using namespace Tbc;=0D
+-=0D
+-        inline bool startsWith( std::string const& str, std::string const=
& prefix ) {=0D
+-            return str.size() >=3D prefix.size() && str.substr( 0, prefix=
.size() ) =3D=3D prefix;=0D
+-        }=0D
+-=0D
+-        template<typename T> struct RemoveConstRef{ typedef T type; };=0D
+-        template<typename T> struct RemoveConstRef<T&>{ typedef T type; }=
;=0D
+-        template<typename T> struct RemoveConstRef<T const&>{ typedef T t=
ype; };=0D
+-        template<typename T> struct RemoveConstRef<T const>{ typedef T ty=
pe; };=0D
+-=0D
+-        template<typename T>    struct IsBool       { static const bool v=
alue =3D false; };=0D
+-        template<>              struct IsBool<bool> { static const bool v=
alue =3D true; };=0D
+-=0D
+-        template<typename T>=0D
+-        void convertInto( std::string const& _source, T& _dest ) {=0D
+-            std::stringstream ss;=0D
+-            ss << _source;=0D
+-            ss >> _dest;=0D
+-            if( ss.fail() )=0D
+-                throw std::runtime_error( "Unable to convert " + _source =
+ " to destination type" );=0D
+-        }=0D
+-        inline void convertInto( std::string const& _source, std::string&=
 _dest ) {=0D
+-            _dest =3D _source;=0D
+-        }=0D
+-        char toLowerCh(char c) {=0D
+-            return static_cast<char>( ::tolower( c ) );=0D
+-        }=0D
+-        inline void convertInto( std::string const& _source, bool& _dest =
) {=0D
+-            std::string sourceLC =3D _source;=0D
+-            std::transform( sourceLC.begin(), sourceLC.end(), sourceLC.be=
gin(), toLowerCh );=0D
+-            if( sourceLC =3D=3D "y" || sourceLC =3D=3D "1" || sourceLC =
=3D=3D "true" || sourceLC =3D=3D "yes" || sourceLC =3D=3D "on" )=0D
+-                _dest =3D true;=0D
+-            else if( sourceLC =3D=3D "n" || sourceLC =3D=3D "0" || source=
LC =3D=3D "false" || sourceLC =3D=3D "no" || sourceLC =3D=3D "off" )=0D
+-                _dest =3D false;=0D
+-            else=0D
+-                throw std::runtime_error( "Expected a boolean value but d=
id not recognise:\n  '" + _source + "'" );=0D
+-        }=0D
+-=0D
+-        template<typename ConfigT>=0D
+-        struct IArgFunction {=0D
+-            virtual ~IArgFunction() {}=0D
+-#ifdef CLARA_CONFIG_CPP11_GENERATED_METHODS=0D
+-            IArgFunction()                      =3D default;=0D
+-            IArgFunction( IArgFunction const& ) =3D default;=0D
+-#endif=0D
+-            virtual void set( ConfigT& config, std::string const& value )=
 const =3D 0;=0D
+-            virtual bool takesArg() const =3D 0;=0D
+-            virtual IArgFunction* clone() const =3D 0;=0D
+-        };=0D
+-=0D
+-        template<typename ConfigT>=0D
+-        class BoundArgFunction {=0D
+-        public:=0D
+-            BoundArgFunction() : functionObj( CLARA_NULL ) {}=0D
+-            BoundArgFunction( IArgFunction<ConfigT>* _functionObj ) : fun=
ctionObj( _functionObj ) {}=0D
+-            BoundArgFunction( BoundArgFunction const& other ) : functionO=
bj( other.functionObj ? other.functionObj->clone() : CLARA_NULL ) {}=0D
+-            BoundArgFunction& operator =3D ( BoundArgFunction const& othe=
r ) {=0D
+-                IArgFunction<ConfigT>* newFunctionObj =3D other.functionO=
bj ? other.functionObj->clone() : CLARA_NULL;=0D
+-                delete functionObj;=0D
+-                functionObj =3D newFunctionObj;=0D
+-                return *this;=0D
+-            }=0D
+-            ~BoundArgFunction() { delete functionObj; }=0D
+-=0D
+-            void set( ConfigT& config, std::string const& value ) const {=
=0D
+-                functionObj->set( config, value );=0D
+-            }=0D
+-            bool takesArg() const { return functionObj->takesArg(); }=0D
+-=0D
+-            bool isSet() const {=0D
+-                return functionObj !=3D CLARA_NULL;=0D
+-            }=0D
+-        private:=0D
+-            IArgFunction<ConfigT>* functionObj;=0D
+-        };=0D
+-=0D
+-        template<typename C>=0D
+-        struct NullBinder : IArgFunction<C>{=0D
+-            virtual void set( C&, std::string const& ) const {}=0D
+-            virtual bool takesArg() const { return true; }=0D
+-            virtual IArgFunction<C>* clone() const { return new NullBinde=
r( *this ); }=0D
+-        };=0D
+-=0D
+-        template<typename C, typename M>=0D
+-        struct BoundDataMember : IArgFunction<C>{=0D
+-            BoundDataMember( M C::* _member ) : member( _member ) {}=0D
+-            virtual void set( C& p, std::string const& stringValue ) cons=
t {=0D
+-                convertInto( stringValue, p.*member );=0D
+-            }=0D
+-            virtual bool takesArg() const { return !IsBool<M>::value; }=0D
+-            virtual IArgFunction<C>* clone() const { return new BoundData=
Member( *this ); }=0D
+-            M C::* member;=0D
+-        };=0D
+-        template<typename C, typename M>=0D
+-        struct BoundUnaryMethod : IArgFunction<C>{=0D
+-            BoundUnaryMethod( void (C::*_member)( M ) ) : member( _member=
 ) {}=0D
+-            virtual void set( C& p, std::string const& stringValue ) cons=
t {=0D
+-                typename RemoveConstRef<M>::type value;=0D
+-                convertInto( stringValue, value );=0D
+-                (p.*member)( value );=0D
+-            }=0D
+-            virtual bool takesArg() const { return !IsBool<M>::value; }=0D
+-            virtual IArgFunction<C>* clone() const { return new BoundUnar=
yMethod( *this ); }=0D
+-            void (C::*member)( M );=0D
+-        };=0D
+-        template<typename C>=0D
+-        struct BoundNullaryMethod : IArgFunction<C>{=0D
+-            BoundNullaryMethod( void (C::*_member)() ) : member( _member =
) {}=0D
+-            virtual void set( C& p, std::string const& stringValue ) cons=
t {=0D
+-                bool value;=0D
+-                convertInto( stringValue, value );=0D
+-                if( value )=0D
+-                    (p.*member)();=0D
+-            }=0D
+-            virtual bool takesArg() const { return false; }=0D
+-            virtual IArgFunction<C>* clone() const { return new BoundNull=
aryMethod( *this ); }=0D
+-            void (C::*member)();=0D
+-        };=0D
+-=0D
+-        template<typename C>=0D
+-        struct BoundUnaryFunction : IArgFunction<C>{=0D
+-            BoundUnaryFunction( void (*_function)( C& ) ) : function( _fu=
nction ) {}=0D
+-            virtual void set( C& obj, std::string const& stringValue ) co=
nst {=0D
+-                bool value;=0D
+-                convertInto( stringValue, value );=0D
+-                if( value )=0D
+-                    function( obj );=0D
+-            }=0D
+-            virtual bool takesArg() const { return false; }=0D
+-            virtual IArgFunction<C>* clone() const { return new BoundUnar=
yFunction( *this ); }=0D
+-            void (*function)( C& );=0D
+-        };=0D
+-=0D
+-        template<typename C, typename T>=0D
+-        struct BoundBinaryFunction : IArgFunction<C>{=0D
+-            BoundBinaryFunction( void (*_function)( C&, T ) ) : function(=
 _function ) {}=0D
+-            virtual void set( C& obj, std::string const& stringValue ) co=
nst {=0D
+-                typename RemoveConstRef<T>::type value;=0D
+-                convertInto( stringValue, value );=0D
+-                function( obj, value );=0D
+-            }=0D
+-            virtual bool takesArg() const { return !IsBool<T>::value; }=0D
+-            virtual IArgFunction<C>* clone() const { return new BoundBina=
ryFunction( *this ); }=0D
+-            void (*function)( C&, T );=0D
+-        };=0D
+-=0D
+-    } // namespace Detail=0D
+-=0D
+-    inline std::vector<std::string> argsToVector( int argc, char const* c=
onst* const argv ) {=0D
+-        std::vector<std::string> args( static_cast<std::size_t>( argc ) )=
;=0D
+-        for( std::size_t i =3D 0; i < static_cast<std::size_t>( argc ); +=
+i )=0D
+-            args[i] =3D argv[i];=0D
+-=0D
+-        return args;=0D
+-    }=0D
+-=0D
+-    class Parser {=0D
+-        enum Mode { None, MaybeShortOpt, SlashOpt, ShortOpt, LongOpt, Pos=
itional };=0D
+-        Mode mode;=0D
+-        std::size_t from;=0D
+-        bool inQuotes;=0D
+-    public:=0D
+-=0D
+-        struct Token {=0D
+-            enum Type { Positional, ShortOpt, LongOpt };=0D
+-            Token( Type _type, std::string const& _data ) : type( _type )=
, data( _data ) {}=0D
+-            Type type;=0D
+-            std::string data;=0D
+-        };=0D
+-=0D
+-        Parser() : mode( None ), from( 0 ), inQuotes( false ){}=0D
+-=0D
+-        void parseIntoTokens( std::vector<std::string> const& args, std::=
vector<Token>& tokens ) {=0D
+-            const std::string doubleDash =3D "--";=0D
+-            for( std::size_t i =3D 1; i < args.size() && args[i] !=3D dou=
bleDash; ++i )=0D
+-                parseIntoTokens( args[i], tokens);=0D
+-        }=0D
+-=0D
+-        void parseIntoTokens( std::string const& arg, std::vector<Token>&=
 tokens ) {=0D
+-            for( std::size_t i =3D 0; i <=3D arg.size(); ++i ) {=0D
+-                char c =3D arg[i];=0D
+-                if( c =3D=3D '"' )=0D
+-                    inQuotes =3D !inQuotes;=0D
+-                mode =3D handleMode( i, c, arg, tokens );=0D
+-            }=0D
+-        }=0D
+-        Mode handleMode( std::size_t i, char c, std::string const& arg, s=
td::vector<Token>& tokens ) {=0D
+-            switch( mode ) {=0D
+-                case None: return handleNone( i, c );=0D
+-                case MaybeShortOpt: return handleMaybeShortOpt( i, c );=0D
+-                case ShortOpt:=0D
+-                case LongOpt:=0D
+-                case SlashOpt: return handleOpt( i, c, arg, tokens );=0D
+-                case Positional: return handlePositional( i, c, arg, toke=
ns );=0D
+-                default: throw std::logic_error( "Unknown mode" );=0D
+-            }=0D
+-        }=0D
+-=0D
+-        Mode handleNone( std::size_t i, char c ) {=0D
+-            if( inQuotes ) {=0D
+-                from =3D i;=0D
+-                return Positional;=0D
+-            }=0D
+-            switch( c ) {=0D
+-                case '-': return MaybeShortOpt;=0D
+-#ifdef CLARA_PLATFORM_WINDOWS=0D
+-                case '/': from =3D i+1; return SlashOpt;=0D
+-#endif=0D
+-                default: from =3D i; return Positional;=0D
+-            }=0D
+-        }=0D
+-        Mode handleMaybeShortOpt( std::size_t i, char c ) {=0D
+-            switch( c ) {=0D
+-                case '-': from =3D i+1; return LongOpt;=0D
+-                default: from =3D i; return ShortOpt;=0D
+-            }=0D
+-        }=0D
+-        Mode handleOpt( std::size_t i, char c, std::string const& arg, st=
d::vector<Token>& tokens ) {=0D
+-            if( std::string( ":=3D\0", 3 ).find( c ) =3D=3D std::string::=
npos )=0D
+-                return mode;=0D
+-=0D
+-            std::string optName =3D arg.substr( from, i-from );=0D
+-            if( mode =3D=3D ShortOpt )=0D
+-                for( std::size_t j =3D 0; j < optName.size(); ++j )=0D
+-                    tokens.push_back( Token( Token::ShortOpt, optName.sub=
str( j, 1 ) ) );=0D
+-            else if( mode =3D=3D SlashOpt && optName.size() =3D=3D 1 )=0D
+-                tokens.push_back( Token( Token::ShortOpt, optName ) );=0D
+-            else=0D
+-                tokens.push_back( Token( Token::LongOpt, optName ) );=0D
+-            return None;=0D
+-        }=0D
+-        Mode handlePositional( std::size_t i, char c, std::string const& =
arg, std::vector<Token>& tokens ) {=0D
+-            if( inQuotes || std::string( "\0", 1 ).find( c ) =3D=3D std::=
string::npos )=0D
+-                return mode;=0D
+-=0D
+-            std::string data =3D arg.substr( from, i-from );=0D
+-            tokens.push_back( Token( Token::Positional, data ) );=0D
+-            return None;=0D
+-        }=0D
+-    };=0D
+-=0D
+-    template<typename ConfigT>=0D
+-    struct CommonArgProperties {=0D
+-        CommonArgProperties() {}=0D
+-        CommonArgProperties( Detail::BoundArgFunction<ConfigT> const& _bo=
undField ) : boundField( _boundField ) {}=0D
+-=0D
+-        Detail::BoundArgFunction<ConfigT> boundField;=0D
+-        std::string description;=0D
+-        std::string detail;=0D
+-        std::string placeholder; // Only value if boundField takes an arg=
=0D
+-=0D
+-        bool takesArg() const {=0D
+-            return !placeholder.empty();=0D
+-        }=0D
+-        void validate() const {=0D
+-            if( !boundField.isSet() )=0D
+-                throw std::logic_error( "option not bound" );=0D
+-        }=0D
+-    };=0D
+-    struct OptionArgProperties {=0D
+-        std::vector<std::string> shortNames;=0D
+-        std::string longName;=0D
+-=0D
+-        bool hasShortName( std::string const& shortName ) const {=0D
+-            return std::find( shortNames.begin(), shortNames.end(), short=
Name ) !=3D shortNames.end();=0D
+-        }=0D
+-        bool hasLongName( std::string const& _longName ) const {=0D
+-            return _longName =3D=3D longName;=0D
+-        }=0D
+-    };=0D
+-    struct PositionalArgProperties {=0D
+-        PositionalArgProperties() : position( -1 ) {}=0D
+-        int position; // -1 means non-positional (floating)=0D
+-=0D
+-        bool isFixedPositional() const {=0D
+-            return position !=3D -1;=0D
+-        }=0D
+-    };=0D
+-=0D
+-    template<typename ConfigT>=0D
+-    class CommandLine {=0D
+-=0D
+-        struct Arg : CommonArgProperties<ConfigT>, OptionArgProperties, P=
ositionalArgProperties {=0D
+-            Arg() {}=0D
+-            Arg( Detail::BoundArgFunction<ConfigT> const& _boundField ) :=
 CommonArgProperties<ConfigT>( _boundField ) {}=0D
+-=0D
+-            using CommonArgProperties<ConfigT>::placeholder; // !TBD=0D
+-=0D
+-            std::string dbgName() const {=0D
+-                if( !longName.empty() )=0D
+-                    return "--" + longName;=0D
+-                if( !shortNames.empty() )=0D
+-                    return "-" + shortNames[0];=0D
+-                return "positional args";=0D
+-            }=0D
+-            std::string commands() const {=0D
+-                std::ostringstream oss;=0D
+-                bool first =3D true;=0D
+-                std::vector<std::string>::const_iterator it =3D shortName=
s.begin(), itEnd =3D shortNames.end();=0D
+-                for(; it !=3D itEnd; ++it ) {=0D
+-                    if( first )=0D
+-                        first =3D false;=0D
+-                    else=0D
+-                        oss << ", ";=0D
+-                    oss << "-" << *it;=0D
+-                }=0D
+-                if( !longName.empty() ) {=0D
+-                    if( !first )=0D
+-                        oss << ", ";=0D
+-                    oss << "--" << longName;=0D
+-                }=0D
+-                if( !placeholder.empty() )=0D
+-                    oss << " <" << placeholder << ">";=0D
+-                return oss.str();=0D
+-            }=0D
+-        };=0D
+-=0D
+-        typedef CLARA_AUTO_PTR( Arg ) ArgAutoPtr;=0D
+-=0D
+-        friend void addOptName( Arg& arg, std::string const& optName )=0D
+-        {=0D
+-            if( optName.empty() )=0D
+-                return;=0D
+-            if( Detail::startsWith( optName, "--" ) ) {=0D
+-                if( !arg.longName.empty() )=0D
+-                    throw std::logic_error( "Only one long opt may be spe=
cified. '"=0D
+-                        + arg.longName=0D
+-                        + "' already specified, now attempting to add '"=
=0D
+-                        + optName + "'" );=0D
+-                arg.longName =3D optName.substr( 2 );=0D
+-            }=0D
+-            else if( Detail::startsWith( optName, "-" ) )=0D
+-                arg.shortNames.push_back( optName.substr( 1 ) );=0D
+-            else=0D
+-                throw std::logic_error( "option must begin with - or --. =
Option was: '" + optName + "'" );=0D
+-        }=0D
+-        friend void setPositionalArg( Arg& arg, int position )=0D
+-        {=0D
+-            arg.position =3D position;=0D
+-        }=0D
+-=0D
+-        class ArgBuilder {=0D
+-        public:=0D
+-            ArgBuilder( Arg* arg ) : m_arg( arg ) {}=0D
+-=0D
+-            // Bind a non-boolean data member (requires placeholder strin=
g)=0D
+-            template<typename C, typename M>=0D
+-            void bind( M C::* field, std::string const& placeholder ) {=0D
+-                m_arg->boundField =3D new Detail::BoundDataMember<C,M>( f=
ield );=0D
+-                m_arg->placeholder =3D placeholder;=0D
+-            }=0D
+-            // Bind a boolean data member (no placeholder required)=0D
+-            template<typename C>=0D
+-            void bind( bool C::* field ) {=0D
+-                m_arg->boundField =3D new Detail::BoundDataMember<C,bool>=
( field );=0D
+-            }=0D
+-=0D
+-            // Bind a method taking a single, non-boolean argument (requi=
res a placeholder string)=0D
+-            template<typename C, typename M>=0D
+-            void bind( void (C::* unaryMethod)( M ), std::string const& p=
laceholder ) {=0D
+-                m_arg->boundField =3D new Detail::BoundUnaryMethod<C,M>( =
unaryMethod );=0D
+-                m_arg->placeholder =3D placeholder;=0D
+-            }=0D
+-=0D
+-            // Bind a method taking a single, boolean argument (no placeh=
older string required)=0D
+-            template<typename C>=0D
+-            void bind( void (C::* unaryMethod)( bool ) ) {=0D
+-                m_arg->boundField =3D new Detail::BoundUnaryMethod<C,bool=
>( unaryMethod );=0D
+-            }=0D
+-=0D
+-            // Bind a method that takes no arguments (will be called if o=
pt is present)=0D
+-            template<typename C>=0D
+-            void bind( void (C::* nullaryMethod)() ) {=0D
+-                m_arg->boundField =3D new Detail::BoundNullaryMethod<C>( =
nullaryMethod );=0D
+-            }=0D
+-=0D
+-            // Bind a free function taking a single argument - the object=
 to operate on (no placeholder string required)=0D
+-            template<typename C>=0D
+-            void bind( void (* unaryFunction)( C& ) ) {=0D
+-                m_arg->boundField =3D new Detail::BoundUnaryFunction<C>( =
unaryFunction );=0D
+-            }=0D
+-=0D
+-            // Bind a free function taking a single argument - the object=
 to operate on (requires a placeholder string)=0D
+-            template<typename C, typename T>=0D
+-            void bind( void (* binaryFunction)( C&, T ), std::string cons=
t& placeholder ) {=0D
+-                m_arg->boundField =3D new Detail::BoundBinaryFunction<C, =
T>( binaryFunction );=0D
+-                m_arg->placeholder =3D placeholder;=0D
+-            }=0D
+-=0D
+-            ArgBuilder& describe( std::string const& description ) {=0D
+-                m_arg->description =3D description;=0D
+-                return *this;=0D
+-            }=0D
+-            ArgBuilder& detail( std::string const& detail ) {=0D
+-                m_arg->detail =3D detail;=0D
+-                return *this;=0D
+-            }=0D
+-=0D
+-        protected:=0D
+-            Arg* m_arg;=0D
+-        };=0D
+-=0D
+-        class OptBuilder : public ArgBuilder {=0D
+-        public:=0D
+-            OptBuilder( Arg* arg ) : ArgBuilder( arg ) {}=0D
+-            OptBuilder( OptBuilder& other ) : ArgBuilder( other ) {}=0D
+-=0D
+-            OptBuilder& operator[]( std::string const& optName ) {=0D
+-                addOptName( *ArgBuilder::m_arg, optName );=0D
+-                return *this;=0D
+-            }=0D
+-        };=0D
+-=0D
+-    public:=0D
+-=0D
+-        CommandLine()=0D
+-        :   m_boundProcessName( new Detail::NullBinder<ConfigT>() ),=0D
+-            m_highestSpecifiedArgPosition( 0 ),=0D
+-            m_throwOnUnrecognisedTokens( false )=0D
+-        {}=0D
+-        CommandLine( CommandLine const& other )=0D
+-        :   m_boundProcessName( other.m_boundProcessName ),=0D
+-            m_options ( other.m_options ),=0D
+-            m_positionalArgs( other.m_positionalArgs ),=0D
+-            m_highestSpecifiedArgPosition( other.m_highestSpecifiedArgPos=
ition ),=0D
+-            m_throwOnUnrecognisedTokens( other.m_throwOnUnrecognisedToken=
s )=0D
+-        {=0D
+-            if( other.m_floatingArg.get() )=0D
+-                m_floatingArg.reset( new Arg( *other.m_floatingArg ) );=0D
+-        }=0D
+-=0D
+-        CommandLine& setThrowOnUnrecognisedTokens( bool shouldThrow =3D t=
rue ) {=0D
+-            m_throwOnUnrecognisedTokens =3D shouldThrow;=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        OptBuilder operator[]( std::string const& optName ) {=0D
+-            m_options.push_back( Arg() );=0D
+-            addOptName( m_options.back(), optName );=0D
+-            OptBuilder builder( &m_options.back() );=0D
+-            return builder;=0D
+-        }=0D
+-=0D
+-        ArgBuilder operator[]( int position ) {=0D
+-            m_positionalArgs.insert( std::make_pair( position, Arg() ) );=
=0D
+-            if( position > m_highestSpecifiedArgPosition )=0D
+-                m_highestSpecifiedArgPosition =3D position;=0D
+-            setPositionalArg( m_positionalArgs[position], position );=0D
+-            ArgBuilder builder( &m_positionalArgs[position] );=0D
+-            return builder;=0D
+-        }=0D
+-=0D
+-        // Invoke this with the _ instance=0D
+-        ArgBuilder operator[]( UnpositionalTag ) {=0D
+-            if( m_floatingArg.get() )=0D
+-                throw std::logic_error( "Only one unpositional argument c=
an be added" );=0D
+-            m_floatingArg.reset( new Arg() );=0D
+-            ArgBuilder builder( m_floatingArg.get() );=0D
+-            return builder;=0D
+-        }=0D
+-=0D
+-        template<typename C, typename M>=0D
+-        void bindProcessName( M C::* field ) {=0D
+-            m_boundProcessName =3D new Detail::BoundDataMember<C,M>( fiel=
d );=0D
+-        }=0D
+-        template<typename C, typename M>=0D
+-        void bindProcessName( void (C::*_unaryMethod)( M ) ) {=0D
+-            m_boundProcessName =3D new Detail::BoundUnaryMethod<C,M>( _un=
aryMethod );=0D
+-        }=0D
+-=0D
+-        void optUsage( std::ostream& os, std::size_t indent =3D 0, std::s=
ize_t width =3D Detail::consoleWidth ) const {=0D
+-            typename std::vector<Arg>::const_iterator itBegin =3D m_optio=
ns.begin(), itEnd =3D m_options.end(), it;=0D
+-            std::size_t maxWidth =3D 0;=0D
+-            for( it =3D itBegin; it !=3D itEnd; ++it )=0D
+-                maxWidth =3D (std::max)( maxWidth, it->commands().size() =
);=0D
+-=0D
+-            for( it =3D itBegin; it !=3D itEnd; ++it ) {=0D
+-                Detail::Text usage( it->commands(), Detail::TextAttribute=
s()=0D
+-                                                        .setWidth( maxWid=
th+indent )=0D
+-                                                        .setIndent( inden=
t ) );=0D
+-                Detail::Text desc( it->description, Detail::TextAttribute=
s()=0D
+-                                                        .setWidth( width =
- maxWidth - 3 ) );=0D
+-=0D
+-                for( std::size_t i =3D 0; i < (std::max)( usage.size(), d=
esc.size() ); ++i ) {=0D
+-                    std::string usageCol =3D i < usage.size() ? usage[i] =
: "";=0D
+-                    os << usageCol;=0D
+-=0D
+-                    if( i < desc.size() && !desc[i].empty() )=0D
+-                        os  << std::string( indent + 2 + maxWidth - usage=
Col.size(), ' ' )=0D
+-                            << desc[i];=0D
+-                    os << "\n";=0D
+-                }=0D
+-            }=0D
+-        }=0D
+-        std::string optUsage() const {=0D
+-            std::ostringstream oss;=0D
+-            optUsage( oss );=0D
+-            return oss.str();=0D
+-        }=0D
+-=0D
+-        void argSynopsis( std::ostream& os ) const {=0D
+-            for( int i =3D 1; i <=3D m_highestSpecifiedArgPosition; ++i )=
 {=0D
+-                if( i > 1 )=0D
+-                    os << " ";=0D
+-                typename std::map<int, Arg>::const_iterator it =3D m_posi=
tionalArgs.find( i );=0D
+-                if( it !=3D m_positionalArgs.end() )=0D
+-                    os << "<" << it->second.placeholder << ">";=0D
+-                else if( m_floatingArg.get() )=0D
+-                    os << "<" << m_floatingArg->placeholder << ">";=0D
+-                else=0D
+-                    throw std::logic_error( "non consecutive positional a=
rguments with no floating args" );=0D
+-            }=0D
+-            // !TBD No indication of mandatory args=0D
+-            if( m_floatingArg.get() ) {=0D
+-                if( m_highestSpecifiedArgPosition > 1 )=0D
+-                    os << " ";=0D
+-                os << "[<" << m_floatingArg->placeholder << "> ...]";=0D
+-            }=0D
+-        }=0D
+-        std::string argSynopsis() const {=0D
+-            std::ostringstream oss;=0D
+-            argSynopsis( oss );=0D
+-            return oss.str();=0D
+-        }=0D
+-=0D
+-        void usage( std::ostream& os, std::string const& procName ) const=
 {=0D
+-            validate();=0D
+-            os << "usage:\n  " << procName << " ";=0D
+-            argSynopsis( os );=0D
+-            if( !m_options.empty() ) {=0D
+-                os << " [options]\n\nwhere options are: \n";=0D
+-                optUsage( os, 2 );=0D
+-            }=0D
+-            os << "\n";=0D
+-        }=0D
+-        std::string usage( std::string const& procName ) const {=0D
+-            std::ostringstream oss;=0D
+-            usage( oss, procName );=0D
+-            return oss.str();=0D
+-        }=0D
+-=0D
+-        ConfigT parse( std::vector<std::string> const& args ) const {=0D
+-            ConfigT config;=0D
+-            parseInto( args, config );=0D
+-            return config;=0D
+-        }=0D
+-=0D
+-        std::vector<Parser::Token> parseInto( std::vector<std::string> co=
nst& args, ConfigT& config ) const {=0D
+-            std::string processName =3D args[0];=0D
+-            std::size_t lastSlash =3D processName.find_last_of( "/\\" );=
=0D
+-            if( lastSlash !=3D std::string::npos )=0D
+-                processName =3D processName.substr( lastSlash+1 );=0D
+-            m_boundProcessName.set( config, processName );=0D
+-            std::vector<Parser::Token> tokens;=0D
+-            Parser parser;=0D
+-            parser.parseIntoTokens( args, tokens );=0D
+-            return populate( tokens, config );=0D
+-        }=0D
+-=0D
+-        std::vector<Parser::Token> populate( std::vector<Parser::Token> c=
onst& tokens, ConfigT& config ) const {=0D
+-            validate();=0D
+-            std::vector<Parser::Token> unusedTokens =3D populateOptions( =
tokens, config );=0D
+-            unusedTokens =3D populateFixedArgs( unusedTokens, config );=0D
+-            unusedTokens =3D populateFloatingArgs( unusedTokens, config )=
;=0D
+-            return unusedTokens;=0D
+-        }=0D
+-=0D
+-        std::vector<Parser::Token> populateOptions( std::vector<Parser::T=
oken> const& tokens, ConfigT& config ) const {=0D
+-            std::vector<Parser::Token> unusedTokens;=0D
+-            std::vector<std::string> errors;=0D
+-            for( std::size_t i =3D 0; i < tokens.size(); ++i ) {=0D
+-                Parser::Token const& token =3D tokens[i];=0D
+-                typename std::vector<Arg>::const_iterator it =3D m_option=
s.begin(), itEnd =3D m_options.end();=0D
+-                for(; it !=3D itEnd; ++it ) {=0D
+-                    Arg const& arg =3D *it;=0D
+-=0D
+-                    try {=0D
+-                        if( ( token.type =3D=3D Parser::Token::ShortOpt &=
& arg.hasShortName( token.data ) ) ||=0D
+-                            ( token.type =3D=3D Parser::Token::LongOpt &&=
 arg.hasLongName( token.data ) ) ) {=0D
+-                            if( arg.takesArg() ) {=0D
+-                                if( i =3D=3D tokens.size()-1 || tokens[i+=
1].type !=3D Parser::Token::Positional )=0D
+-                                    errors.push_back( "Expected argument =
to option: " + token.data );=0D
+-                                else=0D
+-                                    arg.boundField.set( config, tokens[++=
i].data );=0D
+-                            }=0D
+-                            else {=0D
+-                                arg.boundField.set( config, "true" );=0D
+-                            }=0D
+-                            break;=0D
+-                        }=0D
+-                    }=0D
+-                    catch( std::exception& ex ) {=0D
+-                        errors.push_back( std::string( ex.what() ) + "\n-=
 while parsing: (" + arg.commands() + ")" );=0D
+-                    }=0D
+-                }=0D
+-                if( it =3D=3D itEnd ) {=0D
+-                    if( token.type =3D=3D Parser::Token::Positional || !m=
_throwOnUnrecognisedTokens )=0D
+-                        unusedTokens.push_back( token );=0D
+-                    else if( errors.empty() && m_throwOnUnrecognisedToken=
s )=0D
+-                        errors.push_back( "unrecognised option: " + token=
.data );=0D
+-                }=0D
+-            }=0D
+-            if( !errors.empty() ) {=0D
+-                std::ostringstream oss;=0D
+-                for( std::vector<std::string>::const_iterator it =3D erro=
rs.begin(), itEnd =3D errors.end();=0D
+-                        it !=3D itEnd;=0D
+-                        ++it ) {=0D
+-                    if( it !=3D errors.begin() )=0D
+-                        oss << "\n";=0D
+-                    oss << *it;=0D
+-                }=0D
+-                throw std::runtime_error( oss.str() );=0D
+-            }=0D
+-            return unusedTokens;=0D
+-        }=0D
+-        std::vector<Parser::Token> populateFixedArgs( std::vector<Parser:=
:Token> const& tokens, ConfigT& config ) const {=0D
+-            std::vector<Parser::Token> unusedTokens;=0D
+-            int position =3D 1;=0D
+-            for( std::size_t i =3D 0; i < tokens.size(); ++i ) {=0D
+-                Parser::Token const& token =3D tokens[i];=0D
+-                typename std::map<int, Arg>::const_iterator it =3D m_posi=
tionalArgs.find( position );=0D
+-                if( it !=3D m_positionalArgs.end() )=0D
+-                    it->second.boundField.set( config, token.data );=0D
+-                else=0D
+-                    unusedTokens.push_back( token );=0D
+-                if( token.type =3D=3D Parser::Token::Positional )=0D
+-                    position++;=0D
+-            }=0D
+-            return unusedTokens;=0D
+-        }=0D
+-        std::vector<Parser::Token> populateFloatingArgs( std::vector<Pars=
er::Token> const& tokens, ConfigT& config ) const {=0D
+-            if( !m_floatingArg.get() )=0D
+-                return tokens;=0D
+-            std::vector<Parser::Token> unusedTokens;=0D
+-            for( std::size_t i =3D 0; i < tokens.size(); ++i ) {=0D
+-                Parser::Token const& token =3D tokens[i];=0D
+-                if( token.type =3D=3D Parser::Token::Positional )=0D
+-                    m_floatingArg->boundField.set( config, token.data );=
=0D
+-                else=0D
+-                    unusedTokens.push_back( token );=0D
+-            }=0D
+-            return unusedTokens;=0D
+-        }=0D
+-=0D
+-        void validate() const=0D
+-        {=0D
+-            if( m_options.empty() && m_positionalArgs.empty() && !m_float=
ingArg.get() )=0D
+-                throw std::logic_error( "No options or arguments specifie=
d" );=0D
+-=0D
+-            for( typename std::vector<Arg>::const_iterator  it =3D m_opti=
ons.begin(),=0D
+-                                                            itEnd =3D m_o=
ptions.end();=0D
+-                    it !=3D itEnd; ++it )=0D
+-                it->validate();=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        Detail::BoundArgFunction<ConfigT> m_boundProcessName;=0D
+-        std::vector<Arg> m_options;=0D
+-        std::map<int, Arg> m_positionalArgs;=0D
+-        ArgAutoPtr m_floatingArg;=0D
+-        int m_highestSpecifiedArgPosition;=0D
+-        bool m_throwOnUnrecognisedTokens;=0D
+-    };=0D
+-=0D
+-} // end namespace Clara=0D
+-=0D
+-STITCH_CLARA_CLOSE_NAMESPACE=0D
+-#undef STITCH_CLARA_OPEN_NAMESPACE=0D
+-#undef STITCH_CLARA_CLOSE_NAMESPACE=0D
+-=0D
+-#endif // TWOBLUECUBES_CLARA_H_INCLUDED=0D
+-#undef STITCH_CLARA_OPEN_NAMESPACE=0D
+-=0D
+-// Restore Clara's value for console width, if present=0D
+-#ifdef CATCH_TEMP_CLARA_CONFIG_CONSOLE_WIDTH=0D
+-#define CLARA_CONFIG_CONSOLE_WIDTH CATCH_TEMP_CLARA_CONFIG_CONSOLE_WIDTH=
=0D
+-#undef CATCH_TEMP_CLARA_CONFIG_CONSOLE_WIDTH=0D
+-#endif=0D
+-=0D
+-#include <fstream>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    inline void abortAfterFirst( ConfigData& config ) { config.abortAfter=
 =3D 1; }=0D
+-    inline void abortAfterX( ConfigData& config, int x ) {=0D
+-        if( x < 1 )=0D
+-            throw std::runtime_error( "Value after -x or --abortAfter mus=
t be greater than zero" );=0D
+-        config.abortAfter =3D x;=0D
+-    }=0D
+-    inline void addTestOrTags( ConfigData& config, std::string const& _te=
stSpec ) { config.testsOrTags.push_back( _testSpec ); }=0D
+-    inline void addReporterName( ConfigData& config, std::string const& _=
reporterName ) { config.reporterNames.push_back( _reporterName ); }=0D
+-=0D
+-    inline void addWarning( ConfigData& config, std::string const& _warni=
ng ) {=0D
+-        if( _warning =3D=3D "NoAssertions" )=0D
+-            config.warnings =3D static_cast<WarnAbout::What>( config.warn=
ings | WarnAbout::NoAssertions );=0D
+-        else=0D
+-            throw std::runtime_error( "Unrecognised warning: '" + _warnin=
g + "'" );=0D
+-    }=0D
+-    inline void setOrder( ConfigData& config, std::string const& order ) =
{=0D
+-        if( startsWith( "declared", order ) )=0D
+-            config.runOrder =3D RunTests::InDeclarationOrder;=0D
+-        else if( startsWith( "lexical", order ) )=0D
+-            config.runOrder =3D RunTests::InLexicographicalOrder;=0D
+-        else if( startsWith( "random", order ) )=0D
+-            config.runOrder =3D RunTests::InRandomOrder;=0D
+-        else=0D
+-            throw std::runtime_error( "Unrecognised ordering: '" + order =
+ "'" );=0D
+-    }=0D
+-    inline void setRngSeed( ConfigData& config, std::string const& seed )=
 {=0D
+-        if( seed =3D=3D "time" ) {=0D
+-            config.rngSeed =3D static_cast<unsigned int>( std::time(0) );=
=0D
+-        }=0D
+-        else {=0D
+-            std::stringstream ss;=0D
+-            ss << seed;=0D
+-            ss >> config.rngSeed;=0D
+-            if( ss.fail() )=0D
+-                throw std::runtime_error( "Argment to --rng-seed should b=
e the word 'time' or a number" );=0D
+-        }=0D
+-    }=0D
+-    inline void setVerbosity( ConfigData& config, int level ) {=0D
+-        // !TBD: accept strings?=0D
+-        config.verbosity =3D static_cast<Verbosity::Level>( level );=0D
+-    }=0D
+-    inline void setShowDurations( ConfigData& config, bool _showDurations=
 ) {=0D
+-        config.showDurations =3D _showDurations=0D
+-            ? ShowDurations::Always=0D
+-            : ShowDurations::Never;=0D
+-    }=0D
+-    inline void setUseColour( ConfigData& config, std::string const& valu=
e ) {=0D
+-        std::string mode =3D toLower( value );=0D
+-=0D
+-        if( mode =3D=3D "yes" )=0D
+-            config.useColour =3D UseColour::Yes;=0D
+-        else if( mode =3D=3D "no" )=0D
+-            config.useColour =3D UseColour::No;=0D
+-        else if( mode =3D=3D "auto" )=0D
+-            config.useColour =3D UseColour::Auto;=0D
+-        else=0D
+-            throw std::runtime_error( "colour mode must be one of: auto, =
yes or no" );=0D
+-    }=0D
+-    inline void forceColour( ConfigData& config ) {=0D
+-        config.useColour =3D UseColour::Yes;=0D
+-    }=0D
+-    inline void loadTestNamesFromFile( ConfigData& config, std::string co=
nst& _filename ) {=0D
+-        std::ifstream f( _filename.c_str() );=0D
+-        if( !f.is_open() )=0D
+-            throw std::domain_error( "Unable to load input file: " + _fil=
ename );=0D
+-=0D
+-        std::string line;=0D
+-        while( std::getline( f, line ) ) {=0D
+-            line =3D trim(line);=0D
+-            if( !line.empty() && !startsWith( line, "#" ) ) {=0D
+-                if( !startsWith( line, "\"" ) )=0D
+-                    line =3D "\"" + line + "\"";=0D
+-                addTestOrTags( config, line + "," );=0D
+-            }=0D
+-        }=0D
+-    }=0D
+-=0D
+-    inline Clara::CommandLine<ConfigData> makeCommandLineParser() {=0D
+-=0D
+-        using namespace Clara;=0D
+-        CommandLine<ConfigData> cli;=0D
+-=0D
+-        cli.bindProcessName( &ConfigData::processName );=0D
+-=0D
+-        cli["-?"]["-h"]["--help"]=0D
+-            .describe( "display usage information" )=0D
+-            .bind( &ConfigData::showHelp );=0D
+-=0D
+-        cli["-l"]["--list-tests"]=0D
+-            .describe( "list all/matching test cases" )=0D
+-            .bind( &ConfigData::listTests );=0D
+-=0D
+-        cli["-t"]["--list-tags"]=0D
+-            .describe( "list all/matching tags" )=0D
+-            .bind( &ConfigData::listTags );=0D
+-=0D
+-        cli["-s"]["--success"]=0D
+-            .describe( "include successful tests in output" )=0D
+-            .bind( &ConfigData::showSuccessfulTests );=0D
+-=0D
+-        cli["-b"]["--break"]=0D
+-            .describe( "break into debugger on failure" )=0D
+-            .bind( &ConfigData::shouldDebugBreak );=0D
+-=0D
+-        cli["-e"]["--nothrow"]=0D
+-            .describe( "skip exception tests" )=0D
+-            .bind( &ConfigData::noThrow );=0D
+-=0D
+-        cli["-i"]["--invisibles"]=0D
+-            .describe( "show invisibles (tabs, newlines)" )=0D
+-            .bind( &ConfigData::showInvisibles );=0D
+-=0D
+-        cli["-o"]["--out"]=0D
+-            .describe( "output filename" )=0D
+-            .bind( &ConfigData::outputFilename, "filename" );=0D
+-=0D
+-        cli["-r"]["--reporter"]=0D
+-//            .placeholder( "name[:filename]" )=0D
+-            .describe( "reporter to use (defaults to console)" )=0D
+-            .bind( &addReporterName, "name" );=0D
+-=0D
+-        cli["-n"]["--name"]=0D
+-            .describe( "suite name" )=0D
+-            .bind( &ConfigData::name, "name" );=0D
+-=0D
+-        cli["-a"]["--abort"]=0D
+-            .describe( "abort at first failure" )=0D
+-            .bind( &abortAfterFirst );=0D
+-=0D
+-        cli["-x"]["--abortx"]=0D
+-            .describe( "abort after x failures" )=0D
+-            .bind( &abortAfterX, "no. failures" );=0D
+-=0D
+-        cli["-w"]["--warn"]=0D
+-            .describe( "enable warnings" )=0D
+-            .bind( &addWarning, "warning name" );=0D
+-=0D
+-// - needs updating if reinstated=0D
+-//        cli.into( &setVerbosity )=0D
+-//            .describe( "level of verbosity (0=3Dno output)" )=0D
+-//            .shortOpt( "v")=0D
+-//            .longOpt( "verbosity" )=0D
+-//            .placeholder( "level" );=0D
+-=0D
+-        cli[_]=0D
+-            .describe( "which test or tests to use" )=0D
+-            .bind( &addTestOrTags, "test name, pattern or tags" );=0D
+-=0D
+-        cli["-d"]["--durations"]=0D
+-            .describe( "show test durations" )=0D
+-            .bind( &setShowDurations, "yes|no" );=0D
+-=0D
+-        cli["-f"]["--input-file"]=0D
+-            .describe( "load test names to run from a file" )=0D
+-            .bind( &loadTestNamesFromFile, "filename" );=0D
+-=0D
+-        cli["-#"]["--filenames-as-tags"]=0D
+-            .describe( "adds a tag for the filename" )=0D
+-            .bind( &ConfigData::filenamesAsTags );=0D
+-=0D
+-        // Less common commands which don't have a short form=0D
+-        cli["--list-test-names-only"]=0D
+-            .describe( "list all/matching test cases names only" )=0D
+-            .bind( &ConfigData::listTestNamesOnly );=0D
+-=0D
+-        cli["--list-reporters"]=0D
+-            .describe( "list all reporters" )=0D
+-            .bind( &ConfigData::listReporters );=0D
+-=0D
+-        cli["--order"]=0D
+-            .describe( "test case order (defaults to decl)" )=0D
+-            .bind( &setOrder, "decl|lex|rand" );=0D
+-=0D
+-        cli["--rng-seed"]=0D
+-            .describe( "set a specific seed for random numbers" )=0D
+-            .bind( &setRngSeed, "'time'|number" );=0D
+-=0D
+-        cli["--force-colour"]=0D
+-            .describe( "force colourised output (deprecated)" )=0D
+-            .bind( &forceColour );=0D
+-=0D
+-        cli["--use-colour"]=0D
+-            .describe( "should output be colourised" )=0D
+-            .bind( &setUseColour, "yes|no" );=0D
+-=0D
+-        return cli;=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: internal/catch_list.hpp=0D
+-#define TWOBLUECUBES_CATCH_LIST_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_text.h=0D
+-#define TWOBLUECUBES_CATCH_TEXT_H_INCLUDED=0D
+-=0D
+-#define TBC_TEXT_FORMAT_CONSOLE_WIDTH CATCH_CONFIG_CONSOLE_WIDTH=0D
+-=0D
+-#define CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE Catch=0D
+-// #included from: ../external/tbc_text_format.h=0D
+-// Only use header guard if we are not using an outer namespace=0D
+-#ifndef CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE=0D
+-# ifdef TWOBLUECUBES_TEXT_FORMAT_H_INCLUDED=0D
+-#  ifndef TWOBLUECUBES_TEXT_FORMAT_H_ALREADY_INCLUDED=0D
+-#   define TWOBLUECUBES_TEXT_FORMAT_H_ALREADY_INCLUDED=0D
+-#  endif=0D
+-# else=0D
+-#  define TWOBLUECUBES_TEXT_FORMAT_H_INCLUDED=0D
+-# endif=0D
+-#endif=0D
+-#ifndef TWOBLUECUBES_TEXT_FORMAT_H_ALREADY_INCLUDED=0D
+-#include <string>=0D
+-#include <vector>=0D
+-#include <sstream>=0D
+-=0D
+-// Use optional outer namespace=0D
+-#ifdef CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE=0D
+-namespace CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE {=0D
+-#endif=0D
+-=0D
+-namespace Tbc {=0D
+-=0D
+-#ifdef TBC_TEXT_FORMAT_CONSOLE_WIDTH=0D
+-    const unsigned int consoleWidth =3D TBC_TEXT_FORMAT_CONSOLE_WIDTH;=0D
+-#else=0D
+-    const unsigned int consoleWidth =3D 80;=0D
+-#endif=0D
+-=0D
+-    struct TextAttributes {=0D
+-        TextAttributes()=0D
+-        :   initialIndent( std::string::npos ),=0D
+-            indent( 0 ),=0D
+-            width( consoleWidth-1 ),=0D
+-            tabChar( '\t' )=0D
+-        {}=0D
+-=0D
+-        TextAttributes& setInitialIndent( std::size_t _value )  { initial=
Indent =3D _value; return *this; }=0D
+-        TextAttributes& setIndent( std::size_t _value )         { indent =
=3D _value; return *this; }=0D
+-        TextAttributes& setWidth( std::size_t _value )          { width =
=3D _value; return *this; }=0D
+-        TextAttributes& setTabChar( char _value )               { tabChar=
 =3D _value; return *this; }=0D
+-=0D
+-        std::size_t initialIndent;  // indent of first line, or npos=0D
+-        std::size_t indent;         // indent of subsequent lines, or all=
 if initialIndent is npos=0D
+-        std::size_t width;          // maximum width of text, including i=
ndent. Longer text will wrap=0D
+-        char tabChar;               // If this char is seen the indent is=
 changed to current pos=0D
+-    };=0D
+-=0D
+-    class Text {=0D
+-    public:=0D
+-        Text( std::string const& _str, TextAttributes const& _attr =3D Te=
xtAttributes() )=0D
+-        : attr( _attr )=0D
+-        {=0D
+-            std::string wrappableChars =3D " [({.,/|\\-";=0D
+-            std::size_t indent =3D _attr.initialIndent !=3D std::string::=
npos=0D
+-                ? _attr.initialIndent=0D
+-                : _attr.indent;=0D
+-            std::string remainder =3D _str;=0D
+-=0D
+-            while( !remainder.empty() ) {=0D
+-                if( lines.size() >=3D 1000 ) {=0D
+-                    lines.push_back( "... message truncated due to excess=
ive size" );=0D
+-                    return;=0D
+-                }=0D
+-                std::size_t tabPos =3D std::string::npos;=0D
+-                std::size_t width =3D (std::min)( remainder.size(), _attr=
.width - indent );=0D
+-                std::size_t pos =3D remainder.find_first_of( '\n' );=0D
+-                if( pos <=3D width ) {=0D
+-                    width =3D pos;=0D
+-                }=0D
+-                pos =3D remainder.find_last_of( _attr.tabChar, width );=0D
+-                if( pos !=3D std::string::npos ) {=0D
+-                    tabPos =3D pos;=0D
+-                    if( remainder[width] =3D=3D '\n' )=0D
+-                        width--;=0D
+-                    remainder =3D remainder.substr( 0, tabPos ) + remaind=
er.substr( tabPos+1 );=0D
+-                }=0D
+-=0D
+-                if( width =3D=3D remainder.size() ) {=0D
+-                    spliceLine( indent, remainder, width );=0D
+-                }=0D
+-                else if( remainder[width] =3D=3D '\n' ) {=0D
+-                    spliceLine( indent, remainder, width );=0D
+-                    if( width <=3D 1 || remainder.size() !=3D 1 )=0D
+-                        remainder =3D remainder.substr( 1 );=0D
+-                    indent =3D _attr.indent;=0D
+-                }=0D
+-                else {=0D
+-                    pos =3D remainder.find_last_of( wrappableChars, width=
 );=0D
+-                    if( pos !=3D std::string::npos && pos > 0 ) {=0D
+-                        spliceLine( indent, remainder, pos );=0D
+-                        if( remainder[0] =3D=3D ' ' )=0D
+-                            remainder =3D remainder.substr( 1 );=0D
+-                    }=0D
+-                    else {=0D
+-                        spliceLine( indent, remainder, width-1 );=0D
+-                        lines.back() +=3D "-";=0D
+-                    }=0D
+-                    if( lines.size() =3D=3D 1 )=0D
+-                        indent =3D _attr.indent;=0D
+-                    if( tabPos !=3D std::string::npos )=0D
+-                        indent +=3D tabPos;=0D
+-                }=0D
+-            }=0D
+-        }=0D
+-=0D
+-        void spliceLine( std::size_t _indent, std::string& _remainder, st=
d::size_t _pos ) {=0D
+-            lines.push_back( std::string( _indent, ' ' ) + _remainder.sub=
str( 0, _pos ) );=0D
+-            _remainder =3D _remainder.substr( _pos );=0D
+-        }=0D
+-=0D
+-        typedef std::vector<std::string>::const_iterator const_iterator;=
=0D
+-=0D
+-        const_iterator begin() const { return lines.begin(); }=0D
+-        const_iterator end() const { return lines.end(); }=0D
+-        std::string const& last() const { return lines.back(); }=0D
+-        std::size_t size() const { return lines.size(); }=0D
+-        std::string const& operator[]( std::size_t _index ) const { retur=
n lines[_index]; }=0D
+-        std::string toString() const {=0D
+-            std::ostringstream oss;=0D
+-            oss << *this;=0D
+-            return oss.str();=0D
+-        }=0D
+-=0D
+-        inline friend std::ostream& operator << ( std::ostream& _stream, =
Text const& _text ) {=0D
+-            for( Text::const_iterator it =3D _text.begin(), itEnd =3D _te=
xt.end();=0D
+-                it !=3D itEnd; ++it ) {=0D
+-                if( it !=3D _text.begin() )=0D
+-                    _stream << "\n";=0D
+-                _stream << *it;=0D
+-            }=0D
+-            return _stream;=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        std::string str;=0D
+-        TextAttributes attr;=0D
+-        std::vector<std::string> lines;=0D
+-    };=0D
+-=0D
+-} // end namespace Tbc=0D
+-=0D
+-#ifdef CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE=0D
+-} // end outer namespace=0D
+-#endif=0D
+-=0D
+-#endif // TWOBLUECUBES_TEXT_FORMAT_H_ALREADY_INCLUDED=0D
+-#undef CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE=0D
+-=0D
+-namespace Catch {=0D
+-    using Tbc::Text;=0D
+-    using Tbc::TextAttributes;=0D
+-}=0D
+-=0D
+-// #included from: catch_console_colour.hpp=0D
+-#define TWOBLUECUBES_CATCH_CONSOLE_COLOUR_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct Colour {=0D
+-        enum Code {=0D
+-            None =3D 0,=0D
+-=0D
+-            White,=0D
+-            Red,=0D
+-            Green,=0D
+-            Blue,=0D
+-            Cyan,=0D
+-            Yellow,=0D
+-            Grey,=0D
+-=0D
+-            Bright =3D 0x10,=0D
+-=0D
+-            BrightRed =3D Bright | Red,=0D
+-            BrightGreen =3D Bright | Green,=0D
+-            LightGrey =3D Bright | Grey,=0D
+-            BrightWhite =3D Bright | White,=0D
+-=0D
+-            // By intention=0D
+-            FileName =3D LightGrey,=0D
+-            Warning =3D Yellow,=0D
+-            ResultError =3D BrightRed,=0D
+-            ResultSuccess =3D BrightGreen,=0D
+-            ResultExpectedFailure =3D Warning,=0D
+-=0D
+-            Error =3D BrightRed,=0D
+-            Success =3D Green,=0D
+-=0D
+-            OriginalExpression =3D Cyan,=0D
+-            ReconstructedExpression =3D Yellow,=0D
+-=0D
+-            SecondaryText =3D LightGrey,=0D
+-            Headers =3D White=0D
+-        };=0D
+-=0D
+-        // Use constructed object for RAII guard=0D
+-        Colour( Code _colourCode );=0D
+-        Colour( Colour const& other );=0D
+-        ~Colour();=0D
+-=0D
+-        // Use static method for one-shot changes=0D
+-        static void use( Code _colourCode );=0D
+-=0D
+-    private:=0D
+-        bool m_moved;=0D
+-    };=0D
+-=0D
+-    inline std::ostream& operator << ( std::ostream& os, Colour const& ) =
{ return os; }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_interfaces_reporter.h=0D
+-#define TWOBLUECUBES_CATCH_INTERFACES_REPORTER_H_INCLUDED=0D
+-=0D
+-#include <string>=0D
+-#include <ostream>=0D
+-#include <map>=0D
+-#include <assert.h>=0D
+-=0D
+-namespace Catch=0D
+-{=0D
+-    struct ReporterConfig {=0D
+-        explicit ReporterConfig( Ptr<IConfig const> const& _fullConfig )=
=0D
+-        :   m_stream( &_fullConfig->stream() ), m_fullConfig( _fullConfig=
 ) {}=0D
+-=0D
+-        ReporterConfig( Ptr<IConfig const> const& _fullConfig, std::ostre=
am& _stream )=0D
+-        :   m_stream( &_stream ), m_fullConfig( _fullConfig ) {}=0D
+-=0D
+-        std::ostream& stream() const    { return *m_stream; }=0D
+-        Ptr<IConfig const> fullConfig() const { return m_fullConfig; }=0D
+-=0D
+-    private:=0D
+-        std::ostream* m_stream;=0D
+-        Ptr<IConfig const> m_fullConfig;=0D
+-    };=0D
+-=0D
+-    struct ReporterPreferences {=0D
+-        ReporterPreferences()=0D
+-        : shouldRedirectStdOut( false )=0D
+-        {}=0D
+-=0D
+-        bool shouldRedirectStdOut;=0D
+-    };=0D
+-=0D
+-    template<typename T>=0D
+-    struct LazyStat : Option<T> {=0D
+-        LazyStat() : used( false ) {}=0D
+-        LazyStat& operator=3D( T const& _value ) {=0D
+-            Option<T>::operator=3D( _value );=0D
+-            used =3D false;=0D
+-            return *this;=0D
+-        }=0D
+-        void reset() {=0D
+-            Option<T>::reset();=0D
+-            used =3D false;=0D
+-        }=0D
+-        bool used;=0D
+-    };=0D
+-=0D
+-    struct TestRunInfo {=0D
+-        TestRunInfo( std::string const& _name ) : name( _name ) {}=0D
+-        std::string name;=0D
+-    };=0D
+-    struct GroupInfo {=0D
+-        GroupInfo(  std::string const& _name,=0D
+-                    std::size_t _groupIndex,=0D
+-                    std::size_t _groupsCount )=0D
+-        :   name( _name ),=0D
+-            groupIndex( _groupIndex ),=0D
+-            groupsCounts( _groupsCount )=0D
+-        {}=0D
+-=0D
+-        std::string name;=0D
+-        std::size_t groupIndex;=0D
+-        std::size_t groupsCounts;=0D
+-    };=0D
+-=0D
+-    struct AssertionStats {=0D
+-        AssertionStats( AssertionResult const& _assertionResult,=0D
+-                        std::vector<MessageInfo> const& _infoMessages,=0D
+-                        Totals const& _totals )=0D
+-        :   assertionResult( _assertionResult ),=0D
+-            infoMessages( _infoMessages ),=0D
+-            totals( _totals )=0D
+-        {=0D
+-            if( assertionResult.hasMessage() ) {=0D
+-                // Copy message into messages list.=0D
+-                // !TBD This should have been done earlier, somewhere=0D
+-                MessageBuilder builder( assertionResult.getTestMacroName(=
), assertionResult.getSourceInfo(), assertionResult.getResultType() );=0D
+-                builder << assertionResult.getMessage();=0D
+-                builder.m_info.message =3D builder.m_stream.str();=0D
+-=0D
+-                infoMessages.push_back( builder.m_info );=0D
+-            }=0D
+-        }=0D
+-        virtual ~AssertionStats();=0D
+-=0D
+-#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-        AssertionStats( AssertionStats const& )              =3D default;=
=0D
+-        AssertionStats( AssertionStats && )                  =3D default;=
=0D
+-        AssertionStats& operator =3D ( AssertionStats const& ) =3D defaul=
t;=0D
+-        AssertionStats& operator =3D ( AssertionStats && )     =3D defaul=
t;=0D
+-#  endif=0D
+-=0D
+-        AssertionResult assertionResult;=0D
+-        std::vector<MessageInfo> infoMessages;=0D
+-        Totals totals;=0D
+-    };=0D
+-=0D
+-    struct SectionStats {=0D
+-        SectionStats(   SectionInfo const& _sectionInfo,=0D
+-                        Counts const& _assertions,=0D
+-                        double _durationInSeconds,=0D
+-                        bool _missingAssertions )=0D
+-        :   sectionInfo( _sectionInfo ),=0D
+-            assertions( _assertions ),=0D
+-            durationInSeconds( _durationInSeconds ),=0D
+-            missingAssertions( _missingAssertions )=0D
+-        {}=0D
+-        virtual ~SectionStats();=0D
+-#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-        SectionStats( SectionStats const& )              =3D default;=0D
+-        SectionStats( SectionStats && )                  =3D default;=0D
+-        SectionStats& operator =3D ( SectionStats const& ) =3D default;=0D
+-        SectionStats& operator =3D ( SectionStats && )     =3D default;=0D
+-#  endif=0D
+-=0D
+-        SectionInfo sectionInfo;=0D
+-        Counts assertions;=0D
+-        double durationInSeconds;=0D
+-        bool missingAssertions;=0D
+-    };=0D
+-=0D
+-    struct TestCaseStats {=0D
+-        TestCaseStats(  TestCaseInfo const& _testInfo,=0D
+-                        Totals const& _totals,=0D
+-                        std::string const& _stdOut,=0D
+-                        std::string const& _stdErr,=0D
+-                        bool _aborting )=0D
+-        : testInfo( _testInfo ),=0D
+-            totals( _totals ),=0D
+-            stdOut( _stdOut ),=0D
+-            stdErr( _stdErr ),=0D
+-            aborting( _aborting )=0D
+-        {}=0D
+-        virtual ~TestCaseStats();=0D
+-=0D
+-#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-        TestCaseStats( TestCaseStats const& )              =3D default;=0D
+-        TestCaseStats( TestCaseStats && )                  =3D default;=0D
+-        TestCaseStats& operator =3D ( TestCaseStats const& ) =3D default;=
=0D
+-        TestCaseStats& operator =3D ( TestCaseStats && )     =3D default;=
=0D
+-#  endif=0D
+-=0D
+-        TestCaseInfo testInfo;=0D
+-        Totals totals;=0D
+-        std::string stdOut;=0D
+-        std::string stdErr;=0D
+-        bool aborting;=0D
+-    };=0D
+-=0D
+-    struct TestGroupStats {=0D
+-        TestGroupStats( GroupInfo const& _groupInfo,=0D
+-                        Totals const& _totals,=0D
+-                        bool _aborting )=0D
+-        :   groupInfo( _groupInfo ),=0D
+-            totals( _totals ),=0D
+-            aborting( _aborting )=0D
+-        {}=0D
+-        TestGroupStats( GroupInfo const& _groupInfo )=0D
+-        :   groupInfo( _groupInfo ),=0D
+-            aborting( false )=0D
+-        {}=0D
+-        virtual ~TestGroupStats();=0D
+-=0D
+-#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-        TestGroupStats( TestGroupStats const& )              =3D default;=
=0D
+-        TestGroupStats( TestGroupStats && )                  =3D default;=
=0D
+-        TestGroupStats& operator =3D ( TestGroupStats const& ) =3D defaul=
t;=0D
+-        TestGroupStats& operator =3D ( TestGroupStats && )     =3D defaul=
t;=0D
+-#  endif=0D
+-=0D
+-        GroupInfo groupInfo;=0D
+-        Totals totals;=0D
+-        bool aborting;=0D
+-    };=0D
+-=0D
+-    struct TestRunStats {=0D
+-        TestRunStats(   TestRunInfo const& _runInfo,=0D
+-                        Totals const& _totals,=0D
+-                        bool _aborting )=0D
+-        :   runInfo( _runInfo ),=0D
+-            totals( _totals ),=0D
+-            aborting( _aborting )=0D
+-        {}=0D
+-        virtual ~TestRunStats();=0D
+-=0D
+-#  ifndef CATCH_CONFIG_CPP11_GENERATED_METHODS=0D
+-        TestRunStats( TestRunStats const& _other )=0D
+-        :   runInfo( _other.runInfo ),=0D
+-            totals( _other.totals ),=0D
+-            aborting( _other.aborting )=0D
+-        {}=0D
+-#  else=0D
+-        TestRunStats( TestRunStats const& )              =3D default;=0D
+-        TestRunStats( TestRunStats && )                  =3D default;=0D
+-        TestRunStats& operator =3D ( TestRunStats const& ) =3D default;=0D
+-        TestRunStats& operator =3D ( TestRunStats && )     =3D default;=0D
+-#  endif=0D
+-=0D
+-        TestRunInfo runInfo;=0D
+-        Totals totals;=0D
+-        bool aborting;=0D
+-    };=0D
+-=0D
+-    class MultipleReporters;=0D
+-=0D
+-    struct IStreamingReporter : IShared {=0D
+-        virtual ~IStreamingReporter();=0D
+-=0D
+-        // Implementing class must also provide the following static meth=
od:=0D
+-        // static std::string getDescription();=0D
+-=0D
+-        virtual ReporterPreferences getPreferences() const =3D 0;=0D
+-=0D
+-        virtual void noMatchingTestCases( std::string const& spec ) =3D 0=
;=0D
+-=0D
+-        virtual void testRunStarting( TestRunInfo const& testRunInfo ) =
=3D 0;=0D
+-        virtual void testGroupStarting( GroupInfo const& groupInfo ) =3D =
0;=0D
+-=0D
+-        virtual void testCaseStarting( TestCaseInfo const& testInfo ) =3D=
 0;=0D
+-        virtual void sectionStarting( SectionInfo const& sectionInfo ) =
=3D 0;=0D
+-=0D
+-        virtual void assertionStarting( AssertionInfo const& assertionInf=
o ) =3D 0;=0D
+-=0D
+-        // The return value indicates if the messages buffer should be cl=
eared:=0D
+-        virtual bool assertionEnded( AssertionStats const& assertionStats=
 ) =3D 0;=0D
+-=0D
+-        virtual void sectionEnded( SectionStats const& sectionStats ) =3D=
 0;=0D
+-        virtual void testCaseEnded( TestCaseStats const& testCaseStats ) =
=3D 0;=0D
+-        virtual void testGroupEnded( TestGroupStats const& testGroupStats=
 ) =3D 0;=0D
+-        virtual void testRunEnded( TestRunStats const& testRunStats ) =3D=
 0;=0D
+-=0D
+-        virtual void skipTest( TestCaseInfo const& testInfo ) =3D 0;=0D
+-=0D
+-        virtual MultipleReporters* tryAsMulti() { return CATCH_NULL; }=0D
+-    };=0D
+-=0D
+-    struct IReporterFactory : IShared {=0D
+-        virtual ~IReporterFactory();=0D
+-        virtual IStreamingReporter* create( ReporterConfig const& config =
) const =3D 0;=0D
+-        virtual std::string getDescription() const =3D 0;=0D
+-    };=0D
+-=0D
+-    struct IReporterRegistry {=0D
+-        typedef std::map<std::string, Ptr<IReporterFactory> > FactoryMap;=
=0D
+-        typedef std::vector<Ptr<IReporterFactory> > Listeners;=0D
+-=0D
+-        virtual ~IReporterRegistry();=0D
+-        virtual IStreamingReporter* create( std::string const& name, Ptr<=
IConfig const> const& config ) const =3D 0;=0D
+-        virtual FactoryMap const& getFactories() const =3D 0;=0D
+-        virtual Listeners const& getListeners() const =3D 0;=0D
+-    };=0D
+-=0D
+-    Ptr<IStreamingReporter> addReporter( Ptr<IStreamingReporter> const& e=
xistingReporter, Ptr<IStreamingReporter> const& additionalReporter );=0D
+-=0D
+-}=0D
+-=0D
+-#include <limits>=0D
+-#include <algorithm>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    inline std::size_t listTests( Config const& config ) {=0D
+-=0D
+-        TestSpec testSpec =3D config.testSpec();=0D
+-        if( config.testSpec().hasFilters() )=0D
+-            Catch::cout() << "Matching test cases:\n";=0D
+-        else {=0D
+-            Catch::cout() << "All available test cases:\n";=0D
+-            testSpec =3D TestSpecParser( ITagAliasRegistry::get() ).parse=
( "*" ).testSpec();=0D
+-        }=0D
+-=0D
+-        std::size_t matchedTests =3D 0;=0D
+-        TextAttributes nameAttr, tagsAttr;=0D
+-        nameAttr.setInitialIndent( 2 ).setIndent( 4 );=0D
+-        tagsAttr.setIndent( 6 );=0D
+-=0D
+-        std::vector<TestCase> matchedTestCases =3D filterTests( getAllTes=
tCasesSorted( config ), testSpec, config );=0D
+-        for( std::vector<TestCase>::const_iterator it =3D matchedTestCase=
s.begin(), itEnd =3D matchedTestCases.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it ) {=0D
+-            matchedTests++;=0D
+-            TestCaseInfo const& testCaseInfo =3D it->getTestCaseInfo();=0D
+-            Colour::Code colour =3D testCaseInfo.isHidden()=0D
+-                ? Colour::SecondaryText=0D
+-                : Colour::None;=0D
+-            Colour colourGuard( colour );=0D
+-=0D
+-            Catch::cout() << Text( testCaseInfo.name, nameAttr ) << std::=
endl;=0D
+-            if( !testCaseInfo.tags.empty() )=0D
+-                Catch::cout() << Text( testCaseInfo.tagsAsString, tagsAtt=
r ) << std::endl;=0D
+-        }=0D
+-=0D
+-        if( !config.testSpec().hasFilters() )=0D
+-            Catch::cout() << pluralise( matchedTests, "test case" ) << "\=
n" << std::endl;=0D
+-        else=0D
+-            Catch::cout() << pluralise( matchedTests, "matching test case=
" ) << "\n" << std::endl;=0D
+-        return matchedTests;=0D
+-    }=0D
+-=0D
+-    inline std::size_t listTestsNamesOnly( Config const& config ) {=0D
+-        TestSpec testSpec =3D config.testSpec();=0D
+-        if( !config.testSpec().hasFilters() )=0D
+-            testSpec =3D TestSpecParser( ITagAliasRegistry::get() ).parse=
( "*" ).testSpec();=0D
+-        std::size_t matchedTests =3D 0;=0D
+-        std::vector<TestCase> matchedTestCases =3D filterTests( getAllTes=
tCasesSorted( config ), testSpec, config );=0D
+-        for( std::vector<TestCase>::const_iterator it =3D matchedTestCase=
s.begin(), itEnd =3D matchedTestCases.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it ) {=0D
+-            matchedTests++;=0D
+-            TestCaseInfo const& testCaseInfo =3D it->getTestCaseInfo();=0D
+-            if( startsWith( testCaseInfo.name, "#" ) )=0D
+-               Catch::cout() << "\"" << testCaseInfo.name << "\"" << std:=
:endl;=0D
+-            else=0D
+-               Catch::cout() << testCaseInfo.name << std::endl;=0D
+-        }=0D
+-        return matchedTests;=0D
+-    }=0D
+-=0D
+-    struct TagInfo {=0D
+-        TagInfo() : count ( 0 ) {}=0D
+-        void add( std::string const& spelling ) {=0D
+-            ++count;=0D
+-            spellings.insert( spelling );=0D
+-        }=0D
+-        std::string all() const {=0D
+-            std::string out;=0D
+-            for( std::set<std::string>::const_iterator it =3D spellings.b=
egin(), itEnd =3D spellings.end();=0D
+-                        it !=3D itEnd;=0D
+-                        ++it )=0D
+-                out +=3D "[" + *it + "]";=0D
+-            return out;=0D
+-        }=0D
+-        std::set<std::string> spellings;=0D
+-        std::size_t count;=0D
+-    };=0D
+-=0D
+-    inline std::size_t listTags( Config const& config ) {=0D
+-        TestSpec testSpec =3D config.testSpec();=0D
+-        if( config.testSpec().hasFilters() )=0D
+-            Catch::cout() << "Tags for matching test cases:\n";=0D
+-        else {=0D
+-            Catch::cout() << "All available tags:\n";=0D
+-            testSpec =3D TestSpecParser( ITagAliasRegistry::get() ).parse=
( "*" ).testSpec();=0D
+-        }=0D
+-=0D
+-        std::map<std::string, TagInfo> tagCounts;=0D
+-=0D
+-        std::vector<TestCase> matchedTestCases =3D filterTests( getAllTes=
tCasesSorted( config ), testSpec, config );=0D
+-        for( std::vector<TestCase>::const_iterator it =3D matchedTestCase=
s.begin(), itEnd =3D matchedTestCases.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it ) {=0D
+-            for( std::set<std::string>::const_iterator  tagIt =3D it->get=
TestCaseInfo().tags.begin(),=0D
+-                                                        tagItEnd =3D it->=
getTestCaseInfo().tags.end();=0D
+-                    tagIt !=3D tagItEnd;=0D
+-                    ++tagIt ) {=0D
+-                std::string tagName =3D *tagIt;=0D
+-                std::string lcaseTagName =3D toLower( tagName );=0D
+-                std::map<std::string, TagInfo>::iterator countIt =3D tagC=
ounts.find( lcaseTagName );=0D
+-                if( countIt =3D=3D tagCounts.end() )=0D
+-                    countIt =3D tagCounts.insert( std::make_pair( lcaseTa=
gName, TagInfo() ) ).first;=0D
+-                countIt->second.add( tagName );=0D
+-            }=0D
+-        }=0D
+-=0D
+-        for( std::map<std::string, TagInfo>::const_iterator countIt =3D t=
agCounts.begin(),=0D
+-                                                            countItEnd =
=3D tagCounts.end();=0D
+-                countIt !=3D countItEnd;=0D
+-                ++countIt ) {=0D
+-            std::ostringstream oss;=0D
+-            oss << "  " << std::setw(2) << countIt->second.count << "  ";=
=0D
+-            Text wrapper( countIt->second.all(), TextAttributes()=0D
+-                                                    .setInitialIndent( 0 =
)=0D
+-                                                    .setIndent( oss.str()=
.size() )=0D
+-                                                    .setWidth( CATCH_CONF=
IG_CONSOLE_WIDTH-10 ) );=0D
+-            Catch::cout() << oss.str() << wrapper << "\n";=0D
+-        }=0D
+-        Catch::cout() << pluralise( tagCounts.size(), "tag" ) << "\n" << =
std::endl;=0D
+-        return tagCounts.size();=0D
+-    }=0D
+-=0D
+-    inline std::size_t listReporters( Config const& /*config*/ ) {=0D
+-        Catch::cout() << "Available reporters:\n";=0D
+-        IReporterRegistry::FactoryMap const& factories =3D getRegistryHub=
().getReporterRegistry().getFactories();=0D
+-        IReporterRegistry::FactoryMap::const_iterator itBegin =3D factori=
es.begin(), itEnd =3D factories.end(), it;=0D
+-        std::size_t maxNameLen =3D 0;=0D
+-        for(it =3D itBegin; it !=3D itEnd; ++it )=0D
+-            maxNameLen =3D (std::max)( maxNameLen, it->first.size() );=0D
+-=0D
+-        for(it =3D itBegin; it !=3D itEnd; ++it ) {=0D
+-            Text wrapper( it->second->getDescription(), TextAttributes()=
=0D
+-                                                        .setInitialIndent=
( 0 )=0D
+-                                                        .setIndent( 7+max=
NameLen )=0D
+-                                                        .setWidth( CATCH_=
CONFIG_CONSOLE_WIDTH - maxNameLen-8 ) );=0D
+-            Catch::cout() << "  "=0D
+-                    << it->first=0D
+-                    << ":"=0D
+-                    << std::string( maxNameLen - it->first.size() + 2, ' =
' )=0D
+-                    << wrapper << "\n";=0D
+-        }=0D
+-        Catch::cout() << std::endl;=0D
+-        return factories.size();=0D
+-    }=0D
+-=0D
+-    inline Option<std::size_t> list( Config const& config ) {=0D
+-        Option<std::size_t> listedCount;=0D
+-        if( config.listTests() )=0D
+-            listedCount =3D listedCount.valueOr(0) + listTests( config );=
=0D
+-        if( config.listTestNamesOnly() )=0D
+-            listedCount =3D listedCount.valueOr(0) + listTestsNamesOnly( =
config );=0D
+-        if( config.listTags() )=0D
+-            listedCount =3D listedCount.valueOr(0) + listTags( config );=
=0D
+-        if( config.listReporters() )=0D
+-            listedCount =3D listedCount.valueOr(0) + listReporters( confi=
g );=0D
+-        return listedCount;=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: internal/catch_run_context.hpp=0D
+-#define TWOBLUECUBES_CATCH_RUNNER_IMPL_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_test_case_tracker.hpp=0D
+-#define TWOBLUECUBES_CATCH_TEST_CASE_TRACKER_HPP_INCLUDED=0D
+-=0D
+-#include <map>=0D
+-#include <string>=0D
+-#include <assert.h>=0D
+-#include <vector>=0D
+-=0D
+-namespace Catch {=0D
+-namespace TestCaseTracking {=0D
+-=0D
+-    struct ITracker : SharedImpl<> {=0D
+-        virtual ~ITracker();=0D
+-=0D
+-        // static queries=0D
+-        virtual std::string name() const =3D 0;=0D
+-=0D
+-        // dynamic queries=0D
+-        virtual bool isComplete() const =3D 0; // Successfully completed =
or failed=0D
+-        virtual bool isSuccessfullyCompleted() const =3D 0;=0D
+-        virtual bool isOpen() const =3D 0; // Started but not complete=0D
+-        virtual bool hasChildren() const =3D 0;=0D
+-=0D
+-        virtual ITracker& parent() =3D 0;=0D
+-=0D
+-        // actions=0D
+-        virtual void close() =3D 0; // Successfully complete=0D
+-        virtual void fail() =3D 0;=0D
+-        virtual void markAsNeedingAnotherRun() =3D 0;=0D
+-=0D
+-        virtual void addChild( Ptr<ITracker> const& child ) =3D 0;=0D
+-        virtual ITracker* findChild( std::string const& name ) =3D 0;=0D
+-        virtual void openChild() =3D 0;=0D
+-=0D
+-        // Debug/ checking=0D
+-        virtual bool isSectionTracker() const =3D 0;=0D
+-        virtual bool isIndexTracker() const =3D 0;=0D
+-    };=0D
+-=0D
+-    class TrackerContext {=0D
+-=0D
+-        enum RunState {=0D
+-            NotStarted,=0D
+-            Executing,=0D
+-            CompletedCycle=0D
+-        };=0D
+-=0D
+-        Ptr<ITracker> m_rootTracker;=0D
+-        ITracker* m_currentTracker;=0D
+-        RunState m_runState;=0D
+-=0D
+-    public:=0D
+-=0D
+-        static TrackerContext& instance() {=0D
+-            static TrackerContext s_instance;=0D
+-            return s_instance;=0D
+-        }=0D
+-=0D
+-        TrackerContext()=0D
+-        :   m_currentTracker( CATCH_NULL ),=0D
+-            m_runState( NotStarted )=0D
+-        {}=0D
+-=0D
+-        ITracker& startRun();=0D
+-=0D
+-        void endRun() {=0D
+-            m_rootTracker.reset();=0D
+-            m_currentTracker =3D CATCH_NULL;=0D
+-            m_runState =3D NotStarted;=0D
+-        }=0D
+-=0D
+-        void startCycle() {=0D
+-            m_currentTracker =3D m_rootTracker.get();=0D
+-            m_runState =3D Executing;=0D
+-        }=0D
+-        void completeCycle() {=0D
+-            m_runState =3D CompletedCycle;=0D
+-        }=0D
+-=0D
+-        bool completedCycle() const {=0D
+-            return m_runState =3D=3D CompletedCycle;=0D
+-        }=0D
+-        ITracker& currentTracker() {=0D
+-            return *m_currentTracker;=0D
+-        }=0D
+-        void setCurrentTracker( ITracker* tracker ) {=0D
+-            m_currentTracker =3D tracker;=0D
+-        }=0D
+-    };=0D
+-=0D
+-    class TrackerBase : public ITracker {=0D
+-    protected:=0D
+-        enum CycleState {=0D
+-            NotStarted,=0D
+-            Executing,=0D
+-            ExecutingChildren,=0D
+-            NeedsAnotherRun,=0D
+-            CompletedSuccessfully,=0D
+-            Failed=0D
+-        };=0D
+-        class TrackerHasName {=0D
+-            std::string m_name;=0D
+-        public:=0D
+-            TrackerHasName( std::string const& name ) : m_name( name ) {}=
=0D
+-            bool operator ()( Ptr<ITracker> const& tracker ) {=0D
+-                return tracker->name() =3D=3D m_name;=0D
+-            }=0D
+-        };=0D
+-        typedef std::vector<Ptr<ITracker> > Children;=0D
+-        std::string m_name;=0D
+-        TrackerContext& m_ctx;=0D
+-        ITracker* m_parent;=0D
+-        Children m_children;=0D
+-        CycleState m_runState;=0D
+-    public:=0D
+-        TrackerBase( std::string const& name, TrackerContext& ctx, ITrack=
er* parent )=0D
+-        :   m_name( name ),=0D
+-            m_ctx( ctx ),=0D
+-            m_parent( parent ),=0D
+-            m_runState( NotStarted )=0D
+-        {}=0D
+-        virtual ~TrackerBase();=0D
+-=0D
+-        virtual std::string name() const CATCH_OVERRIDE {=0D
+-            return m_name;=0D
+-        }=0D
+-        virtual bool isComplete() const CATCH_OVERRIDE {=0D
+-            return m_runState =3D=3D CompletedSuccessfully || m_runState =
=3D=3D Failed;=0D
+-        }=0D
+-        virtual bool isSuccessfullyCompleted() const CATCH_OVERRIDE {=0D
+-            return m_runState =3D=3D CompletedSuccessfully;=0D
+-        }=0D
+-        virtual bool isOpen() const CATCH_OVERRIDE {=0D
+-            return m_runState !=3D NotStarted && !isComplete();=0D
+-        }=0D
+-        virtual bool hasChildren() const CATCH_OVERRIDE {=0D
+-            return !m_children.empty();=0D
+-        }=0D
+-=0D
+-        virtual void addChild( Ptr<ITracker> const& child ) CATCH_OVERRID=
E {=0D
+-            m_children.push_back( child );=0D
+-        }=0D
+-=0D
+-        virtual ITracker* findChild( std::string const& name ) CATCH_OVER=
RIDE {=0D
+-            Children::const_iterator it =3D std::find_if( m_children.begi=
n(), m_children.end(), TrackerHasName( name ) );=0D
+-            return( it !=3D m_children.end() )=0D
+-                ? it->get()=0D
+-                : CATCH_NULL;=0D
+-        }=0D
+-        virtual ITracker& parent() CATCH_OVERRIDE {=0D
+-            assert( m_parent ); // Should always be non-null except for r=
oot=0D
+-            return *m_parent;=0D
+-        }=0D
+-=0D
+-        virtual void openChild() CATCH_OVERRIDE {=0D
+-            if( m_runState !=3D ExecutingChildren ) {=0D
+-                m_runState =3D ExecutingChildren;=0D
+-                if( m_parent )=0D
+-                    m_parent->openChild();=0D
+-            }=0D
+-        }=0D
+-=0D
+-        virtual bool isSectionTracker() const CATCH_OVERRIDE { return fal=
se; }=0D
+-        virtual bool isIndexTracker() const CATCH_OVERRIDE { return false=
; }=0D
+-=0D
+-        void open() {=0D
+-            m_runState =3D Executing;=0D
+-            moveToThis();=0D
+-            if( m_parent )=0D
+-                m_parent->openChild();=0D
+-        }=0D
+-=0D
+-        virtual void close() CATCH_OVERRIDE {=0D
+-=0D
+-            // Close any still open children (e.g. generators)=0D
+-            while( &m_ctx.currentTracker() !=3D this )=0D
+-                m_ctx.currentTracker().close();=0D
+-=0D
+-            switch( m_runState ) {=0D
+-                case NotStarted:=0D
+-                case CompletedSuccessfully:=0D
+-                case Failed:=0D
+-                    throw std::logic_error( "Illogical state" );=0D
+-=0D
+-                case NeedsAnotherRun:=0D
+-                    break;;=0D
+-=0D
+-                case Executing:=0D
+-                    m_runState =3D CompletedSuccessfully;=0D
+-                    break;=0D
+-                case ExecutingChildren:=0D
+-                    if( m_children.empty() || m_children.back()->isComple=
te() )=0D
+-                        m_runState =3D CompletedSuccessfully;=0D
+-                    break;=0D
+-=0D
+-                default:=0D
+-                    throw std::logic_error( "Unexpected state" );=0D
+-            }=0D
+-            moveToParent();=0D
+-            m_ctx.completeCycle();=0D
+-        }=0D
+-        virtual void fail() CATCH_OVERRIDE {=0D
+-            m_runState =3D Failed;=0D
+-            if( m_parent )=0D
+-                m_parent->markAsNeedingAnotherRun();=0D
+-            moveToParent();=0D
+-            m_ctx.completeCycle();=0D
+-        }=0D
+-        virtual void markAsNeedingAnotherRun() CATCH_OVERRIDE {=0D
+-            m_runState =3D NeedsAnotherRun;=0D
+-        }=0D
+-    private:=0D
+-        void moveToParent() {=0D
+-            assert( m_parent );=0D
+-            m_ctx.setCurrentTracker( m_parent );=0D
+-        }=0D
+-        void moveToThis() {=0D
+-            m_ctx.setCurrentTracker( this );=0D
+-        }=0D
+-    };=0D
+-=0D
+-    class SectionTracker : public TrackerBase {=0D
+-    public:=0D
+-        SectionTracker( std::string const& name, TrackerContext& ctx, ITr=
acker* parent )=0D
+-        :   TrackerBase( name, ctx, parent )=0D
+-        {}=0D
+-        virtual ~SectionTracker();=0D
+-=0D
+-        virtual bool isSectionTracker() const CATCH_OVERRIDE { return tru=
e; }=0D
+-=0D
+-        static SectionTracker& acquire( TrackerContext& ctx, std::string =
const& name ) {=0D
+-            SectionTracker* section =3D CATCH_NULL;=0D
+-=0D
+-            ITracker& currentTracker =3D ctx.currentTracker();=0D
+-            if( ITracker* childTracker =3D currentTracker.findChild( name=
 ) ) {=0D
+-                assert( childTracker );=0D
+-                assert( childTracker->isSectionTracker() );=0D
+-                section =3D static_cast<SectionTracker*>( childTracker );=
=0D
+-            }=0D
+-            else {=0D
+-                section =3D new SectionTracker( name, ctx, &currentTracke=
r );=0D
+-                currentTracker.addChild( section );=0D
+-            }=0D
+-            if( !ctx.completedCycle() && !section->isComplete() ) {=0D
+-=0D
+-                section->open();=0D
+-            }=0D
+-            return *section;=0D
+-        }=0D
+-    };=0D
+-=0D
+-    class IndexTracker : public TrackerBase {=0D
+-        int m_size;=0D
+-        int m_index;=0D
+-    public:=0D
+-        IndexTracker( std::string const& name, TrackerContext& ctx, ITrac=
ker* parent, int size )=0D
+-        :   TrackerBase( name, ctx, parent ),=0D
+-            m_size( size ),=0D
+-            m_index( -1 )=0D
+-        {}=0D
+-        virtual ~IndexTracker();=0D
+-=0D
+-        virtual bool isIndexTracker() const CATCH_OVERRIDE { return true;=
 }=0D
+-=0D
+-        static IndexTracker& acquire( TrackerContext& ctx, std::string co=
nst& name, int size ) {=0D
+-            IndexTracker* tracker =3D CATCH_NULL;=0D
+-=0D
+-            ITracker& currentTracker =3D ctx.currentTracker();=0D
+-            if( ITracker* childTracker =3D currentTracker.findChild( name=
 ) ) {=0D
+-                assert( childTracker );=0D
+-                assert( childTracker->isIndexTracker() );=0D
+-                tracker =3D static_cast<IndexTracker*>( childTracker );=0D
+-            }=0D
+-            else {=0D
+-                tracker =3D new IndexTracker( name, ctx, &currentTracker,=
 size );=0D
+-                currentTracker.addChild( tracker );=0D
+-            }=0D
+-=0D
+-            if( !ctx.completedCycle() && !tracker->isComplete() ) {=0D
+-                if( tracker->m_runState !=3D ExecutingChildren && tracker=
->m_runState !=3D NeedsAnotherRun )=0D
+-                    tracker->moveNext();=0D
+-                tracker->open();=0D
+-            }=0D
+-=0D
+-            return *tracker;=0D
+-        }=0D
+-=0D
+-        int index() const { return m_index; }=0D
+-=0D
+-        void moveNext() {=0D
+-            m_index++;=0D
+-            m_children.clear();=0D
+-        }=0D
+-=0D
+-        virtual void close() CATCH_OVERRIDE {=0D
+-            TrackerBase::close();=0D
+-            if( m_runState =3D=3D CompletedSuccessfully && m_index < m_si=
ze-1 )=0D
+-                m_runState =3D Executing;=0D
+-        }=0D
+-    };=0D
+-=0D
+-    inline ITracker& TrackerContext::startRun() {=0D
+-        m_rootTracker =3D new SectionTracker( "{root}", *this, CATCH_NULL=
 );=0D
+-        m_currentTracker =3D CATCH_NULL;=0D
+-        m_runState =3D Executing;=0D
+-        return *m_rootTracker;=0D
+-    }=0D
+-=0D
+-} // namespace TestCaseTracking=0D
+-=0D
+-using TestCaseTracking::ITracker;=0D
+-using TestCaseTracking::TrackerContext;=0D
+-using TestCaseTracking::SectionTracker;=0D
+-using TestCaseTracking::IndexTracker;=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-// #included from: catch_fatal_condition.hpp=0D
+-#define TWOBLUECUBES_CATCH_FATAL_CONDITION_H_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    // Report the error condition then exit the process=0D
+-    inline void fatal( std::string const& message, int exitCode ) {=0D
+-        IContext& context =3D Catch::getCurrentContext();=0D
+-        IResultCapture* resultCapture =3D context.getResultCapture();=0D
+-        resultCapture->handleFatalErrorCondition( message );=0D
+-=0D
+-		if( Catch::alwaysTrue() ) // avoids "no return" warnings=0D
+-            exit( exitCode );=0D
+-    }=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-#if defined ( CATCH_PLATFORM_WINDOWS ) //////////////////////////////////=
///////=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct FatalConditionHandler {=0D
+-		void reset() {}=0D
+-	};=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-#else // Not Windows - assumed to be POSIX compatible ///////////////////=
///////=0D
+-=0D
+-#include <signal.h>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct SignalDefs { int id; const char* name; };=0D
+-    extern SignalDefs signalDefs[];=0D
+-    SignalDefs signalDefs[] =3D {=0D
+-            { SIGINT,  "SIGINT - Terminal interrupt signal" },=0D
+-            { SIGILL,  "SIGILL - Illegal instruction signal" },=0D
+-            { SIGFPE,  "SIGFPE - Floating point error signal" },=0D
+-            { SIGSEGV, "SIGSEGV - Segmentation violation signal" },=0D
+-            { SIGTERM, "SIGTERM - Termination request signal" },=0D
+-            { SIGABRT, "SIGABRT - Abort (abnormal termination) signal" }=
=0D
+-        };=0D
+-=0D
+-    struct FatalConditionHandler {=0D
+-=0D
+-        static void handleSignal( int sig ) {=0D
+-            for( std::size_t i =3D 0; i < sizeof(signalDefs)/sizeof(Signa=
lDefs); ++i )=0D
+-                if( sig =3D=3D signalDefs[i].id )=0D
+-                    fatal( signalDefs[i].name, -sig );=0D
+-            fatal( "<unknown signal>", -sig );=0D
+-        }=0D
+-=0D
+-        FatalConditionHandler() : m_isSet( true ) {=0D
+-            for( std::size_t i =3D 0; i < sizeof(signalDefs)/sizeof(Signa=
lDefs); ++i )=0D
+-                signal( signalDefs[i].id, handleSignal );=0D
+-        }=0D
+-        ~FatalConditionHandler() {=0D
+-            reset();=0D
+-        }=0D
+-        void reset() {=0D
+-            if( m_isSet ) {=0D
+-                for( std::size_t i =3D 0; i < sizeof(signalDefs)/sizeof(S=
ignalDefs); ++i )=0D
+-                    signal( signalDefs[i].id, SIG_DFL );=0D
+-                m_isSet =3D false;=0D
+-            }=0D
+-        }=0D
+-=0D
+-        bool m_isSet;=0D
+-    };=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-#endif // not Windows=0D
+-=0D
+-#include <set>=0D
+-#include <string>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class StreamRedirect {=0D
+-=0D
+-    public:=0D
+-        StreamRedirect( std::ostream& stream, std::string& targetString )=
=0D
+-        :   m_stream( stream ),=0D
+-            m_prevBuf( stream.rdbuf() ),=0D
+-            m_targetString( targetString )=0D
+-        {=0D
+-            stream.rdbuf( m_oss.rdbuf() );=0D
+-        }=0D
+-=0D
+-        ~StreamRedirect() {=0D
+-            m_targetString +=3D m_oss.str();=0D
+-            m_stream.rdbuf( m_prevBuf );=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        std::ostream& m_stream;=0D
+-        std::streambuf* m_prevBuf;=0D
+-        std::ostringstream m_oss;=0D
+-        std::string& m_targetString;=0D
+-    };=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////=0D
+-=0D
+-    class RunContext : public IResultCapture, public IRunner {=0D
+-=0D
+-        RunContext( RunContext const& );=0D
+-        void operator =3D( RunContext const& );=0D
+-=0D
+-    public:=0D
+-=0D
+-        explicit RunContext( Ptr<IConfig const> const& _config, Ptr<IStre=
amingReporter> const& reporter )=0D
+-        :   m_runInfo( _config->name() ),=0D
+-            m_context( getCurrentMutableContext() ),=0D
+-            m_activeTestCase( CATCH_NULL ),=0D
+-            m_config( _config ),=0D
+-            m_reporter( reporter )=0D
+-        {=0D
+-            m_context.setRunner( this );=0D
+-            m_context.setConfig( m_config );=0D
+-            m_context.setResultCapture( this );=0D
+-            m_reporter->testRunStarting( m_runInfo );=0D
+-        }=0D
+-=0D
+-        virtual ~RunContext() {=0D
+-            m_reporter->testRunEnded( TestRunStats( m_runInfo, m_totals, =
aborting() ) );=0D
+-        }=0D
+-=0D
+-        void testGroupStarting( std::string const& testSpec, std::size_t =
groupIndex, std::size_t groupsCount ) {=0D
+-            m_reporter->testGroupStarting( GroupInfo( testSpec, groupInde=
x, groupsCount ) );=0D
+-        }=0D
+-        void testGroupEnded( std::string const& testSpec, Totals const& t=
otals, std::size_t groupIndex, std::size_t groupsCount ) {=0D
+-            m_reporter->testGroupEnded( TestGroupStats( GroupInfo( testSp=
ec, groupIndex, groupsCount ), totals, aborting() ) );=0D
+-        }=0D
+-=0D
+-        Totals runTest( TestCase const& testCase ) {=0D
+-            Totals prevTotals =3D m_totals;=0D
+-=0D
+-            std::string redirectedCout;=0D
+-            std::string redirectedCerr;=0D
+-=0D
+-            TestCaseInfo testInfo =3D testCase.getTestCaseInfo();=0D
+-=0D
+-            m_reporter->testCaseStarting( testInfo );=0D
+-=0D
+-            m_activeTestCase =3D &testCase;=0D
+-=0D
+-            do {=0D
+-                m_trackerContext.startRun();=0D
+-                do {=0D
+-                    m_trackerContext.startCycle();=0D
+-                    m_testCaseTracker =3D &SectionTracker::acquire( m_tra=
ckerContext, testInfo.name );=0D
+-                    runCurrentTest( redirectedCout, redirectedCerr );=0D
+-                }=0D
+-                while( !m_testCaseTracker->isSuccessfullyCompleted() && !=
aborting() );=0D
+-            }=0D
+-            // !TBD: deprecated - this will be replaced by indexed tracke=
rs=0D
+-            while( getCurrentContext().advanceGeneratorsForCurrentTest() =
&& !aborting() );=0D
+-=0D
+-            Totals deltaTotals =3D m_totals.delta( prevTotals );=0D
+-            if( testInfo.expectedToFail() && deltaTotals.testCases.passed=
 > 0 ) {=0D
+-                deltaTotals.assertions.failed++;=0D
+-                deltaTotals.testCases.passed--;=0D
+-                deltaTotals.testCases.failed++;=0D
+-            }=0D
+-            m_totals.testCases +=3D deltaTotals.testCases;=0D
+-            m_reporter->testCaseEnded( TestCaseStats(   testInfo,=0D
+-                                                        deltaTotals,=0D
+-                                                        redirectedCout,=0D
+-                                                        redirectedCerr,=0D
+-                                                        aborting() ) );=0D
+-=0D
+-            m_activeTestCase =3D CATCH_NULL;=0D
+-            m_testCaseTracker =3D CATCH_NULL;=0D
+-=0D
+-            return deltaTotals;=0D
+-        }=0D
+-=0D
+-        Ptr<IConfig const> config() const {=0D
+-            return m_config;=0D
+-        }=0D
+-=0D
+-    private: // IResultCapture=0D
+-=0D
+-        virtual void assertionEnded( AssertionResult const& result ) {=0D
+-            if( result.getResultType() =3D=3D ResultWas::Ok ) {=0D
+-                m_totals.assertions.passed++;=0D
+-            }=0D
+-            else if( !result.isOk() ) {=0D
+-                m_totals.assertions.failed++;=0D
+-            }=0D
+-=0D
+-            if( m_reporter->assertionEnded( AssertionStats( result, m_mes=
sages, m_totals ) ) )=0D
+-                m_messages.clear();=0D
+-=0D
+-            // Reset working state=0D
+-            m_lastAssertionInfo =3D AssertionInfo( "", m_lastAssertionInf=
o.lineInfo, "{Unknown expression after the reported line}" , m_lastAssertio=
nInfo.resultDisposition );=0D
+-            m_lastResult =3D result;=0D
+-        }=0D
+-=0D
+-        virtual bool sectionStarted (=0D
+-            SectionInfo const& sectionInfo,=0D
+-            Counts& assertions=0D
+-        )=0D
+-        {=0D
+-            std::ostringstream oss;=0D
+-            oss << sectionInfo.name << "@" << sectionInfo.lineInfo;=0D
+-=0D
+-            ITracker& sectionTracker =3D SectionTracker::acquire( m_track=
erContext, oss.str() );=0D
+-            if( !sectionTracker.isOpen() )=0D
+-                return false;=0D
+-            m_activeSections.push_back( &sectionTracker );=0D
+-=0D
+-            m_lastAssertionInfo.lineInfo =3D sectionInfo.lineInfo;=0D
+-=0D
+-            m_reporter->sectionStarting( sectionInfo );=0D
+-=0D
+-            assertions =3D m_totals.assertions;=0D
+-=0D
+-            return true;=0D
+-        }=0D
+-        bool testForMissingAssertions( Counts& assertions ) {=0D
+-            if( assertions.total() !=3D 0 )=0D
+-                return false;=0D
+-            if( !m_config->warnAboutMissingAssertions() )=0D
+-                return false;=0D
+-            if( m_trackerContext.currentTracker().hasChildren() )=0D
+-                return false;=0D
+-            m_totals.assertions.failed++;=0D
+-            assertions.failed++;=0D
+-            return true;=0D
+-        }=0D
+-=0D
+-        virtual void sectionEnded( SectionEndInfo const& endInfo ) {=0D
+-            Counts assertions =3D m_totals.assertions - endInfo.prevAsser=
tions;=0D
+-            bool missingAssertions =3D testForMissingAssertions( assertio=
ns );=0D
+-=0D
+-            if( !m_activeSections.empty() ) {=0D
+-                m_activeSections.back()->close();=0D
+-                m_activeSections.pop_back();=0D
+-            }=0D
+-=0D
+-            m_reporter->sectionEnded( SectionStats( endInfo.sectionInfo, =
assertions, endInfo.durationInSeconds, missingAssertions ) );=0D
+-            m_messages.clear();=0D
+-        }=0D
+-=0D
+-        virtual void sectionEndedEarly( SectionEndInfo const& endInfo ) {=
=0D
+-            if( m_unfinishedSections.empty() )=0D
+-                m_activeSections.back()->fail();=0D
+-            else=0D
+-                m_activeSections.back()->close();=0D
+-            m_activeSections.pop_back();=0D
+-=0D
+-            m_unfinishedSections.push_back( endInfo );=0D
+-        }=0D
+-=0D
+-        virtual void pushScopedMessage( MessageInfo const& message ) {=0D
+-            m_messages.push_back( message );=0D
+-        }=0D
+-=0D
+-        virtual void popScopedMessage( MessageInfo const& message ) {=0D
+-            m_messages.erase( std::remove( m_messages.begin(), m_messages=
.end(), message ), m_messages.end() );=0D
+-        }=0D
+-=0D
+-        virtual std::string getCurrentTestName() const {=0D
+-            return m_activeTestCase=0D
+-                ? m_activeTestCase->getTestCaseInfo().name=0D
+-                : "";=0D
+-        }=0D
+-=0D
+-        virtual const AssertionResult* getLastResult() const {=0D
+-            return &m_lastResult;=0D
+-        }=0D
+-=0D
+-        virtual void handleFatalErrorCondition( std::string const& messag=
e ) {=0D
+-            ResultBuilder resultBuilder =3D makeUnexpectedResultBuilder()=
;=0D
+-            resultBuilder.setResultType( ResultWas::FatalErrorCondition )=
;=0D
+-            resultBuilder << message;=0D
+-            resultBuilder.captureExpression();=0D
+-=0D
+-            handleUnfinishedSections();=0D
+-=0D
+-            // Recreate section for test case (as we will lose the one th=
at was in scope)=0D
+-            TestCaseInfo const& testCaseInfo =3D m_activeTestCase->getTes=
tCaseInfo();=0D
+-            SectionInfo testCaseSection( testCaseInfo.lineInfo, testCaseI=
nfo.name, testCaseInfo.description );=0D
+-=0D
+-            Counts assertions;=0D
+-            assertions.failed =3D 1;=0D
+-            SectionStats testCaseSectionStats( testCaseSection, assertion=
s, 0, false );=0D
+-            m_reporter->sectionEnded( testCaseSectionStats );=0D
+-=0D
+-            TestCaseInfo testInfo =3D m_activeTestCase->getTestCaseInfo()=
;=0D
+-=0D
+-            Totals deltaTotals;=0D
+-            deltaTotals.testCases.failed =3D 1;=0D
+-            m_reporter->testCaseEnded( TestCaseStats(   testInfo,=0D
+-                                                        deltaTotals,=0D
+-                                                        "",=0D
+-                                                        "",=0D
+-                                                        false ) );=0D
+-            m_totals.testCases.failed++;=0D
+-            testGroupEnded( "", m_totals, 1, 1 );=0D
+-            m_reporter->testRunEnded( TestRunStats( m_runInfo, m_totals, =
false ) );=0D
+-        }=0D
+-=0D
+-    public:=0D
+-        // !TBD We need to do this another way!=0D
+-        bool aborting() const {=0D
+-            return m_totals.assertions.failed =3D=3D static_cast<std::siz=
e_t>( m_config->abortAfter() );=0D
+-        }=0D
+-=0D
+-    private:=0D
+-=0D
+-        void runCurrentTest( std::string& redirectedCout, std::string& re=
directedCerr ) {=0D
+-            TestCaseInfo const& testCaseInfo =3D m_activeTestCase->getTes=
tCaseInfo();=0D
+-            SectionInfo testCaseSection( testCaseInfo.lineInfo, testCaseI=
nfo.name, testCaseInfo.description );=0D
+-            m_reporter->sectionStarting( testCaseSection );=0D
+-            Counts prevAssertions =3D m_totals.assertions;=0D
+-            double duration =3D 0;=0D
+-            try {=0D
+-                m_lastAssertionInfo =3D AssertionInfo( "TEST_CASE", testC=
aseInfo.lineInfo, "", ResultDisposition::Normal );=0D
+-=0D
+-                seedRng( *m_config );=0D
+-=0D
+-                Timer timer;=0D
+-                timer.start();=0D
+-                if( m_reporter->getPreferences().shouldRedirectStdOut ) {=
=0D
+-                    StreamRedirect coutRedir( Catch::cout(), redirectedCo=
ut );=0D
+-                    StreamRedirect cerrRedir( Catch::cerr(), redirectedCe=
rr );=0D
+-                    invokeActiveTestCase();=0D
+-                }=0D
+-                else {=0D
+-                    invokeActiveTestCase();=0D
+-                }=0D
+-                duration =3D timer.getElapsedSeconds();=0D
+-            }=0D
+-            catch( TestFailureException& ) {=0D
+-                // This just means the test was aborted due to failure=0D
+-            }=0D
+-            catch(...) {=0D
+-                makeUnexpectedResultBuilder().useActiveException();=0D
+-            }=0D
+-            m_testCaseTracker->close();=0D
+-            handleUnfinishedSections();=0D
+-            m_messages.clear();=0D
+-=0D
+-            Counts assertions =3D m_totals.assertions - prevAssertions;=0D
+-            bool missingAssertions =3D testForMissingAssertions( assertio=
ns );=0D
+-=0D
+-            if( testCaseInfo.okToFail() ) {=0D
+-                std::swap( assertions.failedButOk, assertions.failed );=0D
+-                m_totals.assertions.failed -=3D assertions.failedButOk;=0D
+-                m_totals.assertions.failedButOk +=3D assertions.failedBut=
Ok;=0D
+-            }=0D
+-=0D
+-            SectionStats testCaseSectionStats( testCaseSection, assertion=
s, duration, missingAssertions );=0D
+-            m_reporter->sectionEnded( testCaseSectionStats );=0D
+-        }=0D
+-=0D
+-        void invokeActiveTestCase() {=0D
+-            FatalConditionHandler fatalConditionHandler; // Handle signal=
s=0D
+-            m_activeTestCase->invoke();=0D
+-            fatalConditionHandler.reset();=0D
+-        }=0D
+-=0D
+-    private:=0D
+-=0D
+-        ResultBuilder makeUnexpectedResultBuilder() const {=0D
+-            return ResultBuilder(   m_lastAssertionInfo.macroName.c_str()=
,=0D
+-                                    m_lastAssertionInfo.lineInfo,=0D
+-                                    m_lastAssertionInfo.capturedExpressio=
n.c_str(),=0D
+-                                    m_lastAssertionInfo.resultDisposition=
 );=0D
+-        }=0D
+-=0D
+-        void handleUnfinishedSections() {=0D
+-            // If sections ended prematurely due to an exception we store=
d their=0D
+-            // infos here so we can tear them down outside the unwind pro=
cess.=0D
+-            for( std::vector<SectionEndInfo>::const_reverse_iterator it =
=3D m_unfinishedSections.rbegin(),=0D
+-                        itEnd =3D m_unfinishedSections.rend();=0D
+-                    it !=3D itEnd;=0D
+-                    ++it )=0D
+-                sectionEnded( *it );=0D
+-            m_unfinishedSections.clear();=0D
+-        }=0D
+-=0D
+-        TestRunInfo m_runInfo;=0D
+-        IMutableContext& m_context;=0D
+-        TestCase const* m_activeTestCase;=0D
+-        ITracker* m_testCaseTracker;=0D
+-        ITracker* m_currentSectionTracker;=0D
+-        AssertionResult m_lastResult;=0D
+-=0D
+-        Ptr<IConfig const> m_config;=0D
+-        Totals m_totals;=0D
+-        Ptr<IStreamingReporter> m_reporter;=0D
+-        std::vector<MessageInfo> m_messages;=0D
+-        AssertionInfo m_lastAssertionInfo;=0D
+-        std::vector<SectionEndInfo> m_unfinishedSections;=0D
+-        std::vector<ITracker*> m_activeSections;=0D
+-        TrackerContext m_trackerContext;=0D
+-    };=0D
+-=0D
+-    IResultCapture& getResultCapture() {=0D
+-        if( IResultCapture* capture =3D getCurrentContext().getResultCapt=
ure() )=0D
+-            return *capture;=0D
+-        else=0D
+-            throw std::logic_error( "No result capture instance" );=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: internal/catch_version.h=0D
+-#define TWOBLUECUBES_CATCH_VERSION_H_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    // Versioning information=0D
+-    struct Version {=0D
+-        Version(    unsigned int _majorVersion,=0D
+-                    unsigned int _minorVersion,=0D
+-                    unsigned int _patchNumber,=0D
+-                    std::string const& _branchName,=0D
+-                    unsigned int _buildNumber );=0D
+-=0D
+-        unsigned int const majorVersion;=0D
+-        unsigned int const minorVersion;=0D
+-        unsigned int const patchNumber;=0D
+-=0D
+-        // buildNumber is only used if branchName is not null=0D
+-        std::string const branchName;=0D
+-        unsigned int const buildNumber;=0D
+-=0D
+-        friend std::ostream& operator << ( std::ostream& os, Version cons=
t& version );=0D
+-=0D
+-    private:=0D
+-        void operator=3D( Version const& );=0D
+-    };=0D
+-=0D
+-    extern Version libraryVersion;=0D
+-}=0D
+-=0D
+-#include <fstream>=0D
+-#include <stdlib.h>=0D
+-#include <limits>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    Ptr<IStreamingReporter> createReporter( std::string const& reporterNa=
me, Ptr<Config> const& config ) {=0D
+-        Ptr<IStreamingReporter> reporter =3D getRegistryHub().getReporter=
Registry().create( reporterName, config.get() );=0D
+-        if( !reporter ) {=0D
+-            std::ostringstream oss;=0D
+-            oss << "No reporter registered with name: '" << reporterName =
<< "'";=0D
+-            throw std::domain_error( oss.str() );=0D
+-        }=0D
+-        return reporter;=0D
+-    }=0D
+-=0D
+-    Ptr<IStreamingReporter> makeReporter( Ptr<Config> const& config ) {=0D
+-        std::vector<std::string> reporters =3D config->getReporterNames()=
;=0D
+-        if( reporters.empty() )=0D
+-            reporters.push_back( "console" );=0D
+-=0D
+-        Ptr<IStreamingReporter> reporter;=0D
+-        for( std::vector<std::string>::const_iterator it =3D reporters.be=
gin(), itEnd =3D reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            reporter =3D addReporter( reporter, createReporter( *it, conf=
ig ) );=0D
+-        return reporter;=0D
+-    }=0D
+-    Ptr<IStreamingReporter> addListeners( Ptr<IConfig const> const& confi=
g, Ptr<IStreamingReporter> reporters ) {=0D
+-        IReporterRegistry::Listeners listeners =3D getRegistryHub().getRe=
porterRegistry().getListeners();=0D
+-        for( IReporterRegistry::Listeners::const_iterator it =3D listener=
s.begin(), itEnd =3D listeners.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            reporters =3D addReporter(reporters, (*it)->create( ReporterC=
onfig( config ) ) );=0D
+-        return reporters;=0D
+-    }=0D
+-=0D
+-    Totals runTests( Ptr<Config> const& config ) {=0D
+-=0D
+-        Ptr<IConfig const> iconfig =3D config.get();=0D
+-=0D
+-        Ptr<IStreamingReporter> reporter =3D makeReporter( config );=0D
+-        reporter =3D addListeners( iconfig, reporter );=0D
+-=0D
+-        RunContext context( iconfig, reporter );=0D
+-=0D
+-        Totals totals;=0D
+-=0D
+-        context.testGroupStarting( config->name(), 1, 1 );=0D
+-=0D
+-        TestSpec testSpec =3D config->testSpec();=0D
+-        if( !testSpec.hasFilters() )=0D
+-            testSpec =3D TestSpecParser( ITagAliasRegistry::get() ).parse=
( "~[.]" ).testSpec(); // All not hidden tests=0D
+-=0D
+-        std::vector<TestCase> const& allTestCases =3D getAllTestCasesSort=
ed( *iconfig );=0D
+-        for( std::vector<TestCase>::const_iterator it =3D allTestCases.be=
gin(), itEnd =3D allTestCases.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it ) {=0D
+-            if( !context.aborting() && matchTest( *it, testSpec, *iconfig=
 ) )=0D
+-                totals +=3D context.runTest( *it );=0D
+-            else=0D
+-                reporter->skipTest( *it );=0D
+-        }=0D
+-=0D
+-        context.testGroupEnded( iconfig->name(), totals, 1, 1 );=0D
+-        return totals;=0D
+-    }=0D
+-=0D
+-    void applyFilenamesAsTags( IConfig const& config ) {=0D
+-        std::vector<TestCase> const& tests =3D getAllTestCasesSorted( con=
fig );=0D
+-        for(std::size_t i =3D 0; i < tests.size(); ++i ) {=0D
+-            TestCase& test =3D const_cast<TestCase&>( tests[i] );=0D
+-            std::set<std::string> tags =3D test.tags;=0D
+-=0D
+-            std::string filename =3D test.lineInfo.file;=0D
+-            std::string::size_type lastSlash =3D filename.find_last_of( "=
\\/" );=0D
+-            if( lastSlash !=3D std::string::npos )=0D
+-                filename =3D filename.substr( lastSlash+1 );=0D
+-=0D
+-            std::string::size_type lastDot =3D filename.find_last_of( "."=
 );=0D
+-            if( lastDot !=3D std::string::npos )=0D
+-                filename =3D filename.substr( 0, lastDot );=0D
+-=0D
+-            tags.insert( "#" + filename );=0D
+-            setTags( test, tags );=0D
+-        }=0D
+-    }=0D
+-=0D
+-    class Session : NonCopyable {=0D
+-        static bool alreadyInstantiated;=0D
+-=0D
+-    public:=0D
+-=0D
+-        struct OnUnusedOptions { enum DoWhat { Ignore, Fail }; };=0D
+-=0D
+-        Session()=0D
+-        : m_cli( makeCommandLineParser() ) {=0D
+-            if( alreadyInstantiated ) {=0D
+-                std::string msg =3D "Only one instance of Catch::Session =
can ever be used";=0D
+-                Catch::cerr() << msg << std::endl;=0D
+-                throw std::logic_error( msg );=0D
+-            }=0D
+-            alreadyInstantiated =3D true;=0D
+-        }=0D
+-        ~Session() {=0D
+-            Catch::cleanUp();=0D
+-        }=0D
+-=0D
+-        void showHelp( std::string const& processName ) {=0D
+-            Catch::cout() << "\nCatch v" << libraryVersion << "\n";=0D
+-=0D
+-            m_cli.usage( Catch::cout(), processName );=0D
+-            Catch::cout() << "For more detail usage please see the projec=
t docs\n" << std::endl;=0D
+-        }=0D
+-=0D
+-        int applyCommandLine( int argc, char const* const* const argv, On=
UnusedOptions::DoWhat unusedOptionBehaviour =3D OnUnusedOptions::Fail ) {=0D
+-            try {=0D
+-                m_cli.setThrowOnUnrecognisedTokens( unusedOptionBehaviour=
 =3D=3D OnUnusedOptions::Fail );=0D
+-                m_unusedTokens =3D m_cli.parseInto( Clara::argsToVector( =
argc, argv ), m_configData );=0D
+-                if( m_configData.showHelp )=0D
+-                    showHelp( m_configData.processName );=0D
+-                m_config.reset();=0D
+-            }=0D
+-            catch( std::exception& ex ) {=0D
+-                {=0D
+-                    Colour colourGuard( Colour::Red );=0D
+-                    Catch::cerr()=0D
+-                        << "\nError(s) in input:\n"=0D
+-                        << Text( ex.what(), TextAttributes().setIndent(2)=
 )=0D
+-                        << "\n\n";=0D
+-                }=0D
+-                m_cli.usage( Catch::cout(), m_configData.processName );=0D
+-                return (std::numeric_limits<int>::max)();=0D
+-            }=0D
+-            return 0;=0D
+-        }=0D
+-=0D
+-        void useConfigData( ConfigData const& _configData ) {=0D
+-            m_configData =3D _configData;=0D
+-            m_config.reset();=0D
+-        }=0D
+-=0D
+-        int run( int argc, char const* const* const argv ) {=0D
+-=0D
+-            int returnCode =3D applyCommandLine( argc, argv );=0D
+-            if( returnCode =3D=3D 0 )=0D
+-                returnCode =3D run();=0D
+-            return returnCode;=0D
+-        }=0D
+-=0D
+-        int run() {=0D
+-            if( m_configData.showHelp )=0D
+-                return 0;=0D
+-=0D
+-            try=0D
+-            {=0D
+-                config(); // Force config to be constructed=0D
+-=0D
+-                seedRng( *m_config );=0D
+-=0D
+-                if( m_configData.filenamesAsTags )=0D
+-                    applyFilenamesAsTags( *m_config );=0D
+-=0D
+-                // Handle list request=0D
+-                if( Option<std::size_t> listed =3D list( config() ) )=0D
+-                    return static_cast<int>( *listed );=0D
+-=0D
+-                return static_cast<int>( runTests( m_config ).assertions.=
failed );=0D
+-            }=0D
+-            catch( std::exception& ex ) {=0D
+-                Catch::cerr() << ex.what() << std::endl;=0D
+-                return (std::numeric_limits<int>::max)();=0D
+-            }=0D
+-        }=0D
+-=0D
+-        Clara::CommandLine<ConfigData> const& cli() const {=0D
+-            return m_cli;=0D
+-        }=0D
+-        std::vector<Clara::Parser::Token> const& unusedTokens() const {=0D
+-            return m_unusedTokens;=0D
+-        }=0D
+-        ConfigData& configData() {=0D
+-            return m_configData;=0D
+-        }=0D
+-        Config& config() {=0D
+-            if( !m_config )=0D
+-                m_config =3D new Config( m_configData );=0D
+-            return *m_config;=0D
+-        }=0D
+-    private:=0D
+-        Clara::CommandLine<ConfigData> m_cli;=0D
+-        std::vector<Clara::Parser::Token> m_unusedTokens;=0D
+-        ConfigData m_configData;=0D
+-        Ptr<Config> m_config;=0D
+-    };=0D
+-=0D
+-    bool Session::alreadyInstantiated =3D false;=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_registry_hub.hpp=0D
+-#define TWOBLUECUBES_CATCH_REGISTRY_HUB_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_test_case_registry_impl.hpp=0D
+-#define TWOBLUECUBES_CATCH_TEST_CASE_REGISTRY_IMPL_HPP_INCLUDED=0D
+-=0D
+-#include <vector>=0D
+-#include <set>=0D
+-#include <sstream>=0D
+-#include <iostream>=0D
+-#include <algorithm>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct RandomNumberGenerator {=0D
+-        typedef std::ptrdiff_t result_type;=0D
+-=0D
+-        result_type operator()( result_type n ) const { return std::rand(=
) % n; }=0D
+-=0D
+-#ifdef CATCH_CONFIG_CPP11_SHUFFLE=0D
+-        static constexpr result_type min() { return 0; }=0D
+-        static constexpr result_type max() { return 1000000; }=0D
+-        result_type operator()() const { return std::rand() % max(); }=0D
+-#endif=0D
+-        template<typename V>=0D
+-        static void shuffle( V& vector ) {=0D
+-            RandomNumberGenerator rng;=0D
+-#ifdef CATCH_CONFIG_CPP11_SHUFFLE=0D
+-            std::shuffle( vector.begin(), vector.end(), rng );=0D
+-#else=0D
+-            std::random_shuffle( vector.begin(), vector.end(), rng );=0D
+-#endif=0D
+-        }=0D
+-    };=0D
+-=0D
+-    inline std::vector<TestCase> sortTests( IConfig const& config, std::v=
ector<TestCase> const& unsortedTestCases ) {=0D
+-=0D
+-        std::vector<TestCase> sorted =3D unsortedTestCases;=0D
+-=0D
+-        switch( config.runOrder() ) {=0D
+-            case RunTests::InLexicographicalOrder:=0D
+-                std::sort( sorted.begin(), sorted.end() );=0D
+-                break;=0D
+-            case RunTests::InRandomOrder:=0D
+-                {=0D
+-                    seedRng( config );=0D
+-                    RandomNumberGenerator::shuffle( sorted );=0D
+-                }=0D
+-                break;=0D
+-            case RunTests::InDeclarationOrder:=0D
+-                // already in declaration order=0D
+-                break;=0D
+-        }=0D
+-        return sorted;=0D
+-    }=0D
+-    bool matchTest( TestCase const& testCase, TestSpec const& testSpec, I=
Config const& config ) {=0D
+-        return testSpec.matches( testCase ) && ( config.allowThrows() || =
!testCase.throws() );=0D
+-    }=0D
+-=0D
+-    void enforceNoDuplicateTestCases( std::vector<TestCase> const& functi=
ons ) {=0D
+-        std::set<TestCase> seenFunctions;=0D
+-        for( std::vector<TestCase>::const_iterator it =3D functions.begin=
(), itEnd =3D functions.end();=0D
+-            it !=3D itEnd;=0D
+-            ++it ) {=0D
+-            std::pair<std::set<TestCase>::const_iterator, bool> prev =3D =
seenFunctions.insert( *it );=0D
+-            if( !prev.second ) {=0D
+-                std::ostringstream ss;=0D
+-=0D
+-                ss  << Colour( Colour::Red )=0D
+-                    << "error: TEST_CASE( \"" << it->name << "\" ) alread=
y defined.\n"=0D
+-                    << "\tFirst seen at " << prev.first->getTestCaseInfo(=
).lineInfo << "\n"=0D
+-                    << "\tRedefined at " << it->getTestCaseInfo().lineInf=
o << std::endl;=0D
+-=0D
+-                throw std::runtime_error(ss.str());=0D
+-            }=0D
+-        }=0D
+-    }=0D
+-=0D
+-    std::vector<TestCase> filterTests( std::vector<TestCase> const& testC=
ases, TestSpec const& testSpec, IConfig const& config ) {=0D
+-        std::vector<TestCase> filtered;=0D
+-        filtered.reserve( testCases.size() );=0D
+-        for( std::vector<TestCase>::const_iterator it =3D testCases.begin=
(), itEnd =3D testCases.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            if( matchTest( *it, testSpec, config ) )=0D
+-                filtered.push_back( *it );=0D
+-        return filtered;=0D
+-    }=0D
+-    std::vector<TestCase> const& getAllTestCasesSorted( IConfig const& co=
nfig ) {=0D
+-        return getRegistryHub().getTestCaseRegistry().getAllTestsSorted( =
config );=0D
+-    }=0D
+-=0D
+-    class TestRegistry : public ITestCaseRegistry {=0D
+-    public:=0D
+-        TestRegistry()=0D
+-        :   m_currentSortOrder( RunTests::InDeclarationOrder ),=0D
+-            m_unnamedCount( 0 )=0D
+-        {}=0D
+-        virtual ~TestRegistry();=0D
+-=0D
+-        virtual void registerTest( TestCase const& testCase ) {=0D
+-            std::string name =3D testCase.getTestCaseInfo().name;=0D
+-            if( name =3D=3D "" ) {=0D
+-                std::ostringstream oss;=0D
+-                oss << "Anonymous test case " << ++m_unnamedCount;=0D
+-                return registerTest( testCase.withName( oss.str() ) );=0D
+-            }=0D
+-            m_functions.push_back( testCase );=0D
+-        }=0D
+-=0D
+-        virtual std::vector<TestCase> const& getAllTests() const {=0D
+-            return m_functions;=0D
+-        }=0D
+-        virtual std::vector<TestCase> const& getAllTestsSorted( IConfig c=
onst& config ) const {=0D
+-            if( m_sortedFunctions.empty() )=0D
+-                enforceNoDuplicateTestCases( m_functions );=0D
+-=0D
+-            if(  m_currentSortOrder !=3D config.runOrder() || m_sortedFun=
ctions.empty() ) {=0D
+-                m_sortedFunctions =3D sortTests( config, m_functions );=0D
+-                m_currentSortOrder =3D config.runOrder();=0D
+-            }=0D
+-            return m_sortedFunctions;=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        std::vector<TestCase> m_functions;=0D
+-        mutable RunTests::InWhatOrder m_currentSortOrder;=0D
+-        mutable std::vector<TestCase> m_sortedFunctions;=0D
+-        size_t m_unnamedCount;=0D
+-        std::ios_base::Init m_ostreamInit; // Forces cout/ cerr to be ini=
tialised=0D
+-    };=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////=0D
+-=0D
+-    class FreeFunctionTestCase : public SharedImpl<ITestCase> {=0D
+-    public:=0D
+-=0D
+-        FreeFunctionTestCase( TestFunction fun ) : m_fun( fun ) {}=0D
+-=0D
+-        virtual void invoke() const {=0D
+-            m_fun();=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        virtual ~FreeFunctionTestCase();=0D
+-=0D
+-        TestFunction m_fun;=0D
+-    };=0D
+-=0D
+-    inline std::string extractClassName( std::string const& classOrQualif=
iedMethodName ) {=0D
+-        std::string className =3D classOrQualifiedMethodName;=0D
+-        if( startsWith( className, "&" ) )=0D
+-        {=0D
+-            std::size_t lastColons =3D className.rfind( "::" );=0D
+-            std::size_t penultimateColons =3D className.rfind( "::", last=
Colons-1 );=0D
+-            if( penultimateColons =3D=3D std::string::npos )=0D
+-                penultimateColons =3D 1;=0D
+-            className =3D className.substr( penultimateColons, lastColons=
-penultimateColons );=0D
+-        }=0D
+-        return className;=0D
+-    }=0D
+-=0D
+-    void registerTestCase=0D
+-        (   ITestCase* testCase,=0D
+-            char const* classOrQualifiedMethodName,=0D
+-            NameAndDesc const& nameAndDesc,=0D
+-            SourceLineInfo const& lineInfo ) {=0D
+-=0D
+-        getMutableRegistryHub().registerTest=0D
+-            ( makeTestCase=0D
+-                (   testCase,=0D
+-                    extractClassName( classOrQualifiedMethodName ),=0D
+-                    nameAndDesc.name,=0D
+-                    nameAndDesc.description,=0D
+-                    lineInfo ) );=0D
+-    }=0D
+-    void registerTestCaseFunction=0D
+-        (   TestFunction function,=0D
+-            SourceLineInfo const& lineInfo,=0D
+-            NameAndDesc const& nameAndDesc ) {=0D
+-        registerTestCase( new FreeFunctionTestCase( function ), "", nameA=
ndDesc, lineInfo );=0D
+-    }=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////=0D
+-=0D
+-    AutoReg::AutoReg=0D
+-        (   TestFunction function,=0D
+-            SourceLineInfo const& lineInfo,=0D
+-            NameAndDesc const& nameAndDesc ) {=0D
+-        registerTestCaseFunction( function, lineInfo, nameAndDesc );=0D
+-    }=0D
+-=0D
+-    AutoReg::~AutoReg() {}=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_reporter_registry.hpp=0D
+-#define TWOBLUECUBES_CATCH_REPORTER_REGISTRY_HPP_INCLUDED=0D
+-=0D
+-#include <map>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class ReporterRegistry : public IReporterRegistry {=0D
+-=0D
+-    public:=0D
+-=0D
+-        virtual ~ReporterRegistry() CATCH_OVERRIDE {}=0D
+-=0D
+-        virtual IStreamingReporter* create( std::string const& name, Ptr<=
IConfig const> const& config ) const CATCH_OVERRIDE {=0D
+-            FactoryMap::const_iterator it =3D  m_factories.find( name );=
=0D
+-            if( it =3D=3D m_factories.end() )=0D
+-                return CATCH_NULL;=0D
+-            return it->second->create( ReporterConfig( config ) );=0D
+-        }=0D
+-=0D
+-        void registerReporter( std::string const& name, Ptr<IReporterFact=
ory> const& factory ) {=0D
+-            m_factories.insert( std::make_pair( name, factory ) );=0D
+-        }=0D
+-        void registerListener( Ptr<IReporterFactory> const& factory ) {=0D
+-            m_listeners.push_back( factory );=0D
+-        }=0D
+-=0D
+-        virtual FactoryMap const& getFactories() const CATCH_OVERRIDE {=0D
+-            return m_factories;=0D
+-        }=0D
+-        virtual Listeners const& getListeners() const CATCH_OVERRIDE {=0D
+-            return m_listeners;=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        FactoryMap m_factories;=0D
+-        Listeners m_listeners;=0D
+-    };=0D
+-}=0D
+-=0D
+-// #included from: catch_exception_translator_registry.hpp=0D
+-#define TWOBLUECUBES_CATCH_EXCEPTION_TRANSLATOR_REGISTRY_HPP_INCLUDED=0D
+-=0D
+-#ifdef __OBJC__=0D
+-#import "Foundation/Foundation.h"=0D
+-#endif=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class ExceptionTranslatorRegistry : public IExceptionTranslatorRegist=
ry {=0D
+-    public:=0D
+-        ~ExceptionTranslatorRegistry() {=0D
+-            deleteAll( m_translators );=0D
+-        }=0D
+-=0D
+-        virtual void registerTranslator( const IExceptionTranslator* tran=
slator ) {=0D
+-            m_translators.push_back( translator );=0D
+-        }=0D
+-=0D
+-        virtual std::string translateActiveException() const {=0D
+-            try {=0D
+-#ifdef __OBJC__=0D
+-                // In Objective-C try objective-c exceptions first=0D
+-                @try {=0D
+-                    return tryTranslators();=0D
+-                }=0D
+-                @catch (NSException *exception) {=0D
+-                    return Catch::toString( [exception description] );=0D
+-                }=0D
+-#else=0D
+-                return tryTranslators();=0D
+-#endif=0D
+-            }=0D
+-            catch( TestFailureException& ) {=0D
+-                throw;=0D
+-            }=0D
+-            catch( std::exception& ex ) {=0D
+-                return ex.what();=0D
+-            }=0D
+-            catch( std::string& msg ) {=0D
+-                return msg;=0D
+-            }=0D
+-            catch( const char* msg ) {=0D
+-                return msg;=0D
+-            }=0D
+-            catch(...) {=0D
+-                return "Unknown exception";=0D
+-            }=0D
+-        }=0D
+-=0D
+-        std::string tryTranslators() const {=0D
+-            if( m_translators.empty() )=0D
+-                throw;=0D
+-            else=0D
+-                return m_translators[0]->translate( m_translators.begin()=
+1, m_translators.end() );=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        std::vector<const IExceptionTranslator*> m_translators;=0D
+-    };=0D
+-}=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    namespace {=0D
+-=0D
+-        class RegistryHub : public IRegistryHub, public IMutableRegistryH=
ub {=0D
+-=0D
+-            RegistryHub( RegistryHub const& );=0D
+-            void operator=3D( RegistryHub const& );=0D
+-=0D
+-        public: // IRegistryHub=0D
+-            RegistryHub() {=0D
+-            }=0D
+-            virtual IReporterRegistry const& getReporterRegistry() const =
CATCH_OVERRIDE {=0D
+-                return m_reporterRegistry;=0D
+-            }=0D
+-            virtual ITestCaseRegistry const& getTestCaseRegistry() const =
CATCH_OVERRIDE {=0D
+-                return m_testCaseRegistry;=0D
+-            }=0D
+-            virtual IExceptionTranslatorRegistry& getExceptionTranslatorR=
egistry() CATCH_OVERRIDE {=0D
+-                return m_exceptionTranslatorRegistry;=0D
+-            }=0D
+-=0D
+-        public: // IMutableRegistryHub=0D
+-            virtual void registerReporter( std::string const& name, Ptr<I=
ReporterFactory> const& factory ) CATCH_OVERRIDE {=0D
+-                m_reporterRegistry.registerReporter( name, factory );=0D
+-            }=0D
+-            virtual void registerListener( Ptr<IReporterFactory> const& f=
actory ) CATCH_OVERRIDE {=0D
+-                m_reporterRegistry.registerListener( factory );=0D
+-            }=0D
+-            virtual void registerTest( TestCase const& testInfo ) CATCH_O=
VERRIDE {=0D
+-                m_testCaseRegistry.registerTest( testInfo );=0D
+-            }=0D
+-            virtual void registerTranslator( const IExceptionTranslator* =
translator ) CATCH_OVERRIDE {=0D
+-                m_exceptionTranslatorRegistry.registerTranslator( transla=
tor );=0D
+-            }=0D
+-=0D
+-        private:=0D
+-            TestRegistry m_testCaseRegistry;=0D
+-            ReporterRegistry m_reporterRegistry;=0D
+-            ExceptionTranslatorRegistry m_exceptionTranslatorRegistry;=0D
+-        };=0D
+-=0D
+-        // Single, global, instance=0D
+-        inline RegistryHub*& getTheRegistryHub() {=0D
+-            static RegistryHub* theRegistryHub =3D CATCH_NULL;=0D
+-            if( !theRegistryHub )=0D
+-                theRegistryHub =3D new RegistryHub();=0D
+-            return theRegistryHub;=0D
+-        }=0D
+-    }=0D
+-=0D
+-    IRegistryHub& getRegistryHub() {=0D
+-        return *getTheRegistryHub();=0D
+-    }=0D
+-    IMutableRegistryHub& getMutableRegistryHub() {=0D
+-        return *getTheRegistryHub();=0D
+-    }=0D
+-    void cleanUp() {=0D
+-        delete getTheRegistryHub();=0D
+-        getTheRegistryHub() =3D CATCH_NULL;=0D
+-        cleanUpContext();=0D
+-    }=0D
+-    std::string translateActiveException() {=0D
+-        return getRegistryHub().getExceptionTranslatorRegistry().translat=
eActiveException();=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_notimplemented_exception.hpp=0D
+-#define TWOBLUECUBES_CATCH_NOTIMPLEMENTED_EXCEPTION_HPP_INCLUDED=0D
+-=0D
+-#include <ostream>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    NotImplementedException::NotImplementedException( SourceLineInfo cons=
t& lineInfo )=0D
+-    :   m_lineInfo( lineInfo ) {=0D
+-        std::ostringstream oss;=0D
+-        oss << lineInfo << ": function ";=0D
+-        oss << "not implemented";=0D
+-        m_what =3D oss.str();=0D
+-    }=0D
+-=0D
+-    const char* NotImplementedException::what() const CATCH_NOEXCEPT {=0D
+-        return m_what.c_str();=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_context_impl.hpp=0D
+-#define TWOBLUECUBES_CATCH_CONTEXT_IMPL_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_stream.hpp=0D
+-#define TWOBLUECUBES_CATCH_STREAM_HPP_INCLUDED=0D
+-=0D
+-#include <stdexcept>=0D
+-#include <cstdio>=0D
+-#include <iostream>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    template<typename WriterF, size_t bufferSize=3D256>=0D
+-    class StreamBufImpl : public StreamBufBase {=0D
+-        char data[bufferSize];=0D
+-        WriterF m_writer;=0D
+-=0D
+-    public:=0D
+-        StreamBufImpl() {=0D
+-            setp( data, data + sizeof(data) );=0D
+-        }=0D
+-=0D
+-        ~StreamBufImpl() CATCH_NOEXCEPT {=0D
+-            sync();=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        int overflow( int c ) {=0D
+-            sync();=0D
+-=0D
+-            if( c !=3D EOF ) {=0D
+-                if( pbase() =3D=3D epptr() )=0D
+-                    m_writer( std::string( 1, static_cast<char>( c ) ) );=
=0D
+-                else=0D
+-                    sputc( static_cast<char>( c ) );=0D
+-            }=0D
+-            return 0;=0D
+-        }=0D
+-=0D
+-        int sync() {=0D
+-            if( pbase() !=3D pptr() ) {=0D
+-                m_writer( std::string( pbase(), static_cast<std::string::=
size_type>( pptr() - pbase() ) ) );=0D
+-                setp( pbase(), epptr() );=0D
+-            }=0D
+-            return 0;=0D
+-        }=0D
+-    };=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////=0D
+-=0D
+-    FileStream::FileStream( std::string const& filename ) {=0D
+-        m_ofs.open( filename.c_str() );=0D
+-        if( m_ofs.fail() ) {=0D
+-            std::ostringstream oss;=0D
+-            oss << "Unable to open file: '" << filename << "'";=0D
+-            throw std::domain_error( oss.str() );=0D
+-        }=0D
+-    }=0D
+-=0D
+-    std::ostream& FileStream::stream() const {=0D
+-        return m_ofs;=0D
+-    }=0D
+-=0D
+-    struct OutputDebugWriter {=0D
+-=0D
+-        void operator()( std::string const&str ) {=0D
+-            writeToDebugConsole( str );=0D
+-        }=0D
+-    };=0D
+-=0D
+-    DebugOutStream::DebugOutStream()=0D
+-    :   m_streamBuf( new StreamBufImpl<OutputDebugWriter>() ),=0D
+-        m_os( m_streamBuf.get() )=0D
+-    {}=0D
+-=0D
+-    std::ostream& DebugOutStream::stream() const {=0D
+-        return m_os;=0D
+-    }=0D
+-=0D
+-    // Store the streambuf from cout up-front because=0D
+-    // cout may get redirected when running tests=0D
+-    CoutStream::CoutStream()=0D
+-    :   m_os( Catch::cout().rdbuf() )=0D
+-    {}=0D
+-=0D
+-    std::ostream& CoutStream::stream() const {=0D
+-        return m_os;=0D
+-    }=0D
+-=0D
+-#ifndef CATCH_CONFIG_NOSTDOUT // If you #define this you must implement t=
hese functions=0D
+-    std::ostream& cout() {=0D
+-        return std::cout;=0D
+-    }=0D
+-    std::ostream& cerr() {=0D
+-        return std::cerr;=0D
+-    }=0D
+-#endif=0D
+-}=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class Context : public IMutableContext {=0D
+-=0D
+-        Context() : m_config( CATCH_NULL ), m_runner( CATCH_NULL ), m_res=
ultCapture( CATCH_NULL ) {}=0D
+-        Context( Context const& );=0D
+-        void operator=3D( Context const& );=0D
+-=0D
+-    public:=0D
+-        virtual ~Context() {=0D
+-            deleteAllValues( m_generatorsByTestName );=0D
+-        }=0D
+-=0D
+-    public: // IContext=0D
+-        virtual IResultCapture* getResultCapture() {=0D
+-            return m_resultCapture;=0D
+-        }=0D
+-        virtual IRunner* getRunner() {=0D
+-            return m_runner;=0D
+-        }=0D
+-        virtual size_t getGeneratorIndex( std::string const& fileInfo, si=
ze_t totalSize ) {=0D
+-            return getGeneratorsForCurrentTest()=0D
+-            .getGeneratorInfo( fileInfo, totalSize )=0D
+-            .getCurrentIndex();=0D
+-        }=0D
+-        virtual bool advanceGeneratorsForCurrentTest() {=0D
+-            IGeneratorsForTest* generators =3D findGeneratorsForCurrentTe=
st();=0D
+-            return generators && generators->moveNext();=0D
+-        }=0D
+-=0D
+-        virtual Ptr<IConfig const> getConfig() const {=0D
+-            return m_config;=0D
+-        }=0D
+-=0D
+-    public: // IMutableContext=0D
+-        virtual void setResultCapture( IResultCapture* resultCapture ) {=
=0D
+-            m_resultCapture =3D resultCapture;=0D
+-        }=0D
+-        virtual void setRunner( IRunner* runner ) {=0D
+-            m_runner =3D runner;=0D
+-        }=0D
+-        virtual void setConfig( Ptr<IConfig const> const& config ) {=0D
+-            m_config =3D config;=0D
+-        }=0D
+-=0D
+-        friend IMutableContext& getCurrentMutableContext();=0D
+-=0D
+-    private:=0D
+-        IGeneratorsForTest* findGeneratorsForCurrentTest() {=0D
+-            std::string testName =3D getResultCapture()->getCurrentTestNa=
me();=0D
+-=0D
+-            std::map<std::string, IGeneratorsForTest*>::const_iterator it=
 =3D=0D
+-                m_generatorsByTestName.find( testName );=0D
+-            return it !=3D m_generatorsByTestName.end()=0D
+-                ? it->second=0D
+-                : CATCH_NULL;=0D
+-        }=0D
+-=0D
+-        IGeneratorsForTest& getGeneratorsForCurrentTest() {=0D
+-            IGeneratorsForTest* generators =3D findGeneratorsForCurrentTe=
st();=0D
+-            if( !generators ) {=0D
+-                std::string testName =3D getResultCapture()->getCurrentTe=
stName();=0D
+-                generators =3D createGeneratorsForTest();=0D
+-                m_generatorsByTestName.insert( std::make_pair( testName, =
generators ) );=0D
+-            }=0D
+-            return *generators;=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        Ptr<IConfig const> m_config;=0D
+-        IRunner* m_runner;=0D
+-        IResultCapture* m_resultCapture;=0D
+-        std::map<std::string, IGeneratorsForTest*> m_generatorsByTestName=
;=0D
+-    };=0D
+-=0D
+-    namespace {=0D
+-        Context* currentContext =3D CATCH_NULL;=0D
+-    }=0D
+-    IMutableContext& getCurrentMutableContext() {=0D
+-        if( !currentContext )=0D
+-            currentContext =3D new Context();=0D
+-        return *currentContext;=0D
+-    }=0D
+-    IContext& getCurrentContext() {=0D
+-        return getCurrentMutableContext();=0D
+-    }=0D
+-=0D
+-    void cleanUpContext() {=0D
+-        delete currentContext;=0D
+-        currentContext =3D CATCH_NULL;=0D
+-    }=0D
+-}=0D
+-=0D
+-// #included from: catch_console_colour_impl.hpp=0D
+-#define TWOBLUECUBES_CATCH_CONSOLE_COLOUR_IMPL_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-    namespace {=0D
+-=0D
+-        struct IColourImpl {=0D
+-            virtual ~IColourImpl() {}=0D
+-            virtual void use( Colour::Code _colourCode ) =3D 0;=0D
+-        };=0D
+-=0D
+-        struct NoColourImpl : IColourImpl {=0D
+-            void use( Colour::Code ) {}=0D
+-=0D
+-            static IColourImpl* instance() {=0D
+-                static NoColourImpl s_instance;=0D
+-                return &s_instance;=0D
+-            }=0D
+-        };=0D
+-=0D
+-    } // anon namespace=0D
+-} // namespace Catch=0D
+-=0D
+-#if !defined( CATCH_CONFIG_COLOUR_NONE ) && !defined( CATCH_CONFIG_COLOUR=
_WINDOWS ) && !defined( CATCH_CONFIG_COLOUR_ANSI )=0D
+-#   ifdef CATCH_PLATFORM_WINDOWS=0D
+-#       define CATCH_CONFIG_COLOUR_WINDOWS=0D
+-#   else=0D
+-#       define CATCH_CONFIG_COLOUR_ANSI=0D
+-#   endif=0D
+-#endif=0D
+-=0D
+-#if defined ( CATCH_CONFIG_COLOUR_WINDOWS ) /////////////////////////////=
////////////=0D
+-=0D
+-// #included from: catch_windows_h_proxy.h=0D
+-=0D
+-#define TWOBLUECUBES_CATCH_WINDOWS_H_PROXY_H_INCLUDED=0D
+-=0D
+-#ifdef CATCH_DEFINES_NOMINMAX=0D
+-#  define NOMINMAX=0D
+-#endif=0D
+-#ifdef CATCH_DEFINES_WIN32_LEAN_AND_MEAN=0D
+-#  define WIN32_LEAN_AND_MEAN=0D
+-#endif=0D
+-=0D
+-#ifdef __AFXDLL=0D
+-#include <AfxWin.h>=0D
+-#else=0D
+-#include <windows.h>=0D
+-#endif=0D
+-=0D
+-#ifdef CATCH_DEFINES_NOMINMAX=0D
+-#  undef NOMINMAX=0D
+-#endif=0D
+-#ifdef CATCH_DEFINES_WIN32_LEAN_AND_MEAN=0D
+-#  undef WIN32_LEAN_AND_MEAN=0D
+-#endif=0D
+-=0D
+-namespace Catch {=0D
+-namespace {=0D
+-=0D
+-    class Win32ColourImpl : public IColourImpl {=0D
+-    public:=0D
+-        Win32ColourImpl() : stdoutHandle( GetStdHandle(STD_OUTPUT_HANDLE)=
 )=0D
+-        {=0D
+-            CONSOLE_SCREEN_BUFFER_INFO csbiInfo;=0D
+-            GetConsoleScreenBufferInfo( stdoutHandle, &csbiInfo );=0D
+-            originalForegroundAttributes =3D csbiInfo.wAttributes & ~( BA=
CKGROUND_GREEN | BACKGROUND_RED | BACKGROUND_BLUE | BACKGROUND_INTENSITY );=
=0D
+-            originalBackgroundAttributes =3D csbiInfo.wAttributes & ~( FO=
REGROUND_GREEN | FOREGROUND_RED | FOREGROUND_BLUE | FOREGROUND_INTENSITY );=
=0D
+-        }=0D
+-=0D
+-        virtual void use( Colour::Code _colourCode ) {=0D
+-            switch( _colourCode ) {=0D
+-                case Colour::None:      return setTextAttribute( original=
ForegroundAttributes );=0D
+-                case Colour::White:     return setTextAttribute( FOREGROU=
ND_GREEN | FOREGROUND_RED | FOREGROUND_BLUE );=0D
+-                case Colour::Red:       return setTextAttribute( FOREGROU=
ND_RED );=0D
+-                case Colour::Green:     return setTextAttribute( FOREGROU=
ND_GREEN );=0D
+-                case Colour::Blue:      return setTextAttribute( FOREGROU=
ND_BLUE );=0D
+-                case Colour::Cyan:      return setTextAttribute( FOREGROU=
ND_BLUE | FOREGROUND_GREEN );=0D
+-                case Colour::Yellow:    return setTextAttribute( FOREGROU=
ND_RED | FOREGROUND_GREEN );=0D
+-                case Colour::Grey:      return setTextAttribute( 0 );=0D
+-=0D
+-                case Colour::LightGrey:     return setTextAttribute( FORE=
GROUND_INTENSITY );=0D
+-                case Colour::BrightRed:     return setTextAttribute( FORE=
GROUND_INTENSITY | FOREGROUND_RED );=0D
+-                case Colour::BrightGreen:   return setTextAttribute( FORE=
GROUND_INTENSITY | FOREGROUND_GREEN );=0D
+-                case Colour::BrightWhite:   return setTextAttribute( FORE=
GROUND_INTENSITY | FOREGROUND_GREEN | FOREGROUND_RED | FOREGROUND_BLUE );=0D
+-=0D
+-                case Colour::Bright: throw std::logic_error( "not a colou=
r" );=0D
+-            }=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        void setTextAttribute( WORD _textAttribute ) {=0D
+-            SetConsoleTextAttribute( stdoutHandle, _textAttribute | origi=
nalBackgroundAttributes );=0D
+-        }=0D
+-        HANDLE stdoutHandle;=0D
+-        WORD originalForegroundAttributes;=0D
+-        WORD originalBackgroundAttributes;=0D
+-    };=0D
+-=0D
+-    IColourImpl* platformColourInstance() {=0D
+-        static Win32ColourImpl s_instance;=0D
+-=0D
+-        Ptr<IConfig const> config =3D getCurrentContext().getConfig();=0D
+-        UseColour::YesOrNo colourMode =3D config=0D
+-            ? config->useColour()=0D
+-            : UseColour::Auto;=0D
+-        if( colourMode =3D=3D UseColour::Auto )=0D
+-            colourMode =3D !isDebuggerActive()=0D
+-                ? UseColour::Yes=0D
+-                : UseColour::No;=0D
+-        return colourMode =3D=3D UseColour::Yes=0D
+-            ? &s_instance=0D
+-            : NoColourImpl::instance();=0D
+-    }=0D
+-=0D
+-} // end anon namespace=0D
+-} // end namespace Catch=0D
+-=0D
+-#elif defined( CATCH_CONFIG_COLOUR_ANSI ) ///////////////////////////////=
///////=0D
+-=0D
+-#include <unistd.h>=0D
+-=0D
+-namespace Catch {=0D
+-namespace {=0D
+-=0D
+-    // use POSIX/ ANSI console terminal codes=0D
+-    // Thanks to Adam Strzelecki for original contribution=0D
+-    // (http://github.com/nanoant)=0D
+-    // https://github.com/philsquared/Catch/pull/131=0D
+-    class PosixColourImpl : public IColourImpl {=0D
+-    public:=0D
+-        virtual void use( Colour::Code _colourCode ) {=0D
+-            switch( _colourCode ) {=0D
+-                case Colour::None:=0D
+-                case Colour::White:     return setColour( "[0m" );=0D
+-                case Colour::Red:       return setColour( "[0;31m" );=0D
+-                case Colour::Green:     return setColour( "[0;32m" );=0D
+-                case Colour::Blue:      return setColour( "[0;34m" );=0D
+-                case Colour::Cyan:      return setColour( "[0;36m" );=0D
+-                case Colour::Yellow:    return setColour( "[0;33m" );=0D
+-                case Colour::Grey:      return setColour( "[1;30m" );=0D
+-=0D
+-                case Colour::LightGrey:     return setColour( "[0;37m" );=
=0D
+-                case Colour::BrightRed:     return setColour( "[1;31m" );=
=0D
+-                case Colour::BrightGreen:   return setColour( "[1;32m" );=
=0D
+-                case Colour::BrightWhite:   return setColour( "[1;37m" );=
=0D
+-=0D
+-                case Colour::Bright: throw std::logic_error( "not a colou=
r" );=0D
+-            }=0D
+-        }=0D
+-        static IColourImpl* instance() {=0D
+-            static PosixColourImpl s_instance;=0D
+-            return &s_instance;=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        void setColour( const char* _escapeCode ) {=0D
+-            Catch::cout() << '\033' << _escapeCode;=0D
+-        }=0D
+-    };=0D
+-=0D
+-    IColourImpl* platformColourInstance() {=0D
+-        Ptr<IConfig const> config =3D getCurrentContext().getConfig();=0D
+-        UseColour::YesOrNo colourMode =3D config=0D
+-            ? config->useColour()=0D
+-            : UseColour::Auto;=0D
+-        if( colourMode =3D=3D UseColour::Auto )=0D
+-            colourMode =3D (!isDebuggerActive() && isatty(STDOUT_FILENO) =
)=0D
+-                ? UseColour::Yes=0D
+-                : UseColour::No;=0D
+-        return colourMode =3D=3D UseColour::Yes=0D
+-            ? PosixColourImpl::instance()=0D
+-            : NoColourImpl::instance();=0D
+-    }=0D
+-=0D
+-} // end anon namespace=0D
+-} // end namespace Catch=0D
+-=0D
+-#else  // not Windows or ANSI ///////////////////////////////////////////=
////=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    static IColourImpl* platformColourInstance() { return NoColourImpl::i=
nstance(); }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-#endif // Windows/ ANSI/ None=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    Colour::Colour( Code _colourCode ) : m_moved( false ) { use( _colourC=
ode ); }=0D
+-    Colour::Colour( Colour const& _other ) : m_moved( false ) { const_cas=
t<Colour&>( _other ).m_moved =3D true; }=0D
+-    Colour::~Colour(){ if( !m_moved ) use( None ); }=0D
+-=0D
+-    void Colour::use( Code _colourCode ) {=0D
+-        static IColourImpl* impl =3D platformColourInstance();=0D
+-        impl->use( _colourCode );=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_generators_impl.hpp=0D
+-#define TWOBLUECUBES_CATCH_GENERATORS_IMPL_HPP_INCLUDED=0D
+-=0D
+-#include <vector>=0D
+-#include <string>=0D
+-#include <map>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct GeneratorInfo : IGeneratorInfo {=0D
+-=0D
+-        GeneratorInfo( std::size_t size )=0D
+-        :   m_size( size ),=0D
+-            m_currentIndex( 0 )=0D
+-        {}=0D
+-=0D
+-        bool moveNext() {=0D
+-            if( ++m_currentIndex =3D=3D m_size ) {=0D
+-                m_currentIndex =3D 0;=0D
+-                return false;=0D
+-            }=0D
+-            return true;=0D
+-        }=0D
+-=0D
+-        std::size_t getCurrentIndex() const {=0D
+-            return m_currentIndex;=0D
+-        }=0D
+-=0D
+-        std::size_t m_size;=0D
+-        std::size_t m_currentIndex;=0D
+-    };=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
//////=0D
+-=0D
+-    class GeneratorsForTest : public IGeneratorsForTest {=0D
+-=0D
+-    public:=0D
+-        ~GeneratorsForTest() {=0D
+-            deleteAll( m_generatorsInOrder );=0D
+-        }=0D
+-=0D
+-        IGeneratorInfo& getGeneratorInfo( std::string const& fileInfo, st=
d::size_t size ) {=0D
+-            std::map<std::string, IGeneratorInfo*>::const_iterator it =3D=
 m_generatorsByName.find( fileInfo );=0D
+-            if( it =3D=3D m_generatorsByName.end() ) {=0D
+-                IGeneratorInfo* info =3D new GeneratorInfo( size );=0D
+-                m_generatorsByName.insert( std::make_pair( fileInfo, info=
 ) );=0D
+-                m_generatorsInOrder.push_back( info );=0D
+-                return *info;=0D
+-            }=0D
+-            return *it->second;=0D
+-        }=0D
+-=0D
+-        bool moveNext() {=0D
+-            std::vector<IGeneratorInfo*>::const_iterator it =3D m_generat=
orsInOrder.begin();=0D
+-            std::vector<IGeneratorInfo*>::const_iterator itEnd =3D m_gene=
ratorsInOrder.end();=0D
+-            for(; it !=3D itEnd; ++it ) {=0D
+-                if( (*it)->moveNext() )=0D
+-                    return true;=0D
+-            }=0D
+-            return false;=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        std::map<std::string, IGeneratorInfo*> m_generatorsByName;=0D
+-        std::vector<IGeneratorInfo*> m_generatorsInOrder;=0D
+-    };=0D
+-=0D
+-    IGeneratorsForTest* createGeneratorsForTest()=0D
+-    {=0D
+-        return new GeneratorsForTest();=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_assertionresult.hpp=0D
+-#define TWOBLUECUBES_CATCH_ASSERTIONRESULT_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    AssertionInfo::AssertionInfo(   std::string const& _macroName,=0D
+-                                    SourceLineInfo const& _lineInfo,=0D
+-                                    std::string const& _capturedExpressio=
n,=0D
+-                                    ResultDisposition::Flags _resultDispo=
sition )=0D
+-    :   macroName( _macroName ),=0D
+-        lineInfo( _lineInfo ),=0D
+-        capturedExpression( _capturedExpression ),=0D
+-        resultDisposition( _resultDisposition )=0D
+-    {}=0D
+-=0D
+-    AssertionResult::AssertionResult() {}=0D
+-=0D
+-    AssertionResult::AssertionResult( AssertionInfo const& info, Assertio=
nResultData const& data )=0D
+-    :   m_info( info ),=0D
+-        m_resultData( data )=0D
+-    {}=0D
+-=0D
+-    AssertionResult::~AssertionResult() {}=0D
+-=0D
+-    // Result was a success=0D
+-    bool AssertionResult::succeeded() const {=0D
+-        return Catch::isOk( m_resultData.resultType );=0D
+-    }=0D
+-=0D
+-    // Result was a success, or failure is suppressed=0D
+-    bool AssertionResult::isOk() const {=0D
+-        return Catch::isOk( m_resultData.resultType ) || shouldSuppressFa=
ilure( m_info.resultDisposition );=0D
+-    }=0D
+-=0D
+-    ResultWas::OfType AssertionResult::getResultType() const {=0D
+-        return m_resultData.resultType;=0D
+-    }=0D
+-=0D
+-    bool AssertionResult::hasExpression() const {=0D
+-        return !m_info.capturedExpression.empty();=0D
+-    }=0D
+-=0D
+-    bool AssertionResult::hasMessage() const {=0D
+-        return !m_resultData.message.empty();=0D
+-    }=0D
+-=0D
+-    std::string AssertionResult::getExpression() const {=0D
+-        if( isFalseTest( m_info.resultDisposition ) )=0D
+-            return "!" + m_info.capturedExpression;=0D
+-        else=0D
+-            return m_info.capturedExpression;=0D
+-    }=0D
+-    std::string AssertionResult::getExpressionInMacro() const {=0D
+-        if( m_info.macroName.empty() )=0D
+-            return m_info.capturedExpression;=0D
+-        else=0D
+-            return m_info.macroName + "( " + m_info.capturedExpression + =
" )";=0D
+-    }=0D
+-=0D
+-    bool AssertionResult::hasExpandedExpression() const {=0D
+-        return hasExpression() && getExpandedExpression() !=3D getExpress=
ion();=0D
+-    }=0D
+-=0D
+-    std::string AssertionResult::getExpandedExpression() const {=0D
+-        return m_resultData.reconstructedExpression;=0D
+-    }=0D
+-=0D
+-    std::string AssertionResult::getMessage() const {=0D
+-        return m_resultData.message;=0D
+-    }=0D
+-    SourceLineInfo AssertionResult::getSourceInfo() const {=0D
+-        return m_info.lineInfo;=0D
+-    }=0D
+-=0D
+-    std::string AssertionResult::getTestMacroName() const {=0D
+-        return m_info.macroName;=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_test_case_info.hpp=0D
+-#define TWOBLUECUBES_CATCH_TEST_CASE_INFO_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    inline TestCaseInfo::SpecialProperties parseSpecialTag( std::string c=
onst& tag ) {=0D
+-        if( startsWith( tag, "." ) ||=0D
+-            tag =3D=3D "hide" ||=0D
+-            tag =3D=3D "!hide" )=0D
+-            return TestCaseInfo::IsHidden;=0D
+-        else if( tag =3D=3D "!throws" )=0D
+-            return TestCaseInfo::Throws;=0D
+-        else if( tag =3D=3D "!shouldfail" )=0D
+-            return TestCaseInfo::ShouldFail;=0D
+-        else if( tag =3D=3D "!mayfail" )=0D
+-            return TestCaseInfo::MayFail;=0D
+-        else=0D
+-            return TestCaseInfo::None;=0D
+-    }=0D
+-    inline bool isReservedTag( std::string const& tag ) {=0D
+-        return parseSpecialTag( tag ) =3D=3D TestCaseInfo::None && tag.si=
ze() > 0 && !isalnum( tag[0] );=0D
+-    }=0D
+-    inline void enforceNotReservedTag( std::string const& tag, SourceLine=
Info const& _lineInfo ) {=0D
+-        if( isReservedTag( tag ) ) {=0D
+-            {=0D
+-                Colour colourGuard( Colour::Red );=0D
+-                Catch::cerr()=0D
+-                    << "Tag name [" << tag << "] not allowed.\n"=0D
+-                    << "Tag names starting with non alpha-numeric charact=
ers are reserved\n";=0D
+-            }=0D
+-            {=0D
+-                Colour colourGuard( Colour::FileName );=0D
+-                Catch::cerr() << _lineInfo << std::endl;=0D
+-            }=0D
+-            exit(1);=0D
+-        }=0D
+-    }=0D
+-=0D
+-    TestCase makeTestCase(  ITestCase* _testCase,=0D
+-                            std::string const& _className,=0D
+-                            std::string const& _name,=0D
+-                            std::string const& _descOrTags,=0D
+-                            SourceLineInfo const& _lineInfo )=0D
+-    {=0D
+-        bool isHidden( startsWith( _name, "./" ) ); // Legacy support=0D
+-=0D
+-        // Parse out tags=0D
+-        std::set<std::string> tags;=0D
+-        std::string desc, tag;=0D
+-        bool inTag =3D false;=0D
+-        for( std::size_t i =3D 0; i < _descOrTags.size(); ++i ) {=0D
+-            char c =3D _descOrTags[i];=0D
+-            if( !inTag ) {=0D
+-                if( c =3D=3D '[' )=0D
+-                    inTag =3D true;=0D
+-                else=0D
+-                    desc +=3D c;=0D
+-            }=0D
+-            else {=0D
+-                if( c =3D=3D ']' ) {=0D
+-                    TestCaseInfo::SpecialProperties prop =3D parseSpecial=
Tag( tag );=0D
+-                    if( prop =3D=3D TestCaseInfo::IsHidden )=0D
+-                        isHidden =3D true;=0D
+-                    else if( prop =3D=3D TestCaseInfo::None )=0D
+-                        enforceNotReservedTag( tag, _lineInfo );=0D
+-=0D
+-                    tags.insert( tag );=0D
+-                    tag.clear();=0D
+-                    inTag =3D false;=0D
+-                }=0D
+-                else=0D
+-                    tag +=3D c;=0D
+-            }=0D
+-        }=0D
+-        if( isHidden ) {=0D
+-            tags.insert( "hide" );=0D
+-            tags.insert( "." );=0D
+-        }=0D
+-=0D
+-        TestCaseInfo info( _name, _className, desc, tags, _lineInfo );=0D
+-        return TestCase( _testCase, info );=0D
+-    }=0D
+-=0D
+-    void setTags( TestCaseInfo& testCaseInfo, std::set<std::string> const=
& tags )=0D
+-    {=0D
+-        testCaseInfo.tags =3D tags;=0D
+-        testCaseInfo.lcaseTags.clear();=0D
+-=0D
+-        std::ostringstream oss;=0D
+-        for( std::set<std::string>::const_iterator it =3D tags.begin(), i=
tEnd =3D tags.end(); it !=3D itEnd; ++it ) {=0D
+-            oss << "[" << *it << "]";=0D
+-            std::string lcaseTag =3D toLower( *it );=0D
+-            testCaseInfo.properties =3D static_cast<TestCaseInfo::Special=
Properties>( testCaseInfo.properties | parseSpecialTag( lcaseTag ) );=0D
+-            testCaseInfo.lcaseTags.insert( lcaseTag );=0D
+-        }=0D
+-        testCaseInfo.tagsAsString =3D oss.str();=0D
+-    }=0D
+-=0D
+-    TestCaseInfo::TestCaseInfo( std::string const& _name,=0D
+-                                std::string const& _className,=0D
+-                                std::string const& _description,=0D
+-                                std::set<std::string> const& _tags,=0D
+-                                SourceLineInfo const& _lineInfo )=0D
+-    :   name( _name ),=0D
+-        className( _className ),=0D
+-        description( _description ),=0D
+-        lineInfo( _lineInfo ),=0D
+-        properties( None )=0D
+-    {=0D
+-        setTags( *this, _tags );=0D
+-    }=0D
+-=0D
+-    TestCaseInfo::TestCaseInfo( TestCaseInfo const& other )=0D
+-    :   name( other.name ),=0D
+-        className( other.className ),=0D
+-        description( other.description ),=0D
+-        tags( other.tags ),=0D
+-        lcaseTags( other.lcaseTags ),=0D
+-        tagsAsString( other.tagsAsString ),=0D
+-        lineInfo( other.lineInfo ),=0D
+-        properties( other.properties )=0D
+-    {}=0D
+-=0D
+-    bool TestCaseInfo::isHidden() const {=0D
+-        return ( properties & IsHidden ) !=3D 0;=0D
+-    }=0D
+-    bool TestCaseInfo::throws() const {=0D
+-        return ( properties & Throws ) !=3D 0;=0D
+-    }=0D
+-    bool TestCaseInfo::okToFail() const {=0D
+-        return ( properties & (ShouldFail | MayFail ) ) !=3D 0;=0D
+-    }=0D
+-    bool TestCaseInfo::expectedToFail() const {=0D
+-        return ( properties & (ShouldFail ) ) !=3D 0;=0D
+-    }=0D
+-=0D
+-    TestCase::TestCase( ITestCase* testCase, TestCaseInfo const& info ) :=
 TestCaseInfo( info ), test( testCase ) {}=0D
+-=0D
+-    TestCase::TestCase( TestCase const& other )=0D
+-    :   TestCaseInfo( other ),=0D
+-        test( other.test )=0D
+-    {}=0D
+-=0D
+-    TestCase TestCase::withName( std::string const& _newName ) const {=0D
+-        TestCase other( *this );=0D
+-        other.name =3D _newName;=0D
+-        return other;=0D
+-    }=0D
+-=0D
+-    void TestCase::swap( TestCase& other ) {=0D
+-        test.swap( other.test );=0D
+-        name.swap( other.name );=0D
+-        className.swap( other.className );=0D
+-        description.swap( other.description );=0D
+-        tags.swap( other.tags );=0D
+-        lcaseTags.swap( other.lcaseTags );=0D
+-        tagsAsString.swap( other.tagsAsString );=0D
+-        std::swap( TestCaseInfo::properties, static_cast<TestCaseInfo&>( =
other ).properties );=0D
+-        std::swap( lineInfo, other.lineInfo );=0D
+-    }=0D
+-=0D
+-    void TestCase::invoke() const {=0D
+-        test->invoke();=0D
+-    }=0D
+-=0D
+-    bool TestCase::operator =3D=3D ( TestCase const& other ) const {=0D
+-        return  test.get() =3D=3D other.test.get() &&=0D
+-                name =3D=3D other.name &&=0D
+-                className =3D=3D other.className;=0D
+-    }=0D
+-=0D
+-    bool TestCase::operator < ( TestCase const& other ) const {=0D
+-        return name < other.name;=0D
+-    }=0D
+-    TestCase& TestCase::operator =3D ( TestCase const& other ) {=0D
+-        TestCase temp( other );=0D
+-        swap( temp );=0D
+-        return *this;=0D
+-    }=0D
+-=0D
+-    TestCaseInfo const& TestCase::getTestCaseInfo() const=0D
+-    {=0D
+-        return *this;=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_version.hpp=0D
+-#define TWOBLUECUBES_CATCH_VERSION_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    Version::Version=0D
+-        (   unsigned int _majorVersion,=0D
+-            unsigned int _minorVersion,=0D
+-            unsigned int _patchNumber,=0D
+-            std::string const& _branchName,=0D
+-            unsigned int _buildNumber )=0D
+-    :   majorVersion( _majorVersion ),=0D
+-        minorVersion( _minorVersion ),=0D
+-        patchNumber( _patchNumber ),=0D
+-        branchName( _branchName ),=0D
+-        buildNumber( _buildNumber )=0D
+-    {}=0D
+-=0D
+-    std::ostream& operator << ( std::ostream& os, Version const& version =
) {=0D
+-        os  << version.majorVersion << "."=0D
+-            << version.minorVersion << "."=0D
+-            << version.patchNumber;=0D
+-=0D
+-        if( !version.branchName.empty() ) {=0D
+-            os  << "-" << version.branchName=0D
+-                << "." << version.buildNumber;=0D
+-        }=0D
+-        return os;=0D
+-    }=0D
+-=0D
+-    Version libraryVersion( 1, 6, 1, "", 0 );=0D
+-=0D
+-}=0D
+-=0D
+-// #included from: catch_message.hpp=0D
+-#define TWOBLUECUBES_CATCH_MESSAGE_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    MessageInfo::MessageInfo(   std::string const& _macroName,=0D
+-                                SourceLineInfo const& _lineInfo,=0D
+-                                ResultWas::OfType _type )=0D
+-    :   macroName( _macroName ),=0D
+-        lineInfo( _lineInfo ),=0D
+-        type( _type ),=0D
+-        sequence( ++globalCount )=0D
+-    {}=0D
+-=0D
+-    // This may need protecting if threading support is added=0D
+-    unsigned int MessageInfo::globalCount =3D 0;=0D
+-=0D
+-    /////////////////////////////////////////////////////////////////////=
///////=0D
+-=0D
+-    ScopedMessage::ScopedMessage( MessageBuilder const& builder )=0D
+-    : m_info( builder.m_info )=0D
+-    {=0D
+-        m_info.message =3D builder.m_stream.str();=0D
+-        getResultCapture().pushScopedMessage( m_info );=0D
+-    }=0D
+-    ScopedMessage::ScopedMessage( ScopedMessage const& other )=0D
+-    : m_info( other.m_info )=0D
+-    {}=0D
+-=0D
+-    ScopedMessage::~ScopedMessage() {=0D
+-        getResultCapture().popScopedMessage( m_info );=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_legacy_reporter_adapter.hpp=0D
+-#define TWOBLUECUBES_CATCH_LEGACY_REPORTER_ADAPTER_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_legacy_reporter_adapter.h=0D
+-#define TWOBLUECUBES_CATCH_LEGACY_REPORTER_ADAPTER_H_INCLUDED=0D
+-=0D
+-namespace Catch=0D
+-{=0D
+-    // Deprecated=0D
+-    struct IReporter : IShared {=0D
+-        virtual ~IReporter();=0D
+-=0D
+-        virtual bool shouldRedirectStdout() const =3D 0;=0D
+-=0D
+-        virtual void StartTesting() =3D 0;=0D
+-        virtual void EndTesting( Totals const& totals ) =3D 0;=0D
+-        virtual void StartGroup( std::string const& groupName ) =3D 0;=0D
+-        virtual void EndGroup( std::string const& groupName, Totals const=
& totals ) =3D 0;=0D
+-        virtual void StartTestCase( TestCaseInfo const& testInfo ) =3D 0;=
=0D
+-        virtual void EndTestCase( TestCaseInfo const& testInfo, Totals co=
nst& totals, std::string const& stdOut, std::string const& stdErr ) =3D 0;=
=0D
+-        virtual void StartSection( std::string const& sectionName, std::s=
tring const& description ) =3D 0;=0D
+-        virtual void EndSection( std::string const& sectionName, Counts c=
onst& assertions ) =3D 0;=0D
+-        virtual void NoAssertionsInSection( std::string const& sectionNam=
e ) =3D 0;=0D
+-        virtual void NoAssertionsInTestCase( std::string const& testName =
) =3D 0;=0D
+-        virtual void Aborted() =3D 0;=0D
+-        virtual void Result( AssertionResult const& result ) =3D 0;=0D
+-    };=0D
+-=0D
+-    class LegacyReporterAdapter : public SharedImpl<IStreamingReporter>=0D
+-    {=0D
+-    public:=0D
+-        LegacyReporterAdapter( Ptr<IReporter> const& legacyReporter );=0D
+-        virtual ~LegacyReporterAdapter();=0D
+-=0D
+-        virtual ReporterPreferences getPreferences() const;=0D
+-        virtual void noMatchingTestCases( std::string const& );=0D
+-        virtual void testRunStarting( TestRunInfo const& );=0D
+-        virtual void testGroupStarting( GroupInfo const& groupInfo );=0D
+-        virtual void testCaseStarting( TestCaseInfo const& testInfo );=0D
+-        virtual void sectionStarting( SectionInfo const& sectionInfo );=0D
+-        virtual void assertionStarting( AssertionInfo const& );=0D
+-        virtual bool assertionEnded( AssertionStats const& assertionStats=
 );=0D
+-        virtual void sectionEnded( SectionStats const& sectionStats );=0D
+-        virtual void testCaseEnded( TestCaseStats const& testCaseStats );=
=0D
+-        virtual void testGroupEnded( TestGroupStats const& testGroupStats=
 );=0D
+-        virtual void testRunEnded( TestRunStats const& testRunStats );=0D
+-        virtual void skipTest( TestCaseInfo const& );=0D
+-=0D
+-    private:=0D
+-        Ptr<IReporter> m_legacyReporter;=0D
+-    };=0D
+-}=0D
+-=0D
+-namespace Catch=0D
+-{=0D
+-    LegacyReporterAdapter::LegacyReporterAdapter( Ptr<IReporter> const& l=
egacyReporter )=0D
+-    :   m_legacyReporter( legacyReporter )=0D
+-    {}=0D
+-    LegacyReporterAdapter::~LegacyReporterAdapter() {}=0D
+-=0D
+-    ReporterPreferences LegacyReporterAdapter::getPreferences() const {=0D
+-        ReporterPreferences prefs;=0D
+-        prefs.shouldRedirectStdOut =3D m_legacyReporter->shouldRedirectSt=
dout();=0D
+-        return prefs;=0D
+-    }=0D
+-=0D
+-    void LegacyReporterAdapter::noMatchingTestCases( std::string const& )=
 {}=0D
+-    void LegacyReporterAdapter::testRunStarting( TestRunInfo const& ) {=0D
+-        m_legacyReporter->StartTesting();=0D
+-    }=0D
+-    void LegacyReporterAdapter::testGroupStarting( GroupInfo const& group=
Info ) {=0D
+-        m_legacyReporter->StartGroup( groupInfo.name );=0D
+-    }=0D
+-    void LegacyReporterAdapter::testCaseStarting( TestCaseInfo const& tes=
tInfo ) {=0D
+-        m_legacyReporter->StartTestCase( testInfo );=0D
+-    }=0D
+-    void LegacyReporterAdapter::sectionStarting( SectionInfo const& secti=
onInfo ) {=0D
+-        m_legacyReporter->StartSection( sectionInfo.name, sectionInfo.des=
cription );=0D
+-    }=0D
+-    void LegacyReporterAdapter::assertionStarting( AssertionInfo const& )=
 {=0D
+-        // Not on legacy interface=0D
+-    }=0D
+-=0D
+-    bool LegacyReporterAdapter::assertionEnded( AssertionStats const& ass=
ertionStats ) {=0D
+-        if( assertionStats.assertionResult.getResultType() !=3D ResultWas=
::Ok ) {=0D
+-            for( std::vector<MessageInfo>::const_iterator it =3D assertio=
nStats.infoMessages.begin(), itEnd =3D assertionStats.infoMessages.end();=0D
+-                    it !=3D itEnd;=0D
+-                    ++it ) {=0D
+-                if( it->type =3D=3D ResultWas::Info ) {=0D
+-                    ResultBuilder rb( it->macroName.c_str(), it->lineInfo=
, "", ResultDisposition::Normal );=0D
+-                    rb << it->message;=0D
+-                    rb.setResultType( ResultWas::Info );=0D
+-                    AssertionResult result =3D rb.build();=0D
+-                    m_legacyReporter->Result( result );=0D
+-                }=0D
+-            }=0D
+-        }=0D
+-        m_legacyReporter->Result( assertionStats.assertionResult );=0D
+-        return true;=0D
+-    }=0D
+-    void LegacyReporterAdapter::sectionEnded( SectionStats const& section=
Stats ) {=0D
+-        if( sectionStats.missingAssertions )=0D
+-            m_legacyReporter->NoAssertionsInSection( sectionStats.section=
Info.name );=0D
+-        m_legacyReporter->EndSection( sectionStats.sectionInfo.name, sect=
ionStats.assertions );=0D
+-    }=0D
+-    void LegacyReporterAdapter::testCaseEnded( TestCaseStats const& testC=
aseStats ) {=0D
+-        m_legacyReporter->EndTestCase=0D
+-            (   testCaseStats.testInfo,=0D
+-                testCaseStats.totals,=0D
+-                testCaseStats.stdOut,=0D
+-                testCaseStats.stdErr );=0D
+-    }=0D
+-    void LegacyReporterAdapter::testGroupEnded( TestGroupStats const& tes=
tGroupStats ) {=0D
+-        if( testGroupStats.aborting )=0D
+-            m_legacyReporter->Aborted();=0D
+-        m_legacyReporter->EndGroup( testGroupStats.groupInfo.name, testGr=
oupStats.totals );=0D
+-    }=0D
+-    void LegacyReporterAdapter::testRunEnded( TestRunStats const& testRun=
Stats ) {=0D
+-        m_legacyReporter->EndTesting( testRunStats.totals );=0D
+-    }=0D
+-    void LegacyReporterAdapter::skipTest( TestCaseInfo const& ) {=0D
+-    }=0D
+-}=0D
+-=0D
+-// #included from: catch_timer.hpp=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic push=0D
+-#pragma clang diagnostic ignored "-Wc++11-long-long"=0D
+-#endif=0D
+-=0D
+-#ifdef CATCH_PLATFORM_WINDOWS=0D
+-#else=0D
+-#include <sys/time.h>=0D
+-#endif=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    namespace {=0D
+-#ifdef CATCH_PLATFORM_WINDOWS=0D
+-        uint64_t getCurrentTicks() {=0D
+-            static uint64_t hz=3D0, hzo=3D0;=0D
+-            if (!hz) {=0D
+-                QueryPerformanceFrequency( reinterpret_cast<LARGE_INTEGER=
*>( &hz ) );=0D
+-                QueryPerformanceCounter( reinterpret_cast<LARGE_INTEGER*>=
( &hzo ) );=0D
+-            }=0D
+-            uint64_t t;=0D
+-            QueryPerformanceCounter( reinterpret_cast<LARGE_INTEGER*>( &t=
 ) );=0D
+-            return ((t-hzo)*1000000)/hz;=0D
+-        }=0D
+-#else=0D
+-        uint64_t getCurrentTicks() {=0D
+-            timeval t;=0D
+-            gettimeofday(&t,CATCH_NULL);=0D
+-            return static_cast<uint64_t>( t.tv_sec ) * 1000000ull + stati=
c_cast<uint64_t>( t.tv_usec );=0D
+-        }=0D
+-#endif=0D
+-    }=0D
+-=0D
+-    void Timer::start() {=0D
+-        m_ticks =3D getCurrentTicks();=0D
+-    }=0D
+-    unsigned int Timer::getElapsedMicroseconds() const {=0D
+-        return static_cast<unsigned int>(getCurrentTicks() - m_ticks);=0D
+-    }=0D
+-    unsigned int Timer::getElapsedMilliseconds() const {=0D
+-        return static_cast<unsigned int>(getElapsedMicroseconds()/1000);=
=0D
+-    }=0D
+-    double Timer::getElapsedSeconds() const {=0D
+-        return getElapsedMicroseconds()/1000000.0;=0D
+-    }=0D
+-=0D
+-} // namespace Catch=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic pop=0D
+-#endif=0D
+-// #included from: catch_common.hpp=0D
+-#define TWOBLUECUBES_CATCH_COMMON_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    bool startsWith( std::string const& s, std::string const& prefix ) {=
=0D
+-        return s.size() >=3D prefix.size() && s.substr( 0, prefix.size() =
) =3D=3D prefix;=0D
+-    }=0D
+-    bool endsWith( std::string const& s, std::string const& suffix ) {=0D
+-        return s.size() >=3D suffix.size() && s.substr( s.size()-suffix.s=
ize(), suffix.size() ) =3D=3D suffix;=0D
+-    }=0D
+-    bool contains( std::string const& s, std::string const& infix ) {=0D
+-        return s.find( infix ) !=3D std::string::npos;=0D
+-    }=0D
+-    char toLowerCh(char c) {=0D
+-        return static_cast<char>( ::tolower( c ) );=0D
+-    }=0D
+-    void toLowerInPlace( std::string& s ) {=0D
+-        std::transform( s.begin(), s.end(), s.begin(), toLowerCh );=0D
+-    }=0D
+-    std::string toLower( std::string const& s ) {=0D
+-        std::string lc =3D s;=0D
+-        toLowerInPlace( lc );=0D
+-        return lc;=0D
+-    }=0D
+-    std::string trim( std::string const& str ) {=0D
+-        static char const* whitespaceChars =3D "\n\r\t ";=0D
+-        std::string::size_type start =3D str.find_first_not_of( whitespac=
eChars );=0D
+-        std::string::size_type end =3D str.find_last_not_of( whitespaceCh=
ars );=0D
+-=0D
+-        return start !=3D std::string::npos ? str.substr( start, 1+end-st=
art ) : "";=0D
+-    }=0D
+-=0D
+-    bool replaceInPlace( std::string& str, std::string const& replaceThis=
, std::string const& withThis ) {=0D
+-        bool replaced =3D false;=0D
+-        std::size_t i =3D str.find( replaceThis );=0D
+-        while( i !=3D std::string::npos ) {=0D
+-            replaced =3D true;=0D
+-            str =3D str.substr( 0, i ) + withThis + str.substr( i+replace=
This.size() );=0D
+-            if( i < str.size()-withThis.size() )=0D
+-                i =3D str.find( replaceThis, i+withThis.size() );=0D
+-            else=0D
+-                i =3D std::string::npos;=0D
+-        }=0D
+-        return replaced;=0D
+-    }=0D
+-=0D
+-    pluralise::pluralise( std::size_t count, std::string const& label )=0D
+-    :   m_count( count ),=0D
+-        m_label( label )=0D
+-    {}=0D
+-=0D
+-    std::ostream& operator << ( std::ostream& os, pluralise const& plural=
iser ) {=0D
+-        os << pluraliser.m_count << " " << pluraliser.m_label;=0D
+-        if( pluraliser.m_count !=3D 1 )=0D
+-            os << "s";=0D
+-        return os;=0D
+-    }=0D
+-=0D
+-    SourceLineInfo::SourceLineInfo() : line( 0 ){}=0D
+-    SourceLineInfo::SourceLineInfo( char const* _file, std::size_t _line =
)=0D
+-    :   file( _file ),=0D
+-        line( _line )=0D
+-    {}=0D
+-    SourceLineInfo::SourceLineInfo( SourceLineInfo const& other )=0D
+-    :   file( other.file ),=0D
+-        line( other.line )=0D
+-    {}=0D
+-    bool SourceLineInfo::empty() const {=0D
+-        return file.empty();=0D
+-    }=0D
+-    bool SourceLineInfo::operator =3D=3D ( SourceLineInfo const& other ) =
const {=0D
+-        return line =3D=3D other.line && file =3D=3D other.file;=0D
+-    }=0D
+-    bool SourceLineInfo::operator < ( SourceLineInfo const& other ) const=
 {=0D
+-        return line < other.line || ( line =3D=3D other.line  && file < o=
ther.file );=0D
+-    }=0D
+-=0D
+-    void seedRng( IConfig const& config ) {=0D
+-        if( config.rngSeed() !=3D 0 )=0D
+-            std::srand( config.rngSeed() );=0D
+-    }=0D
+-    unsigned int rngSeed() {=0D
+-        return getCurrentContext().getConfig()->rngSeed();=0D
+-    }=0D
+-=0D
+-    std::ostream& operator << ( std::ostream& os, SourceLineInfo const& i=
nfo ) {=0D
+-#ifndef __GNUG__=0D
+-        os << info.file << "(" << info.line << ")";=0D
+-#else=0D
+-        os << info.file << ":" << info.line;=0D
+-#endif=0D
+-        return os;=0D
+-    }=0D
+-=0D
+-    void throwLogicError( std::string const& message, SourceLineInfo cons=
t& locationInfo ) {=0D
+-        std::ostringstream oss;=0D
+-        oss << locationInfo << ": Internal Catch error: '" << message << =
"'";=0D
+-        if( alwaysTrue() )=0D
+-            throw std::logic_error( oss.str() );=0D
+-    }=0D
+-}=0D
+-=0D
+-// #included from: catch_section.hpp=0D
+-#define TWOBLUECUBES_CATCH_SECTION_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    SectionInfo::SectionInfo=0D
+-        (   SourceLineInfo const& _lineInfo,=0D
+-            std::string const& _name,=0D
+-            std::string const& _description )=0D
+-    :   name( _name ),=0D
+-        description( _description ),=0D
+-        lineInfo( _lineInfo )=0D
+-    {}=0D
+-=0D
+-    Section::Section( SectionInfo const& info )=0D
+-    :   m_info( info ),=0D
+-        m_sectionIncluded( getResultCapture().sectionStarted( m_info, m_a=
ssertions ) )=0D
+-    {=0D
+-        m_timer.start();=0D
+-    }=0D
+-=0D
+-    Section::~Section() {=0D
+-        if( m_sectionIncluded ) {=0D
+-            SectionEndInfo endInfo( m_info, m_assertions, m_timer.getElap=
sedSeconds() );=0D
+-            if( std::uncaught_exception() )=0D
+-                getResultCapture().sectionEndedEarly( endInfo );=0D
+-            else=0D
+-                getResultCapture().sectionEnded( endInfo );=0D
+-        }=0D
+-    }=0D
+-=0D
+-    // This indicates whether the section should be executed or not=0D
+-    Section::operator bool() const {=0D
+-        return m_sectionIncluded;=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_debugger.hpp=0D
+-#define TWOBLUECUBES_CATCH_DEBUGGER_HPP_INCLUDED=0D
+-=0D
+-#include <iostream>=0D
+-=0D
+-#ifdef CATCH_PLATFORM_MAC=0D
+-=0D
+-    #include <assert.h>=0D
+-    #include <stdbool.h>=0D
+-    #include <sys/types.h>=0D
+-    #include <unistd.h>=0D
+-    #include <sys/sysctl.h>=0D
+-=0D
+-    namespace Catch{=0D
+-=0D
+-        // The following function is taken directly from the following te=
chnical note:=0D
+-        // http://developer.apple.com/library/mac/#qa/qa2004/qa1361.html=
=0D
+-=0D
+-        // Returns true if the current process is being debugged (either=
=0D
+-        // running under the debugger or has a debugger attached post fac=
to).=0D
+-        bool isDebuggerActive(){=0D
+-=0D
+-            int                 mib[4];=0D
+-            struct kinfo_proc   info;=0D
+-            size_t              size;=0D
+-=0D
+-            // Initialize the flags so that, if sysctl fails for some biz=
arre=0D
+-            // reason, we get a predictable result.=0D
+-=0D
+-            info.kp_proc.p_flag =3D 0;=0D
+-=0D
+-            // Initialize mib, which tells sysctl the info we want, in th=
is case=0D
+-            // we're looking for information about a specific process ID.=
=0D
+-=0D
+-            mib[0] =3D CTL_KERN;=0D
+-            mib[1] =3D KERN_PROC;=0D
+-            mib[2] =3D KERN_PROC_PID;=0D
+-            mib[3] =3D getpid();=0D
+-=0D
+-            // Call sysctl.=0D
+-=0D
+-            size =3D sizeof(info);=0D
+-            if( sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, CAT=
CH_NULL, 0) !=3D 0 ) {=0D
+-                Catch::cerr() << "\n** Call to sysctl failed - unable to =
determine if debugger is active **\n" << std::endl;=0D
+-                return false;=0D
+-            }=0D
+-=0D
+-            // We're being debugged if the P_TRACED flag is set.=0D
+-=0D
+-            return ( (info.kp_proc.p_flag & P_TRACED) !=3D 0 );=0D
+-        }=0D
+-    } // namespace Catch=0D
+-=0D
+-#elif defined(CATCH_PLATFORM_LINUX)=0D
+-    #include <fstream>=0D
+-    #include <string>=0D
+-=0D
+-    namespace Catch{=0D
+-        // The standard POSIX way of detecting a debugger is to attempt t=
o=0D
+-        // ptrace() the process, but this needs to be done from a child a=
nd not=0D
+-        // this process itself to still allow attaching to this process l=
ater=0D
+-        // if wanted, so is rather heavy. Under Linux we have the PID of =
the=0D
+-        // "debugger" (which doesn't need to be gdb, of course, it could =
also=0D
+-        // be strace, for example) in /proc/$PID/status, so just get it f=
rom=0D
+-        // there instead.=0D
+-        bool isDebuggerActive(){=0D
+-            std::ifstream in("/proc/self/status");=0D
+-            for( std::string line; std::getline(in, line); ) {=0D
+-                static const int PREFIX_LEN =3D 11;=0D
+-                if( line.compare(0, PREFIX_LEN, "TracerPid:\t") =3D=3D 0 =
) {=0D
+-                    // We're traced if the PID is not 0 and no other PID =
starts=0D
+-                    // with 0 digit, so it's enough to check for just a s=
ingle=0D
+-                    // character.=0D
+-                    return line.length() > PREFIX_LEN && line[PREFIX_LEN]=
 !=3D '0';=0D
+-                }=0D
+-            }=0D
+-=0D
+-            return false;=0D
+-        }=0D
+-    } // namespace Catch=0D
+-#elif defined(_MSC_VER)=0D
+-    extern "C" __declspec(dllimport) int __stdcall IsDebuggerPresent();=0D
+-    namespace Catch {=0D
+-        bool isDebuggerActive() {=0D
+-            return IsDebuggerPresent() !=3D 0;=0D
+-        }=0D
+-    }=0D
+-#elif defined(__MINGW32__)=0D
+-    extern "C" __declspec(dllimport) int __stdcall IsDebuggerPresent();=0D
+-    namespace Catch {=0D
+-        bool isDebuggerActive() {=0D
+-            return IsDebuggerPresent() !=3D 0;=0D
+-        }=0D
+-    }=0D
+-#else=0D
+-    namespace Catch {=0D
+-       inline bool isDebuggerActive() { return false; }=0D
+-    }=0D
+-#endif // Platform=0D
+-=0D
+-#ifdef CATCH_PLATFORM_WINDOWS=0D
+-    extern "C" __declspec(dllimport) void __stdcall OutputDebugStringA( c=
onst char* );=0D
+-    namespace Catch {=0D
+-        void writeToDebugConsole( std::string const& text ) {=0D
+-            ::OutputDebugStringA( text.c_str() );=0D
+-        }=0D
+-    }=0D
+-#else=0D
+-    namespace Catch {=0D
+-        void writeToDebugConsole( std::string const& text ) {=0D
+-            // !TBD: Need a version for Mac/ XCode and other IDEs=0D
+-            Catch::cout() << text;=0D
+-        }=0D
+-    }=0D
+-#endif // Platform=0D
+-=0D
+-// #included from: catch_tostring.hpp=0D
+-#define TWOBLUECUBES_CATCH_TOSTRING_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-namespace Detail {=0D
+-=0D
+-    const std::string unprintableString =3D "{?}";=0D
+-=0D
+-    namespace {=0D
+-        const int hexThreshold =3D 255;=0D
+-=0D
+-        struct Endianness {=0D
+-            enum Arch { Big, Little };=0D
+-=0D
+-            static Arch which() {=0D
+-                union _{=0D
+-                    int asInt;=0D
+-                    char asChar[sizeof (int)];=0D
+-                } u;=0D
+-=0D
+-                u.asInt =3D 1;=0D
+-                return ( u.asChar[sizeof(int)-1] =3D=3D 1 ) ? Big : Littl=
e;=0D
+-            }=0D
+-        };=0D
+-    }=0D
+-=0D
+-    std::string rawMemoryToString( const void *object, std::size_t size )=
=0D
+-    {=0D
+-        // Reverse order for little endian architectures=0D
+-        int i =3D 0, end =3D static_cast<int>( size ), inc =3D 1;=0D
+-        if( Endianness::which() =3D=3D Endianness::Little ) {=0D
+-            i =3D end-1;=0D
+-            end =3D inc =3D -1;=0D
+-        }=0D
+-=0D
+-        unsigned char const *bytes =3D static_cast<unsigned char const *>=
(object);=0D
+-        std::ostringstream os;=0D
+-        os << "0x" << std::setfill('0') << std::hex;=0D
+-        for( ; i !=3D end; i +=3D inc )=0D
+-             os << std::setw(2) << static_cast<unsigned>(bytes[i]);=0D
+-       return os.str();=0D
+-    }=0D
+-}=0D
+-=0D
+-std::string toString( std::string const& value ) {=0D
+-    std::string s =3D value;=0D
+-    if( getCurrentContext().getConfig()->showInvisibles() ) {=0D
+-        for(size_t i =3D 0; i < s.size(); ++i ) {=0D
+-            std::string subs;=0D
+-            switch( s[i] ) {=0D
+-            case '\n': subs =3D "\\n"; break;=0D
+-            case '\t': subs =3D "\\t"; break;=0D
+-            default: break;=0D
+-            }=0D
+-            if( !subs.empty() ) {=0D
+-                s =3D s.substr( 0, i ) + subs + s.substr( i+1 );=0D
+-                ++i;=0D
+-            }=0D
+-        }=0D
+-    }=0D
+-    return "\"" + s + "\"";=0D
+-}=0D
+-std::string toString( std::wstring const& value ) {=0D
+-=0D
+-    std::string s;=0D
+-    s.reserve( value.size() );=0D
+-    for(size_t i =3D 0; i < value.size(); ++i )=0D
+-        s +=3D value[i] <=3D 0xff ? static_cast<char>( value[i] ) : '?';=
=0D
+-    return Catch::toString( s );=0D
+-}=0D
+-=0D
+-std::string toString( const char* const value ) {=0D
+-    return value ? Catch::toString( std::string( value ) ) : std::string(=
 "{null string}" );=0D
+-}=0D
+-=0D
+-std::string toString( char* const value ) {=0D
+-    return Catch::toString( static_cast<const char*>( value ) );=0D
+-}=0D
+-=0D
+-std::string toString( const wchar_t* const value )=0D
+-{=0D
+-	return value ? Catch::toString( std::wstring(value) ) : std::string( "{n=
ull string}" );=0D
+-}=0D
+-=0D
+-std::string toString( wchar_t* const value )=0D
+-{=0D
+-	return Catch::toString( static_cast<const wchar_t*>( value ) );=0D
+-}=0D
+-=0D
+-std::string toString( int value ) {=0D
+-    std::ostringstream oss;=0D
+-    oss << value;=0D
+-    if( value > Detail::hexThreshold )=0D
+-        oss << " (0x" << std::hex << value << ")";=0D
+-    return oss.str();=0D
+-}=0D
+-=0D
+-std::string toString( unsigned long value ) {=0D
+-    std::ostringstream oss;=0D
+-    oss << value;=0D
+-    if( value > Detail::hexThreshold )=0D
+-        oss << " (0x" << std::hex << value << ")";=0D
+-    return oss.str();=0D
+-}=0D
+-=0D
+-std::string toString( unsigned int value ) {=0D
+-    return Catch::toString( static_cast<unsigned long>( value ) );=0D
+-}=0D
+-=0D
+-template<typename T>=0D
+-std::string fpToString( T value, int precision ) {=0D
+-    std::ostringstream oss;=0D
+-    oss << std::setprecision( precision )=0D
+-        << std::fixed=0D
+-        << value;=0D
+-    std::string d =3D oss.str();=0D
+-    std::size_t i =3D d.find_last_not_of( '0' );=0D
+-    if( i !=3D std::string::npos && i !=3D d.size()-1 ) {=0D
+-        if( d[i] =3D=3D '.' )=0D
+-            i++;=0D
+-        d =3D d.substr( 0, i+1 );=0D
+-    }=0D
+-    return d;=0D
+-}=0D
+-=0D
+-std::string toString( const double value ) {=0D
+-    return fpToString( value, 10 );=0D
+-}=0D
+-std::string toString( const float value ) {=0D
+-    return fpToString( value, 5 ) + "f";=0D
+-}=0D
+-=0D
+-std::string toString( bool value ) {=0D
+-    return value ? "true" : "false";=0D
+-}=0D
+-=0D
+-std::string toString( char value ) {=0D
+-    return value < ' '=0D
+-        ? toString( static_cast<unsigned int>( value ) )=0D
+-        : Detail::makeString( value );=0D
+-}=0D
+-=0D
+-std::string toString( signed char value ) {=0D
+-    return toString( static_cast<char>( value ) );=0D
+-}=0D
+-=0D
+-std::string toString( unsigned char value ) {=0D
+-    return toString( static_cast<char>( value ) );=0D
+-}=0D
+-=0D
+-#ifdef CATCH_CONFIG_CPP11_LONG_LONG=0D
+-std::string toString( long long value ) {=0D
+-    std::ostringstream oss;=0D
+-    oss << value;=0D
+-    if( value > Detail::hexThreshold )=0D
+-        oss << " (0x" << std::hex << value << ")";=0D
+-    return oss.str();=0D
+-}=0D
+-std::string toString( unsigned long long value ) {=0D
+-    std::ostringstream oss;=0D
+-    oss << value;=0D
+-    if( value > Detail::hexThreshold )=0D
+-        oss << " (0x" << std::hex << value << ")";=0D
+-    return oss.str();=0D
+-}=0D
+-#endif=0D
+-=0D
+-#ifdef CATCH_CONFIG_CPP11_NULLPTR=0D
+-std::string toString( std::nullptr_t ) {=0D
+-    return "nullptr";=0D
+-}=0D
+-#endif=0D
+-=0D
+-#ifdef __OBJC__=0D
+-    std::string toString( NSString const * const& nsstring ) {=0D
+-        if( !nsstring )=0D
+-            return "nil";=0D
+-        return "@" + toString([nsstring UTF8String]);=0D
+-    }=0D
+-    std::string toString( NSString * CATCH_ARC_STRONG const& nsstring ) {=
=0D
+-        if( !nsstring )=0D
+-            return "nil";=0D
+-        return "@" + toString([nsstring UTF8String]);=0D
+-    }=0D
+-    std::string toString( NSObject* const& nsObject ) {=0D
+-        return toString( [nsObject description] );=0D
+-    }=0D
+-#endif=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_result_builder.hpp=0D
+-#define TWOBLUECUBES_CATCH_RESULT_BUILDER_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    std::string capturedExpressionWithSecondArgument( std::string const& =
capturedExpression, std::string const& secondArg ) {=0D
+-        return secondArg.empty() || secondArg =3D=3D "\"\""=0D
+-            ? capturedExpression=0D
+-            : capturedExpression + ", " + secondArg;=0D
+-    }=0D
+-    ResultBuilder::ResultBuilder(   char const* macroName,=0D
+-                                    SourceLineInfo const& lineInfo,=0D
+-                                    char const* capturedExpression,=0D
+-                                    ResultDisposition::Flags resultDispos=
ition,=0D
+-                                    char const* secondArg )=0D
+-    :   m_assertionInfo( macroName, lineInfo, capturedExpressionWithSecon=
dArgument( capturedExpression, secondArg ), resultDisposition ),=0D
+-        m_shouldDebugBreak( false ),=0D
+-        m_shouldThrow( false )=0D
+-    {}=0D
+-=0D
+-    ResultBuilder& ResultBuilder::setResultType( ResultWas::OfType result=
 ) {=0D
+-        m_data.resultType =3D result;=0D
+-        return *this;=0D
+-    }=0D
+-    ResultBuilder& ResultBuilder::setResultType( bool result ) {=0D
+-        m_data.resultType =3D result ? ResultWas::Ok : ResultWas::Express=
ionFailed;=0D
+-        return *this;=0D
+-    }=0D
+-    ResultBuilder& ResultBuilder::setLhs( std::string const& lhs ) {=0D
+-        m_exprComponents.lhs =3D lhs;=0D
+-        return *this;=0D
+-    }=0D
+-    ResultBuilder& ResultBuilder::setRhs( std::string const& rhs ) {=0D
+-        m_exprComponents.rhs =3D rhs;=0D
+-        return *this;=0D
+-    }=0D
+-    ResultBuilder& ResultBuilder::setOp( std::string const& op ) {=0D
+-        m_exprComponents.op =3D op;=0D
+-        return *this;=0D
+-    }=0D
+-=0D
+-    void ResultBuilder::endExpression() {=0D
+-        m_exprComponents.testFalse =3D isFalseTest( m_assertionInfo.resul=
tDisposition );=0D
+-        captureExpression();=0D
+-    }=0D
+-=0D
+-    void ResultBuilder::useActiveException( ResultDisposition::Flags resu=
ltDisposition ) {=0D
+-        m_assertionInfo.resultDisposition =3D resultDisposition;=0D
+-        m_stream.oss << Catch::translateActiveException();=0D
+-        captureResult( ResultWas::ThrewException );=0D
+-    }=0D
+-=0D
+-    void ResultBuilder::captureResult( ResultWas::OfType resultType ) {=0D
+-        setResultType( resultType );=0D
+-        captureExpression();=0D
+-    }=0D
+-    void ResultBuilder::captureExpectedException( std::string const& expe=
ctedMessage ) {=0D
+-        if( expectedMessage.empty() )=0D
+-            captureExpectedException( Matchers::Impl::Generic::AllOf<std:=
:string>() );=0D
+-        else=0D
+-            captureExpectedException( Matchers::Equals( expectedMessage )=
 );=0D
+-    }=0D
+-=0D
+-    void ResultBuilder::captureExpectedException( Matchers::Impl::Matcher=
<std::string> const& matcher ) {=0D
+-=0D
+-        assert( m_exprComponents.testFalse =3D=3D false );=0D
+-        AssertionResultData data =3D m_data;=0D
+-        data.resultType =3D ResultWas::Ok;=0D
+-        data.reconstructedExpression =3D m_assertionInfo.capturedExpressi=
on;=0D
+-=0D
+-        std::string actualMessage =3D Catch::translateActiveException();=
=0D
+-        if( !matcher.match( actualMessage ) ) {=0D
+-            data.resultType =3D ResultWas::ExpressionFailed;=0D
+-            data.reconstructedExpression =3D actualMessage;=0D
+-        }=0D
+-        AssertionResult result( m_assertionInfo, data );=0D
+-        handleResult( result );=0D
+-    }=0D
+-=0D
+-    void ResultBuilder::captureExpression() {=0D
+-        AssertionResult result =3D build();=0D
+-        handleResult( result );=0D
+-    }=0D
+-    void ResultBuilder::handleResult( AssertionResult const& result )=0D
+-    {=0D
+-        getResultCapture().assertionEnded( result );=0D
+-=0D
+-        if( !result.isOk() ) {=0D
+-            if( getCurrentContext().getConfig()->shouldDebugBreak() )=0D
+-                m_shouldDebugBreak =3D true;=0D
+-            if( getCurrentContext().getRunner()->aborting() || (m_asserti=
onInfo.resultDisposition & ResultDisposition::Normal) )=0D
+-                m_shouldThrow =3D true;=0D
+-        }=0D
+-    }=0D
+-    void ResultBuilder::react() {=0D
+-        if( m_shouldThrow )=0D
+-            throw Catch::TestFailureException();=0D
+-    }=0D
+-=0D
+-    bool ResultBuilder::shouldDebugBreak() const { return m_shouldDebugBr=
eak; }=0D
+-    bool ResultBuilder::allowThrows() const { return getCurrentContext().=
getConfig()->allowThrows(); }=0D
+-=0D
+-    AssertionResult ResultBuilder::build() const=0D
+-    {=0D
+-        assert( m_data.resultType !=3D ResultWas::Unknown );=0D
+-=0D
+-        AssertionResultData data =3D m_data;=0D
+-=0D
+-        // Flip bool results if testFalse is set=0D
+-        if( m_exprComponents.testFalse ) {=0D
+-            if( data.resultType =3D=3D ResultWas::Ok )=0D
+-                data.resultType =3D ResultWas::ExpressionFailed;=0D
+-            else if( data.resultType =3D=3D ResultWas::ExpressionFailed )=
=0D
+-                data.resultType =3D ResultWas::Ok;=0D
+-        }=0D
+-=0D
+-        data.message =3D m_stream.oss.str();=0D
+-        data.reconstructedExpression =3D reconstructExpression();=0D
+-        if( m_exprComponents.testFalse ) {=0D
+-            if( m_exprComponents.op =3D=3D "" )=0D
+-                data.reconstructedExpression =3D "!" + data.reconstructed=
Expression;=0D
+-            else=0D
+-                data.reconstructedExpression =3D "!(" + data.reconstructe=
dExpression + ")";=0D
+-        }=0D
+-        return AssertionResult( m_assertionInfo, data );=0D
+-    }=0D
+-    std::string ResultBuilder::reconstructExpression() const {=0D
+-        if( m_exprComponents.op =3D=3D "" )=0D
+-            return m_exprComponents.lhs.empty() ? m_assertionInfo.capture=
dExpression : m_exprComponents.lhs;=0D
+-        else if( m_exprComponents.op =3D=3D "matches" )=0D
+-            return m_exprComponents.lhs + " " + m_exprComponents.rhs;=0D
+-        else if( m_exprComponents.op !=3D "!" ) {=0D
+-            if( m_exprComponents.lhs.size() + m_exprComponents.rhs.size()=
 < 40 &&=0D
+-                m_exprComponents.lhs.find("\n") =3D=3D std::string::npos =
&&=0D
+-                m_exprComponents.rhs.find("\n") =3D=3D std::string::npos =
)=0D
+-                return m_exprComponents.lhs + " " + m_exprComponents.op +=
 " " + m_exprComponents.rhs;=0D
+-            else=0D
+-                return m_exprComponents.lhs + "\n" + m_exprComponents.op =
+ "\n" + m_exprComponents.rhs;=0D
+-        }=0D
+-        else=0D
+-            return "{can't expand - use " + m_assertionInfo.macroName + "=
_FALSE( " + m_assertionInfo.capturedExpression.substr(1) + " ) instead of "=
 + m_assertionInfo.macroName + "( " + m_assertionInfo.capturedExpression + =
" ) for better diagnostics}";=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: catch_tag_alias_registry.hpp=0D
+-#define TWOBLUECUBES_CATCH_TAG_ALIAS_REGISTRY_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_tag_alias_registry.h=0D
+-#define TWOBLUECUBES_CATCH_TAG_ALIAS_REGISTRY_H_INCLUDED=0D
+-=0D
+-#include <map>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class TagAliasRegistry : public ITagAliasRegistry {=0D
+-    public:=0D
+-        virtual ~TagAliasRegistry();=0D
+-        virtual Option<TagAlias> find( std::string const& alias ) const;=
=0D
+-        virtual std::string expandAliases( std::string const& unexpandedT=
estSpec ) const;=0D
+-        void add( char const* alias, char const* tag, SourceLineInfo cons=
t& lineInfo );=0D
+-        static TagAliasRegistry& get();=0D
+-=0D
+-    private:=0D
+-        std::map<std::string, TagAlias> m_registry;=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-#include <map>=0D
+-#include <iostream>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    TagAliasRegistry::~TagAliasRegistry() {}=0D
+-=0D
+-    Option<TagAlias> TagAliasRegistry::find( std::string const& alias ) c=
onst {=0D
+-        std::map<std::string, TagAlias>::const_iterator it =3D m_registry=
.find( alias );=0D
+-        if( it !=3D m_registry.end() )=0D
+-            return it->second;=0D
+-        else=0D
+-            return Option<TagAlias>();=0D
+-    }=0D
+-=0D
+-    std::string TagAliasRegistry::expandAliases( std::string const& unexp=
andedTestSpec ) const {=0D
+-        std::string expandedTestSpec =3D unexpandedTestSpec;=0D
+-        for( std::map<std::string, TagAlias>::const_iterator it =3D m_reg=
istry.begin(), itEnd =3D m_registry.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it ) {=0D
+-            std::size_t pos =3D expandedTestSpec.find( it->first );=0D
+-            if( pos !=3D std::string::npos ) {=0D
+-                expandedTestSpec =3D  expandedTestSpec.substr( 0, pos ) +=
=0D
+-                                    it->second.tag +=0D
+-                                    expandedTestSpec.substr( pos + it->fi=
rst.size() );=0D
+-            }=0D
+-        }=0D
+-        return expandedTestSpec;=0D
+-    }=0D
+-=0D
+-    void TagAliasRegistry::add( char const* alias, char const* tag, Sourc=
eLineInfo const& lineInfo ) {=0D
+-=0D
+-        if( !startsWith( alias, "[@" ) || !endsWith( alias, "]" ) ) {=0D
+-            std::ostringstream oss;=0D
+-            oss << "error: tag alias, \"" << alias << "\" is not of the f=
orm [@alias name].\n" << lineInfo;=0D
+-            throw std::domain_error( oss.str().c_str() );=0D
+-        }=0D
+-        if( !m_registry.insert( std::make_pair( alias, TagAlias( tag, lin=
eInfo ) ) ).second ) {=0D
+-            std::ostringstream oss;=0D
+-            oss << "error: tag alias, \"" << alias << "\" already registe=
red.\n"=0D
+-                << "\tFirst seen at " << find(alias)->lineInfo << "\n"=0D
+-                << "\tRedefined at " << lineInfo;=0D
+-            throw std::domain_error( oss.str().c_str() );=0D
+-        }=0D
+-    }=0D
+-=0D
+-    TagAliasRegistry& TagAliasRegistry::get() {=0D
+-        static TagAliasRegistry instance;=0D
+-        return instance;=0D
+-=0D
+-    }=0D
+-=0D
+-    ITagAliasRegistry::~ITagAliasRegistry() {}=0D
+-    ITagAliasRegistry const& ITagAliasRegistry::get() { return TagAliasRe=
gistry::get(); }=0D
+-=0D
+-    RegistrarForTagAliases::RegistrarForTagAliases( char const* alias, ch=
ar const* tag, SourceLineInfo const& lineInfo ) {=0D
+-        try {=0D
+-            TagAliasRegistry::get().add( alias, tag, lineInfo );=0D
+-        }=0D
+-        catch( std::exception& ex ) {=0D
+-            Colour colourGuard( Colour::Red );=0D
+-            Catch::cerr() << ex.what() << std::endl;=0D
+-            exit(1);=0D
+-        }=0D
+-    }=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: ../reporters/catch_reporter_multi.hpp=0D
+-#define TWOBLUECUBES_CATCH_REPORTER_MULTI_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-class MultipleReporters : public SharedImpl<IStreamingReporter> {=0D
+-    typedef std::vector<Ptr<IStreamingReporter> > Reporters;=0D
+-    Reporters m_reporters;=0D
+-=0D
+-public:=0D
+-    void add( Ptr<IStreamingReporter> const& reporter ) {=0D
+-        m_reporters.push_back( reporter );=0D
+-    }=0D
+-=0D
+-public: // IStreamingReporter=0D
+-=0D
+-    virtual ReporterPreferences getPreferences() const CATCH_OVERRIDE {=0D
+-        return m_reporters[0]->getPreferences();=0D
+-    }=0D
+-=0D
+-    virtual void noMatchingTestCases( std::string const& spec ) CATCH_OVE=
RRIDE {=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->noMatchingTestCases( spec );=0D
+-    }=0D
+-=0D
+-    virtual void testRunStarting( TestRunInfo const& testRunInfo ) CATCH_=
OVERRIDE {=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->testRunStarting( testRunInfo );=0D
+-    }=0D
+-=0D
+-    virtual void testGroupStarting( GroupInfo const& groupInfo ) CATCH_OV=
ERRIDE {=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->testGroupStarting( groupInfo );=0D
+-    }=0D
+-=0D
+-    virtual void testCaseStarting( TestCaseInfo const& testInfo ) CATCH_O=
VERRIDE {=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->testCaseStarting( testInfo );=0D
+-    }=0D
+-=0D
+-    virtual void sectionStarting( SectionInfo const& sectionInfo ) CATCH_=
OVERRIDE {=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->sectionStarting( sectionInfo );=0D
+-    }=0D
+-=0D
+-    virtual void assertionStarting( AssertionInfo const& assertionInfo ) =
CATCH_OVERRIDE {=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->assertionStarting( assertionInfo );=0D
+-    }=0D
+-=0D
+-    // The return value indicates if the messages buffer should be cleare=
d:=0D
+-    virtual bool assertionEnded( AssertionStats const& assertionStats ) C=
ATCH_OVERRIDE {=0D
+-        bool clearBuffer =3D false;=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            clearBuffer |=3D (*it)->assertionEnded( assertionStats );=0D
+-        return clearBuffer;=0D
+-    }=0D
+-=0D
+-    virtual void sectionEnded( SectionStats const& sectionStats ) CATCH_O=
VERRIDE {=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->sectionEnded( sectionStats );=0D
+-    }=0D
+-=0D
+-    virtual void testCaseEnded( TestCaseStats const& testCaseStats ) CATC=
H_OVERRIDE {=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->testCaseEnded( testCaseStats );=0D
+-    }=0D
+-=0D
+-    virtual void testGroupEnded( TestGroupStats const& testGroupStats ) C=
ATCH_OVERRIDE {=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->testGroupEnded( testGroupStats );=0D
+-    }=0D
+-=0D
+-    virtual void testRunEnded( TestRunStats const& testRunStats ) CATCH_O=
VERRIDE {=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->testRunEnded( testRunStats );=0D
+-    }=0D
+-=0D
+-    virtual void skipTest( TestCaseInfo const& testInfo ) CATCH_OVERRIDE =
{=0D
+-        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();=0D
+-                it !=3D itEnd;=0D
+-                ++it )=0D
+-            (*it)->skipTest( testInfo );=0D
+-    }=0D
+-=0D
+-    virtual MultipleReporters* tryAsMulti() CATCH_OVERRIDE {=0D
+-        return this;=0D
+-    }=0D
+-=0D
+-};=0D
+-=0D
+-Ptr<IStreamingReporter> addReporter( Ptr<IStreamingReporter> const& exist=
ingReporter, Ptr<IStreamingReporter> const& additionalReporter ) {=0D
+-    Ptr<IStreamingReporter> resultingReporter;=0D
+-=0D
+-    if( existingReporter ) {=0D
+-        MultipleReporters* multi =3D existingReporter->tryAsMulti();=0D
+-        if( !multi ) {=0D
+-            multi =3D new MultipleReporters;=0D
+-            resultingReporter =3D Ptr<IStreamingReporter>( multi );=0D
+-            if( existingReporter )=0D
+-                multi->add( existingReporter );=0D
+-        }=0D
+-        else=0D
+-            resultingReporter =3D existingReporter;=0D
+-        multi->add( additionalReporter );=0D
+-    }=0D
+-    else=0D
+-        resultingReporter =3D additionalReporter;=0D
+-=0D
+-    return resultingReporter;=0D
+-}=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: ../reporters/catch_reporter_xml.hpp=0D
+-#define TWOBLUECUBES_CATCH_REPORTER_XML_HPP_INCLUDED=0D
+-=0D
+-// #included from: catch_reporter_bases.hpp=0D
+-#define TWOBLUECUBES_CATCH_REPORTER_BASES_HPP_INCLUDED=0D
+-=0D
+-#include <cstring>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct StreamingReporterBase : SharedImpl<IStreamingReporter> {=0D
+-=0D
+-        StreamingReporterBase( ReporterConfig const& _config )=0D
+-        :   m_config( _config.fullConfig() ),=0D
+-            stream( _config.stream() )=0D
+-        {=0D
+-            m_reporterPrefs.shouldRedirectStdOut =3D false;=0D
+-        }=0D
+-=0D
+-        virtual ReporterPreferences getPreferences() const CATCH_OVERRIDE=
 {=0D
+-            return m_reporterPrefs;=0D
+-        }=0D
+-=0D
+-        virtual ~StreamingReporterBase() CATCH_OVERRIDE;=0D
+-=0D
+-        virtual void noMatchingTestCases( std::string const& ) CATCH_OVER=
RIDE {}=0D
+-=0D
+-        virtual void testRunStarting( TestRunInfo const& _testRunInfo ) C=
ATCH_OVERRIDE {=0D
+-            currentTestRunInfo =3D _testRunInfo;=0D
+-        }=0D
+-        virtual void testGroupStarting( GroupInfo const& _groupInfo ) CAT=
CH_OVERRIDE {=0D
+-            currentGroupInfo =3D _groupInfo;=0D
+-        }=0D
+-=0D
+-        virtual void testCaseStarting( TestCaseInfo const& _testInfo ) CA=
TCH_OVERRIDE {=0D
+-            currentTestCaseInfo =3D _testInfo;=0D
+-        }=0D
+-        virtual void sectionStarting( SectionInfo const& _sectionInfo ) C=
ATCH_OVERRIDE {=0D
+-            m_sectionStack.push_back( _sectionInfo );=0D
+-        }=0D
+-=0D
+-        virtual void sectionEnded( SectionStats const& /* _sectionStats *=
/ ) CATCH_OVERRIDE {=0D
+-            m_sectionStack.pop_back();=0D
+-        }=0D
+-        virtual void testCaseEnded( TestCaseStats const& /* _testCaseStat=
s */ ) CATCH_OVERRIDE {=0D
+-            currentTestCaseInfo.reset();=0D
+-        }=0D
+-        virtual void testGroupEnded( TestGroupStats const& /* _testGroupS=
tats */ ) CATCH_OVERRIDE {=0D
+-            currentGroupInfo.reset();=0D
+-        }=0D
+-        virtual void testRunEnded( TestRunStats const& /* _testRunStats *=
/ ) CATCH_OVERRIDE {=0D
+-            currentTestCaseInfo.reset();=0D
+-            currentGroupInfo.reset();=0D
+-            currentTestRunInfo.reset();=0D
+-        }=0D
+-=0D
+-        virtual void skipTest( TestCaseInfo const& ) CATCH_OVERRIDE {=0D
+-            // Don't do anything with this by default.=0D
+-            // It can optionally be overridden in the derived class.=0D
+-        }=0D
+-=0D
+-        Ptr<IConfig const> m_config;=0D
+-        std::ostream& stream;=0D
+-=0D
+-        LazyStat<TestRunInfo> currentTestRunInfo;=0D
+-        LazyStat<GroupInfo> currentGroupInfo;=0D
+-        LazyStat<TestCaseInfo> currentTestCaseInfo;=0D
+-=0D
+-        std::vector<SectionInfo> m_sectionStack;=0D
+-        ReporterPreferences m_reporterPrefs;=0D
+-    };=0D
+-=0D
+-    struct CumulativeReporterBase : SharedImpl<IStreamingReporter> {=0D
+-        template<typename T, typename ChildNodeT>=0D
+-        struct Node : SharedImpl<> {=0D
+-            explicit Node( T const& _value ) : value( _value ) {}=0D
+-            virtual ~Node() {}=0D
+-=0D
+-            typedef std::vector<Ptr<ChildNodeT> > ChildNodes;=0D
+-            T value;=0D
+-            ChildNodes children;=0D
+-        };=0D
+-        struct SectionNode : SharedImpl<> {=0D
+-            explicit SectionNode( SectionStats const& _stats ) : stats( _=
stats ) {}=0D
+-            virtual ~SectionNode();=0D
+-=0D
+-            bool operator =3D=3D ( SectionNode const& other ) const {=0D
+-                return stats.sectionInfo.lineInfo =3D=3D other.stats.sect=
ionInfo.lineInfo;=0D
+-            }=0D
+-            bool operator =3D=3D ( Ptr<SectionNode> const& other ) const =
{=0D
+-                return operator=3D=3D( *other );=0D
+-            }=0D
+-=0D
+-            SectionStats stats;=0D
+-            typedef std::vector<Ptr<SectionNode> > ChildSections;=0D
+-            typedef std::vector<AssertionStats> Assertions;=0D
+-            ChildSections childSections;=0D
+-            Assertions assertions;=0D
+-            std::string stdOut;=0D
+-            std::string stdErr;=0D
+-        };=0D
+-=0D
+-        struct BySectionInfo {=0D
+-            BySectionInfo( SectionInfo const& other ) : m_other( other ) =
{}=0D
+-			BySectionInfo( BySectionInfo const& other ) : m_other( other.m_other )=
 {}=0D
+-            bool operator() ( Ptr<SectionNode> const& node ) const {=0D
+-                return node->stats.sectionInfo.lineInfo =3D=3D m_other.li=
neInfo;=0D
+-            }=0D
+-        private:=0D
+-			void operator=3D( BySectionInfo const& );=0D
+-            SectionInfo const& m_other;=0D
+-        };=0D
+-=0D
+-        typedef Node<TestCaseStats, SectionNode> TestCaseNode;=0D
+-        typedef Node<TestGroupStats, TestCaseNode> TestGroupNode;=0D
+-        typedef Node<TestRunStats, TestGroupNode> TestRunNode;=0D
+-=0D
+-        CumulativeReporterBase( ReporterConfig const& _config )=0D
+-        :   m_config( _config.fullConfig() ),=0D
+-            stream( _config.stream() )=0D
+-        {=0D
+-            m_reporterPrefs.shouldRedirectStdOut =3D false;=0D
+-        }=0D
+-        ~CumulativeReporterBase();=0D
+-=0D
+-        virtual ReporterPreferences getPreferences() const CATCH_OVERRIDE=
 {=0D
+-            return m_reporterPrefs;=0D
+-        }=0D
+-=0D
+-        virtual void testRunStarting( TestRunInfo const& ) CATCH_OVERRIDE=
 {}=0D
+-        virtual void testGroupStarting( GroupInfo const& ) CATCH_OVERRIDE=
 {}=0D
+-=0D
+-        virtual void testCaseStarting( TestCaseInfo const& ) CATCH_OVERRI=
DE {}=0D
+-=0D
+-        virtual void sectionStarting( SectionInfo const& sectionInfo ) CA=
TCH_OVERRIDE {=0D
+-            SectionStats incompleteStats( sectionInfo, Counts(), 0, false=
 );=0D
+-            Ptr<SectionNode> node;=0D
+-            if( m_sectionStack.empty() ) {=0D
+-                if( !m_rootSection )=0D
+-                    m_rootSection =3D new SectionNode( incompleteStats );=
=0D
+-                node =3D m_rootSection;=0D
+-            }=0D
+-            else {=0D
+-                SectionNode& parentNode =3D *m_sectionStack.back();=0D
+-                SectionNode::ChildSections::const_iterator it =3D=0D
+-                    std::find_if(   parentNode.childSections.begin(),=0D
+-                                    parentNode.childSections.end(),=0D
+-                                    BySectionInfo( sectionInfo ) );=0D
+-                if( it =3D=3D parentNode.childSections.end() ) {=0D
+-                    node =3D new SectionNode( incompleteStats );=0D
+-                    parentNode.childSections.push_back( node );=0D
+-                }=0D
+-                else=0D
+-                    node =3D *it;=0D
+-            }=0D
+-            m_sectionStack.push_back( node );=0D
+-            m_deepestSection =3D node;=0D
+-        }=0D
+-=0D
+-        virtual void assertionStarting( AssertionInfo const& ) CATCH_OVER=
RIDE {}=0D
+-=0D
+-        virtual bool assertionEnded( AssertionStats const& assertionStats=
 ) CATCH_OVERRIDE {=0D
+-            assert( !m_sectionStack.empty() );=0D
+-            SectionNode& sectionNode =3D *m_sectionStack.back();=0D
+-            sectionNode.assertions.push_back( assertionStats );=0D
+-            return true;=0D
+-        }=0D
+-        virtual void sectionEnded( SectionStats const& sectionStats ) CAT=
CH_OVERRIDE {=0D
+-            assert( !m_sectionStack.empty() );=0D
+-            SectionNode& node =3D *m_sectionStack.back();=0D
+-            node.stats =3D sectionStats;=0D
+-            m_sectionStack.pop_back();=0D
+-        }=0D
+-        virtual void testCaseEnded( TestCaseStats const& testCaseStats ) =
CATCH_OVERRIDE {=0D
+-            Ptr<TestCaseNode> node =3D new TestCaseNode( testCaseStats );=
=0D
+-            assert( m_sectionStack.size() =3D=3D 0 );=0D
+-            node->children.push_back( m_rootSection );=0D
+-            m_testCases.push_back( node );=0D
+-            m_rootSection.reset();=0D
+-=0D
+-            assert( m_deepestSection );=0D
+-            m_deepestSection->stdOut =3D testCaseStats.stdOut;=0D
+-            m_deepestSection->stdErr =3D testCaseStats.stdErr;=0D
+-        }=0D
+-        virtual void testGroupEnded( TestGroupStats const& testGroupStats=
 ) CATCH_OVERRIDE {=0D
+-            Ptr<TestGroupNode> node =3D new TestGroupNode( testGroupStats=
 );=0D
+-            node->children.swap( m_testCases );=0D
+-            m_testGroups.push_back( node );=0D
+-        }=0D
+-        virtual void testRunEnded( TestRunStats const& testRunStats ) CAT=
CH_OVERRIDE {=0D
+-            Ptr<TestRunNode> node =3D new TestRunNode( testRunStats );=0D
+-            node->children.swap( m_testGroups );=0D
+-            m_testRuns.push_back( node );=0D
+-            testRunEndedCumulative();=0D
+-        }=0D
+-        virtual void testRunEndedCumulative() =3D 0;=0D
+-=0D
+-        virtual void skipTest( TestCaseInfo const& ) CATCH_OVERRIDE {}=0D
+-=0D
+-        Ptr<IConfig const> m_config;=0D
+-        std::ostream& stream;=0D
+-        std::vector<AssertionStats> m_assertions;=0D
+-        std::vector<std::vector<Ptr<SectionNode> > > m_sections;=0D
+-        std::vector<Ptr<TestCaseNode> > m_testCases;=0D
+-        std::vector<Ptr<TestGroupNode> > m_testGroups;=0D
+-=0D
+-        std::vector<Ptr<TestRunNode> > m_testRuns;=0D
+-=0D
+-        Ptr<SectionNode> m_rootSection;=0D
+-        Ptr<SectionNode> m_deepestSection;=0D
+-        std::vector<Ptr<SectionNode> > m_sectionStack;=0D
+-        ReporterPreferences m_reporterPrefs;=0D
+-=0D
+-    };=0D
+-=0D
+-    template<char C>=0D
+-    char const* getLineOfChars() {=0D
+-        static char line[CATCH_CONFIG_CONSOLE_WIDTH] =3D {0};=0D
+-        if( !*line ) {=0D
+-            memset( line, C, CATCH_CONFIG_CONSOLE_WIDTH-1 );=0D
+-            line[CATCH_CONFIG_CONSOLE_WIDTH-1] =3D 0;=0D
+-        }=0D
+-        return line;=0D
+-    }=0D
+-=0D
+-    struct TestEventListenerBase : StreamingReporterBase {=0D
+-        TestEventListenerBase( ReporterConfig const& _config )=0D
+-        :   StreamingReporterBase( _config )=0D
+-        {}=0D
+-=0D
+-        virtual void assertionStarting( AssertionInfo const& ) CATCH_OVER=
RIDE {}=0D
+-        virtual bool assertionEnded( AssertionStats const& ) CATCH_OVERRI=
DE {=0D
+-            return false;=0D
+-        }=0D
+-    };=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: ../internal/catch_reporter_registrars.hpp=0D
+-#define TWOBLUECUBES_CATCH_REPORTER_REGISTRARS_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    template<typename T>=0D
+-    class LegacyReporterRegistrar {=0D
+-=0D
+-        class ReporterFactory : public IReporterFactory {=0D
+-            virtual IStreamingReporter* create( ReporterConfig const& con=
fig ) const {=0D
+-                return new LegacyReporterAdapter( new T( config ) );=0D
+-            }=0D
+-=0D
+-            virtual std::string getDescription() const {=0D
+-                return T::getDescription();=0D
+-            }=0D
+-        };=0D
+-=0D
+-    public:=0D
+-=0D
+-        LegacyReporterRegistrar( std::string const& name ) {=0D
+-            getMutableRegistryHub().registerReporter( name, new ReporterF=
actory() );=0D
+-        }=0D
+-    };=0D
+-=0D
+-    template<typename T>=0D
+-    class ReporterRegistrar {=0D
+-=0D
+-        class ReporterFactory : public SharedImpl<IReporterFactory> {=0D
+-=0D
+-            // *** Please Note ***:=0D
+-            // - If you end up here looking at a compiler error because i=
t's trying to register=0D
+-            // your custom reporter class be aware that the native report=
er interface has changed=0D
+-            // to IStreamingReporter. The "legacy" interface, IReporter, =
is still supported via=0D
+-            // an adapter. Just use REGISTER_LEGACY_REPORTER to take adva=
ntage of the adapter.=0D
+-            // However please consider updating to the new interface as t=
he old one is now=0D
+-            // deprecated and will probably be removed quite soon!=0D
+-            // Please contact me via github if you have any questions at =
all about this.=0D
+-            // In fact, ideally, please contact me anyway to let me know =
you've hit this - as I have=0D
+-            // no idea who is actually using custom reporters at all (pos=
sibly no-one!).=0D
+-            // The new interface is designed to minimise exposure to inte=
rface changes in the future.=0D
+-            virtual IStreamingReporter* create( ReporterConfig const& con=
fig ) const {=0D
+-                return new T( config );=0D
+-            }=0D
+-=0D
+-            virtual std::string getDescription() const {=0D
+-                return T::getDescription();=0D
+-            }=0D
+-        };=0D
+-=0D
+-    public:=0D
+-=0D
+-        ReporterRegistrar( std::string const& name ) {=0D
+-            getMutableRegistryHub().registerReporter( name, new ReporterF=
actory() );=0D
+-        }=0D
+-    };=0D
+-=0D
+-    template<typename T>=0D
+-    class ListenerRegistrar {=0D
+-=0D
+-        class ListenerFactory : public SharedImpl<IReporterFactory> {=0D
+-=0D
+-            virtual IStreamingReporter* create( ReporterConfig const& con=
fig ) const {=0D
+-                return new T( config );=0D
+-            }=0D
+-            virtual std::string getDescription() const {=0D
+-                return "";=0D
+-            }=0D
+-        };=0D
+-=0D
+-    public:=0D
+-=0D
+-        ListenerRegistrar() {=0D
+-            getMutableRegistryHub().registerListener( new ListenerFactory=
() );=0D
+-        }=0D
+-    };=0D
+-}=0D
+-=0D
+-#define INTERNAL_CATCH_REGISTER_LEGACY_REPORTER( name, reporterType ) \=0D
+-    namespace{ Catch::LegacyReporterRegistrar<reporterType> catch_interna=
l_RegistrarFor##reporterType( name ); }=0D
+-=0D
+-#define INTERNAL_CATCH_REGISTER_REPORTER( name, reporterType ) \=0D
+-    namespace{ Catch::ReporterRegistrar<reporterType> catch_internal_Regi=
strarFor##reporterType( name ); }=0D
+-=0D
+-#define INTERNAL_CATCH_REGISTER_LISTENER( listenerType ) \=0D
+-    namespace{ Catch::ListenerRegistrar<listenerType> catch_internal_Regi=
strarFor##listenerType; }=0D
+-=0D
+-// #included from: ../internal/catch_xmlwriter.hpp=0D
+-#define TWOBLUECUBES_CATCH_XMLWRITER_HPP_INCLUDED=0D
+-=0D
+-#include <sstream>=0D
+-#include <string>=0D
+-#include <vector>=0D
+-#include <iomanip>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    class XmlEncode {=0D
+-    public:=0D
+-        enum ForWhat { ForTextNodes, ForAttributes };=0D
+-=0D
+-        XmlEncode( std::string const& str, ForWhat forWhat =3D ForTextNod=
es )=0D
+-        :   m_str( str ),=0D
+-            m_forWhat( forWhat )=0D
+-        {}=0D
+-=0D
+-        void encodeTo( std::ostream& os ) const {=0D
+-=0D
+-            // Apostrophe escaping not necessary if we always use " to wr=
ite attributes=0D
+-            // (see: http://www.w3.org/TR/xml/#syntax)=0D
+-=0D
+-            for( std::size_t i =3D 0; i < m_str.size(); ++ i ) {=0D
+-                char c =3D m_str[i];=0D
+-                switch( c ) {=0D
+-                    case '<':   os << "&lt;"; break;=0D
+-                    case '&':   os << "&amp;"; break;=0D
+-=0D
+-                    case '>':=0D
+-                        // See: http://www.w3.org/TR/xml/#syntax=0D
+-                        if( i > 2 && m_str[i-1] =3D=3D ']' && m_str[i-2] =
=3D=3D ']' )=0D
+-                            os << "&gt;";=0D
+-                        else=0D
+-                            os << c;=0D
+-                        break;=0D
+-=0D
+-                    case '\"':=0D
+-                        if( m_forWhat =3D=3D ForAttributes )=0D
+-                            os << "&quot;";=0D
+-                        else=0D
+-                            os << c;=0D
+-                        break;=0D
+-=0D
+-                    default:=0D
+-                        // Escape control chars - based on contribution b=
y @espenalb in PR #465 and=0D
+-                        // by @mrpi PR #588=0D
+-                        if ( ( c >=3D 0 && c < '\x09' ) || ( c > '\x0D' &=
& c < '\x20') || c=3D=3D'\x7F' )=0D
+-                            os << "&#x" << std::uppercase << std::hex << =
std::setfill('0') << std::setw(2) << static_cast<int>( c ) << ';';=0D
+-                        else=0D
+-                            os << c;=0D
+-                }=0D
+-            }=0D
+-        }=0D
+-=0D
+-        friend std::ostream& operator << ( std::ostream& os, XmlEncode co=
nst& xmlEncode ) {=0D
+-            xmlEncode.encodeTo( os );=0D
+-            return os;=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        std::string m_str;=0D
+-        ForWhat m_forWhat;=0D
+-    };=0D
+-=0D
+-    class XmlWriter {=0D
+-    public:=0D
+-=0D
+-        class ScopedElement {=0D
+-        public:=0D
+-            ScopedElement( XmlWriter* writer )=0D
+-            :   m_writer( writer )=0D
+-            {}=0D
+-=0D
+-            ScopedElement( ScopedElement const& other )=0D
+-            :   m_writer( other.m_writer ){=0D
+-                other.m_writer =3D CATCH_NULL;=0D
+-            }=0D
+-=0D
+-            ~ScopedElement() {=0D
+-                if( m_writer )=0D
+-                    m_writer->endElement();=0D
+-            }=0D
+-=0D
+-            ScopedElement& writeText( std::string const& text, bool inden=
t =3D true ) {=0D
+-                m_writer->writeText( text, indent );=0D
+-                return *this;=0D
+-            }=0D
+-=0D
+-            template<typename T>=0D
+-            ScopedElement& writeAttribute( std::string const& name, T con=
st& attribute ) {=0D
+-                m_writer->writeAttribute( name, attribute );=0D
+-                return *this;=0D
+-            }=0D
+-=0D
+-        private:=0D
+-            mutable XmlWriter* m_writer;=0D
+-        };=0D
+-=0D
+-        XmlWriter()=0D
+-        :   m_tagIsOpen( false ),=0D
+-            m_needsNewline( false ),=0D
+-            m_os( &Catch::cout() )=0D
+-        {=0D
+-            // We encode control characters, which requires=0D
+-            // XML 1.1=0D
+-            // see http://stackoverflow.com/questions/404107/why-are-cont=
rol-characters-illegal-in-xml-1-0=0D
+-            *m_os << "<?xml version=3D\"1.1\" encoding=3D\"UTF-8\"?>\n";=
=0D
+-        }=0D
+-=0D
+-        XmlWriter( std::ostream& os )=0D
+-        :   m_tagIsOpen( false ),=0D
+-            m_needsNewline( false ),=0D
+-            m_os( &os )=0D
+-        {=0D
+-            *m_os << "<?xml version=3D\"1.1\" encoding=3D\"UTF-8\"?>\n";=
=0D
+-        }=0D
+-=0D
+-        ~XmlWriter() {=0D
+-            while( !m_tags.empty() )=0D
+-                endElement();=0D
+-        }=0D
+-=0D
+-        XmlWriter& startElement( std::string const& name ) {=0D
+-            ensureTagClosed();=0D
+-            newlineIfNecessary();=0D
+-            stream() << m_indent << "<" << name;=0D
+-            m_tags.push_back( name );=0D
+-            m_indent +=3D "  ";=0D
+-            m_tagIsOpen =3D true;=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        ScopedElement scopedElement( std::string const& name ) {=0D
+-            ScopedElement scoped( this );=0D
+-            startElement( name );=0D
+-            return scoped;=0D
+-        }=0D
+-=0D
+-        XmlWriter& endElement() {=0D
+-            newlineIfNecessary();=0D
+-            m_indent =3D m_indent.substr( 0, m_indent.size()-2 );=0D
+-            if( m_tagIsOpen ) {=0D
+-                stream() << "/>\n";=0D
+-                m_tagIsOpen =3D false;=0D
+-            }=0D
+-            else {=0D
+-                stream() << m_indent << "</" << m_tags.back() << ">\n";=0D
+-            }=0D
+-            m_tags.pop_back();=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        XmlWriter& writeAttribute( std::string const& name, std::string c=
onst& attribute ) {=0D
+-            if( !name.empty() && !attribute.empty() )=0D
+-                stream() << " " << name << "=3D\"" << XmlEncode( attribut=
e, XmlEncode::ForAttributes ) << "\"";=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        XmlWriter& writeAttribute( std::string const& name, bool attribut=
e ) {=0D
+-            stream() << " " << name << "=3D\"" << ( attribute ? "true" : =
"false" ) << "\"";=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        template<typename T>=0D
+-        XmlWriter& writeAttribute( std::string const& name, T const& attr=
ibute ) {=0D
+-            std::ostringstream oss;=0D
+-            oss << attribute;=0D
+-            return writeAttribute( name, oss.str() );=0D
+-        }=0D
+-=0D
+-        XmlWriter& writeText( std::string const& text, bool indent =3D tr=
ue ) {=0D
+-            if( !text.empty() ){=0D
+-                bool tagWasOpen =3D m_tagIsOpen;=0D
+-                ensureTagClosed();=0D
+-                if( tagWasOpen && indent )=0D
+-                    stream() << m_indent;=0D
+-                stream() << XmlEncode( text );=0D
+-                m_needsNewline =3D true;=0D
+-            }=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        XmlWriter& writeComment( std::string const& text ) {=0D
+-            ensureTagClosed();=0D
+-            stream() << m_indent << "<!--" << text << "-->";=0D
+-            m_needsNewline =3D true;=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        XmlWriter& writeBlankLine() {=0D
+-            ensureTagClosed();=0D
+-            stream() << "\n";=0D
+-            return *this;=0D
+-        }=0D
+-=0D
+-        void setStream( std::ostream& os ) {=0D
+-            m_os =3D &os;=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        XmlWriter( XmlWriter const& );=0D
+-        void operator=3D( XmlWriter const& );=0D
+-=0D
+-        std::ostream& stream() {=0D
+-            return *m_os;=0D
+-        }=0D
+-=0D
+-        void ensureTagClosed() {=0D
+-            if( m_tagIsOpen ) {=0D
+-                stream() << ">\n";=0D
+-                m_tagIsOpen =3D false;=0D
+-            }=0D
+-        }=0D
+-=0D
+-        void newlineIfNecessary() {=0D
+-            if( m_needsNewline ) {=0D
+-                stream() << "\n";=0D
+-                m_needsNewline =3D false;=0D
+-            }=0D
+-        }=0D
+-=0D
+-        bool m_tagIsOpen;=0D
+-        bool m_needsNewline;=0D
+-        std::vector<std::string> m_tags;=0D
+-        std::string m_indent;=0D
+-        std::ostream* m_os;=0D
+-    };=0D
+-=0D
+-}=0D
+-// #included from: catch_reenable_warnings.h=0D
+-=0D
+-#define TWOBLUECUBES_CATCH_REENABLE_WARNINGS_H_INCLUDED=0D
+-=0D
+-#ifdef __clang__=0D
+-#    ifdef __ICC // icpc defines the __clang__ macro=0D
+-#        pragma warning(pop)=0D
+-#    else=0D
+-#        pragma clang diagnostic pop=0D
+-#    endif=0D
+-#elif defined __GNUC__=0D
+-#    pragma GCC diagnostic pop=0D
+-#endif=0D
+-=0D
+-=0D
+-namespace Catch {=0D
+-    class XmlReporter : public StreamingReporterBase {=0D
+-    public:=0D
+-        XmlReporter( ReporterConfig const& _config )=0D
+-        :   StreamingReporterBase( _config ),=0D
+-            m_xml(_config.stream()),=0D
+-            m_sectionDepth( 0 )=0D
+-        {=0D
+-            m_reporterPrefs.shouldRedirectStdOut =3D true;=0D
+-        }=0D
+-=0D
+-        virtual ~XmlReporter() CATCH_OVERRIDE;=0D
+-=0D
+-        static std::string getDescription() {=0D
+-            return "Reports test results as an XML document";=0D
+-        }=0D
+-=0D
+-    public: // StreamingReporterBase=0D
+-=0D
+-        virtual void noMatchingTestCases( std::string const& s ) CATCH_OV=
ERRIDE {=0D
+-            StreamingReporterBase::noMatchingTestCases( s );=0D
+-        }=0D
+-=0D
+-        virtual void testRunStarting( TestRunInfo const& testInfo ) CATCH=
_OVERRIDE {=0D
+-            StreamingReporterBase::testRunStarting( testInfo );=0D
+-            m_xml.startElement( "Catch" );=0D
+-            if( !m_config->name().empty() )=0D
+-                m_xml.writeAttribute( "name", m_config->name() );=0D
+-        }=0D
+-=0D
+-        virtual void testGroupStarting( GroupInfo const& groupInfo ) CATC=
H_OVERRIDE {=0D
+-            StreamingReporterBase::testGroupStarting( groupInfo );=0D
+-            m_xml.startElement( "Group" )=0D
+-                .writeAttribute( "name", groupInfo.name );=0D
+-        }=0D
+-=0D
+-        virtual void testCaseStarting( TestCaseInfo const& testInfo ) CAT=
CH_OVERRIDE {=0D
+-            StreamingReporterBase::testCaseStarting(testInfo);=0D
+-            m_xml.startElement( "TestCase" ).writeAttribute( "name", test=
Info.name );=0D
+-=0D
+-            if ( m_config->showDurations() =3D=3D ShowDurations::Always )=
=0D
+-                m_testCaseTimer.start();=0D
+-        }=0D
+-=0D
+-        virtual void sectionStarting( SectionInfo const& sectionInfo ) CA=
TCH_OVERRIDE {=0D
+-            StreamingReporterBase::sectionStarting( sectionInfo );=0D
+-            if( m_sectionDepth++ > 0 ) {=0D
+-                m_xml.startElement( "Section" )=0D
+-                    .writeAttribute( "name", trim( sectionInfo.name ) )=0D
+-                    .writeAttribute( "description", sectionInfo.descripti=
on );=0D
+-            }=0D
+-        }=0D
+-=0D
+-        virtual void assertionStarting( AssertionInfo const& ) CATCH_OVER=
RIDE { }=0D
+-=0D
+-        virtual bool assertionEnded( AssertionStats const& assertionStats=
 ) CATCH_OVERRIDE {=0D
+-            const AssertionResult& assertionResult =3D assertionStats.ass=
ertionResult;=0D
+-=0D
+-            // Print any info messages in <Info> tags.=0D
+-            if( assertionStats.assertionResult.getResultType() !=3D Resul=
tWas::Ok ) {=0D
+-                for( std::vector<MessageInfo>::const_iterator it =3D asse=
rtionStats.infoMessages.begin(), itEnd =3D assertionStats.infoMessages.end(=
);=0D
+-                        it !=3D itEnd;=0D
+-                        ++it ) {=0D
+-                    if( it->type =3D=3D ResultWas::Info ) {=0D
+-                        m_xml.scopedElement( "Info" )=0D
+-                            .writeText( it->message );=0D
+-                    } else if ( it->type =3D=3D ResultWas::Warning ) {=0D
+-                        m_xml.scopedElement( "Warning" )=0D
+-                            .writeText( it->message );=0D
+-                    }=0D
+-                }=0D
+-            }=0D
+-=0D
+-            // Drop out if result was successful but we're not printing t=
hem.=0D
+-            if( !m_config->includeSuccessfulResults() && isOk(assertionRe=
sult.getResultType()) )=0D
+-                return true;=0D
+-=0D
+-            // Print the expression if there is one.=0D
+-            if( assertionResult.hasExpression() ) {=0D
+-                m_xml.startElement( "Expression" )=0D
+-                    .writeAttribute( "success", assertionResult.succeeded=
() )=0D
+-					.writeAttribute( "type", assertionResult.getTestMacroName() )=0D
+-                    .writeAttribute( "filename", assertionResult.getSourc=
eInfo().file )=0D
+-                    .writeAttribute( "line", assertionResult.getSourceInf=
o().line );=0D
+-=0D
+-                m_xml.scopedElement( "Original" )=0D
+-                    .writeText( assertionResult.getExpression() );=0D
+-                m_xml.scopedElement( "Expanded" )=0D
+-                    .writeText( assertionResult.getExpandedExpression() )=
;=0D
+-            }=0D
+-=0D
+-            // And... Print a result applicable to each result type.=0D
+-            switch( assertionResult.getResultType() ) {=0D
+-                case ResultWas::ThrewException:=0D
+-                    m_xml.scopedElement( "Exception" )=0D
+-                        .writeAttribute( "filename", assertionResult.getS=
ourceInfo().file )=0D
+-                        .writeAttribute( "line", assertionResult.getSourc=
eInfo().line )=0D
+-                        .writeText( assertionResult.getMessage() );=0D
+-                    break;=0D
+-                case ResultWas::FatalErrorCondition:=0D
+-                    m_xml.scopedElement( "FatalErrorCondition" )=0D
+-                        .writeAttribute( "filename", assertionResult.getS=
ourceInfo().file )=0D
+-                        .writeAttribute( "line", assertionResult.getSourc=
eInfo().line )=0D
+-                        .writeText( assertionResult.getMessage() );=0D
+-                    break;=0D
+-                case ResultWas::Info:=0D
+-                    m_xml.scopedElement( "Info" )=0D
+-                        .writeText( assertionResult.getMessage() );=0D
+-                    break;=0D
+-                case ResultWas::Warning:=0D
+-                    // Warning will already have been written=0D
+-                    break;=0D
+-                case ResultWas::ExplicitFailure:=0D
+-                    m_xml.scopedElement( "Failure" )=0D
+-                        .writeText( assertionResult.getMessage() );=0D
+-                    break;=0D
+-                default:=0D
+-                    break;=0D
+-            }=0D
+-=0D
+-            if( assertionResult.hasExpression() )=0D
+-                m_xml.endElement();=0D
+-=0D
+-            return true;=0D
+-        }=0D
+-=0D
+-        virtual void sectionEnded( SectionStats const& sectionStats ) CAT=
CH_OVERRIDE {=0D
+-            StreamingReporterBase::sectionEnded( sectionStats );=0D
+-            if( --m_sectionDepth > 0 ) {=0D
+-                XmlWriter::ScopedElement e =3D m_xml.scopedElement( "Over=
allResults" );=0D
+-                e.writeAttribute( "successes", sectionStats.assertions.pa=
ssed );=0D
+-                e.writeAttribute( "failures", sectionStats.assertions.fai=
led );=0D
+-                e.writeAttribute( "expectedFailures", sectionStats.assert=
ions.failedButOk );=0D
+-=0D
+-                if ( m_config->showDurations() =3D=3D ShowDurations::Alwa=
ys )=0D
+-                    e.writeAttribute( "durationInSeconds", sectionStats.d=
urationInSeconds );=0D
+-=0D
+-                m_xml.endElement();=0D
+-            }=0D
+-        }=0D
+-=0D
+-        virtual void testCaseEnded( TestCaseStats const& testCaseStats ) =
CATCH_OVERRIDE {=0D
+-            StreamingReporterBase::testCaseEnded( testCaseStats );=0D
+-            XmlWriter::ScopedElement e =3D m_xml.scopedElement( "OverallR=
esult" );=0D
+-            e.writeAttribute( "success", testCaseStats.totals.assertions.=
allOk() );=0D
+-=0D
+-            if ( m_config->showDurations() =3D=3D ShowDurations::Always )=
=0D
+-                e.writeAttribute( "durationInSeconds", m_testCaseTimer.ge=
tElapsedSeconds() );=0D
+-=0D
+-            m_xml.endElement();=0D
+-        }=0D
+-=0D
+-        virtual void testGroupEnded( TestGroupStats const& testGroupStats=
 ) CATCH_OVERRIDE {=0D
+-            StreamingReporterBase::testGroupEnded( testGroupStats );=0D
+-            // TODO: Check testGroupStats.aborting and act accordingly.=0D
+-            m_xml.scopedElement( "OverallResults" )=0D
+-                .writeAttribute( "successes", testGroupStats.totals.asser=
tions.passed )=0D
+-                .writeAttribute( "failures", testGroupStats.totals.assert=
ions.failed )=0D
+-                .writeAttribute( "expectedFailures", testGroupStats.total=
s.assertions.failedButOk );=0D
+-            m_xml.endElement();=0D
+-        }=0D
+-=0D
+-        virtual void testRunEnded( TestRunStats const& testRunStats ) CAT=
CH_OVERRIDE {=0D
+-            StreamingReporterBase::testRunEnded( testRunStats );=0D
+-            m_xml.scopedElement( "OverallResults" )=0D
+-                .writeAttribute( "successes", testRunStats.totals.asserti=
ons.passed )=0D
+-                .writeAttribute( "failures", testRunStats.totals.assertio=
ns.failed )=0D
+-                .writeAttribute( "expectedFailures", testRunStats.totals.=
assertions.failedButOk );=0D
+-            m_xml.endElement();=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        Timer m_testCaseTimer;=0D
+-        XmlWriter m_xml;=0D
+-        int m_sectionDepth;=0D
+-    };=0D
+-=0D
+-     INTERNAL_CATCH_REGISTER_REPORTER( "xml", XmlReporter )=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: ../reporters/catch_reporter_junit.hpp=0D
+-#define TWOBLUECUBES_CATCH_REPORTER_JUNIT_HPP_INCLUDED=0D
+-=0D
+-#include <assert.h>=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    namespace {=0D
+-        std::string getCurrentTimestamp() {=0D
+-            // Beware, this is not reentrant because of backward compatib=
ility issues=0D
+-            // Also, UTC only, again because of backward compatibility (%=
z is C++11)=0D
+-            time_t rawtime;=0D
+-            std::time(&rawtime);=0D
+-            const size_t timeStampSize =3D sizeof("2017-01-16T17:06:45Z")=
;=0D
+-=0D
+-#ifdef CATCH_PLATFORM_WINDOWS=0D
+-            std::tm timeInfo =3D {};=0D
+-            gmtime_s(&timeInfo, &rawtime);=0D
+-#else=0D
+-            std::tm* timeInfo;=0D
+-            timeInfo =3D std::gmtime(&rawtime);=0D
+-#endif=0D
+-=0D
+-            char timeStamp[timeStampSize];=0D
+-            const char * const fmt =3D "%Y-%m-%dT%H:%M:%SZ";=0D
+-=0D
+-#ifdef CATCH_PLATFORM_WINDOWS=0D
+-            std::strftime(timeStamp, timeStampSize, fmt, &timeInfo);=0D
+-#else=0D
+-            std::strftime(timeStamp, timeStampSize, fmt, timeInfo);=0D
+-#endif=0D
+-            return std::string(timeStamp);=0D
+-        }=0D
+-=0D
+-    }=0D
+-=0D
+-    class JunitReporter : public CumulativeReporterBase {=0D
+-    public:=0D
+-        JunitReporter( ReporterConfig const& _config )=0D
+-        :   CumulativeReporterBase( _config ),=0D
+-            xml( _config.stream() )=0D
+-        {=0D
+-            m_reporterPrefs.shouldRedirectStdOut =3D true;=0D
+-        }=0D
+-=0D
+-        virtual ~JunitReporter() CATCH_OVERRIDE;=0D
+-=0D
+-        static std::string getDescription() {=0D
+-            return "Reports test results in an XML format that looks like=
 Ant's junitreport target";=0D
+-        }=0D
+-=0D
+-        virtual void noMatchingTestCases( std::string const& /*spec*/ ) C=
ATCH_OVERRIDE {}=0D
+-=0D
+-        virtual void testRunStarting( TestRunInfo const& runInfo ) CATCH_=
OVERRIDE {=0D
+-            CumulativeReporterBase::testRunStarting( runInfo );=0D
+-            xml.startElement( "testsuites" );=0D
+-        }=0D
+-=0D
+-        virtual void testGroupStarting( GroupInfo const& groupInfo ) CATC=
H_OVERRIDE {=0D
+-            suiteTimer.start();=0D
+-            stdOutForSuite.str("");=0D
+-            stdErrForSuite.str("");=0D
+-            unexpectedExceptions =3D 0;=0D
+-            CumulativeReporterBase::testGroupStarting( groupInfo );=0D
+-        }=0D
+-=0D
+-        virtual bool assertionEnded( AssertionStats const& assertionStats=
 ) CATCH_OVERRIDE {=0D
+-            if( assertionStats.assertionResult.getResultType() =3D=3D Res=
ultWas::ThrewException )=0D
+-                unexpectedExceptions++;=0D
+-            return CumulativeReporterBase::assertionEnded( assertionStats=
 );=0D
+-        }=0D
+-=0D
+-        virtual void testCaseEnded( TestCaseStats const& testCaseStats ) =
CATCH_OVERRIDE {=0D
+-            stdOutForSuite << testCaseStats.stdOut;=0D
+-            stdErrForSuite << testCaseStats.stdErr;=0D
+-            CumulativeReporterBase::testCaseEnded( testCaseStats );=0D
+-        }=0D
+-=0D
+-        virtual void testGroupEnded( TestGroupStats const& testGroupStats=
 ) CATCH_OVERRIDE {=0D
+-            double suiteTime =3D suiteTimer.getElapsedSeconds();=0D
+-            CumulativeReporterBase::testGroupEnded( testGroupStats );=0D
+-            writeGroup( *m_testGroups.back(), suiteTime );=0D
+-        }=0D
+-=0D
+-        virtual void testRunEndedCumulative() CATCH_OVERRIDE {=0D
+-            xml.endElement();=0D
+-        }=0D
+-=0D
+-        void writeGroup( TestGroupNode const& groupNode, double suiteTime=
 ) {=0D
+-            XmlWriter::ScopedElement e =3D xml.scopedElement( "testsuite"=
 );=0D
+-            TestGroupStats const& stats =3D groupNode.value;=0D
+-            xml.writeAttribute( "name", stats.groupInfo.name );=0D
+-            xml.writeAttribute( "errors", unexpectedExceptions );=0D
+-            xml.writeAttribute( "failures", stats.totals.assertions.faile=
d-unexpectedExceptions );=0D
+-            xml.writeAttribute( "tests", stats.totals.assertions.total() =
);=0D
+-            xml.writeAttribute( "hostname", "tbd" ); // !TBD=0D
+-            if( m_config->showDurations() =3D=3D ShowDurations::Never )=0D
+-                xml.writeAttribute( "time", "" );=0D
+-            else=0D
+-                xml.writeAttribute( "time", suiteTime );=0D
+-            xml.writeAttribute( "timestamp", getCurrentTimestamp() );=0D
+-=0D
+-            // Write test cases=0D
+-            for( TestGroupNode::ChildNodes::const_iterator=0D
+-                    it =3D groupNode.children.begin(), itEnd =3D groupNod=
e.children.end();=0D
+-                    it !=3D itEnd;=0D
+-                    ++it )=0D
+-                writeTestCase( **it );=0D
+-=0D
+-            xml.scopedElement( "system-out" ).writeText( trim( stdOutForS=
uite.str() ), false );=0D
+-            xml.scopedElement( "system-err" ).writeText( trim( stdErrForS=
uite.str() ), false );=0D
+-        }=0D
+-=0D
+-        void writeTestCase( TestCaseNode const& testCaseNode ) {=0D
+-            TestCaseStats const& stats =3D testCaseNode.value;=0D
+-=0D
+-            // All test cases have exactly one section - which represents=
 the=0D
+-            // test case itself. That section may have 0-n nested section=
s=0D
+-            assert( testCaseNode.children.size() =3D=3D 1 );=0D
+-            SectionNode const& rootSection =3D *testCaseNode.children.fro=
nt();=0D
+-=0D
+-            std::string className =3D stats.testInfo.className;=0D
+-=0D
+-            if( className.empty() ) {=0D
+-                if( rootSection.childSections.empty() )=0D
+-                    className =3D "global";=0D
+-            }=0D
+-            writeSection( className, "", rootSection );=0D
+-        }=0D
+-=0D
+-        void writeSection(  std::string const& className,=0D
+-                            std::string const& rootName,=0D
+-                            SectionNode const& sectionNode ) {=0D
+-            std::string name =3D trim( sectionNode.stats.sectionInfo.name=
 );=0D
+-            if( !rootName.empty() )=0D
+-                name =3D rootName + "/" + name;=0D
+-=0D
+-            if( !sectionNode.assertions.empty() ||=0D
+-                !sectionNode.stdOut.empty() ||=0D
+-                !sectionNode.stdErr.empty() ) {=0D
+-                XmlWriter::ScopedElement e =3D xml.scopedElement( "testca=
se" );=0D
+-                if( className.empty() ) {=0D
+-                    xml.writeAttribute( "classname", name );=0D
+-                    xml.writeAttribute( "name", "root" );=0D
+-                }=0D
+-                else {=0D
+-                    xml.writeAttribute( "classname", className );=0D
+-                    xml.writeAttribute( "name", name );=0D
+-                }=0D
+-                xml.writeAttribute( "time", Catch::toString( sectionNode.=
stats.durationInSeconds ) );=0D
+-=0D
+-                writeAssertions( sectionNode );=0D
+-=0D
+-                if( !sectionNode.stdOut.empty() )=0D
+-                    xml.scopedElement( "system-out" ).writeText( trim( se=
ctionNode.stdOut ), false );=0D
+-                if( !sectionNode.stdErr.empty() )=0D
+-                    xml.scopedElement( "system-err" ).writeText( trim( se=
ctionNode.stdErr ), false );=0D
+-            }=0D
+-            for( SectionNode::ChildSections::const_iterator=0D
+-                    it =3D sectionNode.childSections.begin(),=0D
+-                    itEnd =3D sectionNode.childSections.end();=0D
+-                    it !=3D itEnd;=0D
+-                    ++it )=0D
+-                if( className.empty() )=0D
+-                    writeSection( name, "", **it );=0D
+-                else=0D
+-                    writeSection( className, name, **it );=0D
+-        }=0D
+-=0D
+-        void writeAssertions( SectionNode const& sectionNode ) {=0D
+-            for( SectionNode::Assertions::const_iterator=0D
+-                    it =3D sectionNode.assertions.begin(), itEnd =3D sect=
ionNode.assertions.end();=0D
+-                    it !=3D itEnd;=0D
+-                    ++it )=0D
+-                writeAssertion( *it );=0D
+-        }=0D
+-        void writeAssertion( AssertionStats const& stats ) {=0D
+-            AssertionResult const& result =3D stats.assertionResult;=0D
+-            if( !result.isOk() ) {=0D
+-                std::string elementName;=0D
+-                switch( result.getResultType() ) {=0D
+-                    case ResultWas::ThrewException:=0D
+-                    case ResultWas::FatalErrorCondition:=0D
+-                        elementName =3D "error";=0D
+-                        break;=0D
+-                    case ResultWas::ExplicitFailure:=0D
+-                        elementName =3D "failure";=0D
+-                        break;=0D
+-                    case ResultWas::ExpressionFailed:=0D
+-                        elementName =3D "failure";=0D
+-                        break;=0D
+-                    case ResultWas::DidntThrowException:=0D
+-                        elementName =3D "failure";=0D
+-                        break;=0D
+-=0D
+-                    // We should never see these here:=0D
+-                    case ResultWas::Info:=0D
+-                    case ResultWas::Warning:=0D
+-                    case ResultWas::Ok:=0D
+-                    case ResultWas::Unknown:=0D
+-                    case ResultWas::FailureBit:=0D
+-                    case ResultWas::Exception:=0D
+-                        elementName =3D "internalError";=0D
+-                        break;=0D
+-                }=0D
+-=0D
+-                XmlWriter::ScopedElement e =3D xml.scopedElement( element=
Name );=0D
+-=0D
+-                xml.writeAttribute( "message", result.getExpandedExpressi=
on() );=0D
+-                xml.writeAttribute( "type", result.getTestMacroName() );=
=0D
+-=0D
+-                std::ostringstream oss;=0D
+-                if( !result.getMessage().empty() )=0D
+-                    oss << result.getMessage() << "\n";=0D
+-                for( std::vector<MessageInfo>::const_iterator=0D
+-                        it =3D stats.infoMessages.begin(),=0D
+-                        itEnd =3D stats.infoMessages.end();=0D
+-                            it !=3D itEnd;=0D
+-                            ++it )=0D
+-                    if( it->type =3D=3D ResultWas::Info )=0D
+-                        oss << it->message << "\n";=0D
+-=0D
+-                oss << "at " << result.getSourceInfo();=0D
+-                xml.writeText( oss.str(), false );=0D
+-            }=0D
+-        }=0D
+-=0D
+-        XmlWriter xml;=0D
+-        Timer suiteTimer;=0D
+-        std::ostringstream stdOutForSuite;=0D
+-        std::ostringstream stdErrForSuite;=0D
+-        unsigned int unexpectedExceptions;=0D
+-    };=0D
+-=0D
+-    INTERNAL_CATCH_REGISTER_REPORTER( "junit", JunitReporter )=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: ../reporters/catch_reporter_console.hpp=0D
+-#define TWOBLUECUBES_CATCH_REPORTER_CONSOLE_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct ConsoleReporter : StreamingReporterBase {=0D
+-        ConsoleReporter( ReporterConfig const& _config )=0D
+-        :   StreamingReporterBase( _config ),=0D
+-            m_headerPrinted( false )=0D
+-        {}=0D
+-=0D
+-        virtual ~ConsoleReporter() CATCH_OVERRIDE;=0D
+-        static std::string getDescription() {=0D
+-            return "Reports test results as plain lines of text";=0D
+-        }=0D
+-=0D
+-        virtual void noMatchingTestCases( std::string const& spec ) CATCH=
_OVERRIDE {=0D
+-            stream << "No test cases matched '" << spec << "'" << std::en=
dl;=0D
+-        }=0D
+-=0D
+-        virtual void assertionStarting( AssertionInfo const& ) CATCH_OVER=
RIDE {=0D
+-        }=0D
+-=0D
+-        virtual bool assertionEnded( AssertionStats const& _assertionStat=
s ) CATCH_OVERRIDE {=0D
+-            AssertionResult const& result =3D _assertionStats.assertionRe=
sult;=0D
+-=0D
+-            bool printInfoMessages =3D true;=0D
+-=0D
+-            // Drop out if result was successful and we're not printing t=
hose=0D
+-            if( !m_config->includeSuccessfulResults() && result.isOk() ) =
{=0D
+-                if( result.getResultType() !=3D ResultWas::Warning )=0D
+-                    return false;=0D
+-                printInfoMessages =3D false;=0D
+-            }=0D
+-=0D
+-            lazyPrint();=0D
+-=0D
+-            AssertionPrinter printer( stream, _assertionStats, printInfoM=
essages );=0D
+-            printer.print();=0D
+-            stream << std::endl;=0D
+-            return true;=0D
+-        }=0D
+-=0D
+-        virtual void sectionStarting( SectionInfo const& _sectionInfo ) C=
ATCH_OVERRIDE {=0D
+-            m_headerPrinted =3D false;=0D
+-            StreamingReporterBase::sectionStarting( _sectionInfo );=0D
+-        }=0D
+-        virtual void sectionEnded( SectionStats const& _sectionStats ) CA=
TCH_OVERRIDE {=0D
+-            if( _sectionStats.missingAssertions ) {=0D
+-                lazyPrint();=0D
+-                Colour colour( Colour::ResultError );=0D
+-                if( m_sectionStack.size() > 1 )=0D
+-                    stream << "\nNo assertions in section";=0D
+-                else=0D
+-                    stream << "\nNo assertions in test case";=0D
+-                stream << " '" << _sectionStats.sectionInfo.name << "'\n"=
 << std::endl;=0D
+-            }=0D
+-            if( m_headerPrinted ) {=0D
+-                if( m_config->showDurations() =3D=3D ShowDurations::Alway=
s )=0D
+-                    stream << "Completed in " << _sectionStats.durationIn=
Seconds << "s" << std::endl;=0D
+-                m_headerPrinted =3D false;=0D
+-            }=0D
+-            else {=0D
+-                if( m_config->showDurations() =3D=3D ShowDurations::Alway=
s )=0D
+-                    stream << _sectionStats.sectionInfo.name << " complet=
ed in " << _sectionStats.durationInSeconds << "s" << std::endl;=0D
+-            }=0D
+-            StreamingReporterBase::sectionEnded( _sectionStats );=0D
+-        }=0D
+-=0D
+-        virtual void testCaseEnded( TestCaseStats const& _testCaseStats )=
 CATCH_OVERRIDE {=0D
+-            StreamingReporterBase::testCaseEnded( _testCaseStats );=0D
+-            m_headerPrinted =3D false;=0D
+-        }=0D
+-        virtual void testGroupEnded( TestGroupStats const& _testGroupStat=
s ) CATCH_OVERRIDE {=0D
+-            if( currentGroupInfo.used ) {=0D
+-                printSummaryDivider();=0D
+-                stream << "Summary for group '" << _testGroupStats.groupI=
nfo.name << "':\n";=0D
+-                printTotals( _testGroupStats.totals );=0D
+-                stream << "\n" << std::endl;=0D
+-            }=0D
+-            StreamingReporterBase::testGroupEnded( _testGroupStats );=0D
+-        }=0D
+-        virtual void testRunEnded( TestRunStats const& _testRunStats ) CA=
TCH_OVERRIDE {=0D
+-            printTotalsDivider( _testRunStats.totals );=0D
+-            printTotals( _testRunStats.totals );=0D
+-            stream << std::endl;=0D
+-            StreamingReporterBase::testRunEnded( _testRunStats );=0D
+-        }=0D
+-=0D
+-    private:=0D
+-=0D
+-        class AssertionPrinter {=0D
+-            void operator=3D ( AssertionPrinter const& );=0D
+-        public:=0D
+-            AssertionPrinter( std::ostream& _stream, AssertionStats const=
& _stats, bool _printInfoMessages )=0D
+-            :   stream( _stream ),=0D
+-                stats( _stats ),=0D
+-                result( _stats.assertionResult ),=0D
+-                colour( Colour::None ),=0D
+-                message( result.getMessage() ),=0D
+-                messages( _stats.infoMessages ),=0D
+-                printInfoMessages( _printInfoMessages )=0D
+-            {=0D
+-                switch( result.getResultType() ) {=0D
+-                    case ResultWas::Ok:=0D
+-                        colour =3D Colour::Success;=0D
+-                        passOrFail =3D "PASSED";=0D
+-                        //if( result.hasMessage() )=0D
+-                        if( _stats.infoMessages.size() =3D=3D 1 )=0D
+-                            messageLabel =3D "with message";=0D
+-                        if( _stats.infoMessages.size() > 1 )=0D
+-                            messageLabel =3D "with messages";=0D
+-                        break;=0D
+-                    case ResultWas::ExpressionFailed:=0D
+-                        if( result.isOk() ) {=0D
+-                            colour =3D Colour::Success;=0D
+-                            passOrFail =3D "FAILED - but was ok";=0D
+-                        }=0D
+-                        else {=0D
+-                            colour =3D Colour::Error;=0D
+-                            passOrFail =3D "FAILED";=0D
+-                        }=0D
+-                        if( _stats.infoMessages.size() =3D=3D 1 )=0D
+-                            messageLabel =3D "with message";=0D
+-                        if( _stats.infoMessages.size() > 1 )=0D
+-                            messageLabel =3D "with messages";=0D
+-                        break;=0D
+-                    case ResultWas::ThrewException:=0D
+-                        colour =3D Colour::Error;=0D
+-                        passOrFail =3D "FAILED";=0D
+-                        messageLabel =3D "due to unexpected exception wit=
h message";=0D
+-                        break;=0D
+-                    case ResultWas::FatalErrorCondition:=0D
+-                        colour =3D Colour::Error;=0D
+-                        passOrFail =3D "FAILED";=0D
+-                        messageLabel =3D "due to a fatal error condition"=
;=0D
+-                        break;=0D
+-                    case ResultWas::DidntThrowException:=0D
+-                        colour =3D Colour::Error;=0D
+-                        passOrFail =3D "FAILED";=0D
+-                        messageLabel =3D "because no exception was thrown=
 where one was expected";=0D
+-                        break;=0D
+-                    case ResultWas::Info:=0D
+-                        messageLabel =3D "info";=0D
+-                        break;=0D
+-                    case ResultWas::Warning:=0D
+-                        messageLabel =3D "warning";=0D
+-                        break;=0D
+-                    case ResultWas::ExplicitFailure:=0D
+-                        passOrFail =3D "FAILED";=0D
+-                        colour =3D Colour::Error;=0D
+-                        if( _stats.infoMessages.size() =3D=3D 1 )=0D
+-                            messageLabel =3D "explicitly with message";=0D
+-                        if( _stats.infoMessages.size() > 1 )=0D
+-                            messageLabel =3D "explicitly with messages";=
=0D
+-                        break;=0D
+-                    // These cases are here to prevent compiler warnings=
=0D
+-                    case ResultWas::Unknown:=0D
+-                    case ResultWas::FailureBit:=0D
+-                    case ResultWas::Exception:=0D
+-                        passOrFail =3D "** internal error **";=0D
+-                        colour =3D Colour::Error;=0D
+-                        break;=0D
+-                }=0D
+-            }=0D
+-=0D
+-            void print() const {=0D
+-                printSourceInfo();=0D
+-                if( stats.totals.assertions.total() > 0 ) {=0D
+-                    if( result.isOk() )=0D
+-                        stream << "\n";=0D
+-                    printResultType();=0D
+-                    printOriginalExpression();=0D
+-                    printReconstructedExpression();=0D
+-                }=0D
+-                else {=0D
+-                    stream << "\n";=0D
+-                }=0D
+-                printMessage();=0D
+-            }=0D
+-=0D
+-        private:=0D
+-            void printResultType() const {=0D
+-                if( !passOrFail.empty() ) {=0D
+-                    Colour colourGuard( colour );=0D
+-                    stream << passOrFail << ":\n";=0D
+-                }=0D
+-            }=0D
+-            void printOriginalExpression() const {=0D
+-                if( result.hasExpression() ) {=0D
+-                    Colour colourGuard( Colour::OriginalExpression );=0D
+-                    stream  << "  ";=0D
+-                    stream << result.getExpressionInMacro();=0D
+-                    stream << "\n";=0D
+-                }=0D
+-            }=0D
+-            void printReconstructedExpression() const {=0D
+-                if( result.hasExpandedExpression() ) {=0D
+-                    stream << "with expansion:\n";=0D
+-                    Colour colourGuard( Colour::ReconstructedExpression )=
;=0D
+-                    stream << Text( result.getExpandedExpression(), TextA=
ttributes().setIndent(2) ) << "\n";=0D
+-                }=0D
+-            }=0D
+-            void printMessage() const {=0D
+-                if( !messageLabel.empty() )=0D
+-                    stream << messageLabel << ":" << "\n";=0D
+-                for( std::vector<MessageInfo>::const_iterator it =3D mess=
ages.begin(), itEnd =3D messages.end();=0D
+-                        it !=3D itEnd;=0D
+-                        ++it ) {=0D
+-                    // If this assertion is a warning ignore any INFO mes=
sages=0D
+-                    if( printInfoMessages || it->type !=3D ResultWas::Inf=
o )=0D
+-                        stream << Text( it->message, TextAttributes().set=
Indent(2) ) << "\n";=0D
+-                }=0D
+-            }=0D
+-            void printSourceInfo() const {=0D
+-                Colour colourGuard( Colour::FileName );=0D
+-                stream << result.getSourceInfo() << ": ";=0D
+-            }=0D
+-=0D
+-            std::ostream& stream;=0D
+-            AssertionStats const& stats;=0D
+-            AssertionResult const& result;=0D
+-            Colour::Code colour;=0D
+-            std::string passOrFail;=0D
+-            std::string messageLabel;=0D
+-            std::string message;=0D
+-            std::vector<MessageInfo> messages;=0D
+-            bool printInfoMessages;=0D
+-        };=0D
+-=0D
+-        void lazyPrint() {=0D
+-=0D
+-            if( !currentTestRunInfo.used )=0D
+-                lazyPrintRunInfo();=0D
+-            if( !currentGroupInfo.used )=0D
+-                lazyPrintGroupInfo();=0D
+-=0D
+-            if( !m_headerPrinted ) {=0D
+-                printTestCaseAndSectionHeader();=0D
+-                m_headerPrinted =3D true;=0D
+-            }=0D
+-        }=0D
+-        void lazyPrintRunInfo() {=0D
+-            stream  << "\n" << getLineOfChars<'~'>() << "\n";=0D
+-            Colour colour( Colour::SecondaryText );=0D
+-            stream  << currentTestRunInfo->name=0D
+-                    << " is a Catch v"  << libraryVersion << " host appli=
cation.\n"=0D
+-                    << "Run with -? for options\n\n";=0D
+-=0D
+-            if( m_config->rngSeed() !=3D 0 )=0D
+-                stream << "Randomness seeded to: " << m_config->rngSeed()=
 << "\n\n";=0D
+-=0D
+-            currentTestRunInfo.used =3D true;=0D
+-        }=0D
+-        void lazyPrintGroupInfo() {=0D
+-            if( !currentGroupInfo->name.empty() && currentGroupInfo->grou=
psCounts > 1 ) {=0D
+-                printClosedHeader( "Group: " + currentGroupInfo->name );=
=0D
+-                currentGroupInfo.used =3D true;=0D
+-            }=0D
+-        }=0D
+-        void printTestCaseAndSectionHeader() {=0D
+-            assert( !m_sectionStack.empty() );=0D
+-            printOpenHeader( currentTestCaseInfo->name );=0D
+-=0D
+-            if( m_sectionStack.size() > 1 ) {=0D
+-                Colour colourGuard( Colour::Headers );=0D
+-=0D
+-                std::vector<SectionInfo>::const_iterator=0D
+-                    it =3D m_sectionStack.begin()+1, // Skip first sectio=
n (test case)=0D
+-                    itEnd =3D m_sectionStack.end();=0D
+-                for( ; it !=3D itEnd; ++it )=0D
+-                    printHeaderString( it->name, 2 );=0D
+-            }=0D
+-=0D
+-            SourceLineInfo lineInfo =3D m_sectionStack.front().lineInfo;=
=0D
+-=0D
+-            if( !lineInfo.empty() ){=0D
+-                stream << getLineOfChars<'-'>() << "\n";=0D
+-                Colour colourGuard( Colour::FileName );=0D
+-                stream << lineInfo << "\n";=0D
+-            }=0D
+-            stream << getLineOfChars<'.'>() << "\n" << std::endl;=0D
+-        }=0D
+-=0D
+-        void printClosedHeader( std::string const& _name ) {=0D
+-            printOpenHeader( _name );=0D
+-            stream << getLineOfChars<'.'>() << "\n";=0D
+-        }=0D
+-        void printOpenHeader( std::string const& _name ) {=0D
+-            stream  << getLineOfChars<'-'>() << "\n";=0D
+-            {=0D
+-                Colour colourGuard( Colour::Headers );=0D
+-                printHeaderString( _name );=0D
+-            }=0D
+-        }=0D
+-=0D
+-        // if string has a : in first line will set indent to follow it o=
n=0D
+-        // subsequent lines=0D
+-        void printHeaderString( std::string const& _string, std::size_t i=
ndent =3D 0 ) {=0D
+-            std::size_t i =3D _string.find( ": " );=0D
+-            if( i !=3D std::string::npos )=0D
+-                i+=3D2;=0D
+-            else=0D
+-                i =3D 0;=0D
+-            stream << Text( _string, TextAttributes()=0D
+-                                        .setIndent( indent+i)=0D
+-                                        .setInitialIndent( indent ) ) << =
"\n";=0D
+-        }=0D
+-=0D
+-        struct SummaryColumn {=0D
+-=0D
+-            SummaryColumn( std::string const& _label, Colour::Code _colou=
r )=0D
+-            :   label( _label ),=0D
+-                colour( _colour )=0D
+-            {}=0D
+-            SummaryColumn addRow( std::size_t count ) {=0D
+-                std::ostringstream oss;=0D
+-                oss << count;=0D
+-                std::string row =3D oss.str();=0D
+-                for( std::vector<std::string>::iterator it =3D rows.begin=
(); it !=3D rows.end(); ++it ) {=0D
+-                    while( it->size() < row.size() )=0D
+-                        *it =3D " " + *it;=0D
+-                    while( it->size() > row.size() )=0D
+-                        row =3D " " + row;=0D
+-                }=0D
+-                rows.push_back( row );=0D
+-                return *this;=0D
+-            }=0D
+-=0D
+-            std::string label;=0D
+-            Colour::Code colour;=0D
+-            std::vector<std::string> rows;=0D
+-=0D
+-        };=0D
+-=0D
+-        void printTotals( Totals const& totals ) {=0D
+-            if( totals.testCases.total() =3D=3D 0 ) {=0D
+-                stream << Colour( Colour::Warning ) << "No tests ran\n";=
=0D
+-            }=0D
+-            else if( totals.assertions.total() > 0 && totals.testCases.al=
lPassed() ) {=0D
+-                stream << Colour( Colour::ResultSuccess ) << "All tests p=
assed";=0D
+-                stream << " ("=0D
+-                        << pluralise( totals.assertions.passed, "assertio=
n" ) << " in "=0D
+-                        << pluralise( totals.testCases.passed, "test case=
" ) << ")"=0D
+-                        << "\n";=0D
+-            }=0D
+-            else {=0D
+-=0D
+-                std::vector<SummaryColumn> columns;=0D
+-                columns.push_back( SummaryColumn( "", Colour::None )=0D
+-                                        .addRow( totals.testCases.total()=
 )=0D
+-                                        .addRow( totals.assertions.total(=
) ) );=0D
+-                columns.push_back( SummaryColumn( "passed", Colour::Succe=
ss )=0D
+-                                        .addRow( totals.testCases.passed =
)=0D
+-                                        .addRow( totals.assertions.passed=
 ) );=0D
+-                columns.push_back( SummaryColumn( "failed", Colour::Resul=
tError )=0D
+-                                        .addRow( totals.testCases.failed =
)=0D
+-                                        .addRow( totals.assertions.failed=
 ) );=0D
+-                columns.push_back( SummaryColumn( "failed as expected", C=
olour::ResultExpectedFailure )=0D
+-                                        .addRow( totals.testCases.failedB=
utOk )=0D
+-                                        .addRow( totals.assertions.failed=
ButOk ) );=0D
+-=0D
+-                printSummaryRow( "test cases", columns, 0 );=0D
+-                printSummaryRow( "assertions", columns, 1 );=0D
+-            }=0D
+-        }=0D
+-        void printSummaryRow( std::string const& label, std::vector<Summa=
ryColumn> const& cols, std::size_t row ) {=0D
+-            for( std::vector<SummaryColumn>::const_iterator it =3D cols.b=
egin(); it !=3D cols.end(); ++it ) {=0D
+-                std::string value =3D it->rows[row];=0D
+-                if( it->label.empty() ) {=0D
+-                    stream << label << ": ";=0D
+-                    if( value !=3D "0" )=0D
+-                        stream << value;=0D
+-                    else=0D
+-                        stream << Colour( Colour::Warning ) << "- none -"=
;=0D
+-                }=0D
+-                else if( value !=3D "0" ) {=0D
+-                    stream  << Colour( Colour::LightGrey ) << " | ";=0D
+-                    stream  << Colour( it->colour )=0D
+-                            << value << " " << it->label;=0D
+-                }=0D
+-            }=0D
+-            stream << "\n";=0D
+-        }=0D
+-=0D
+-        static std::size_t makeRatio( std::size_t number, std::size_t tot=
al ) {=0D
+-            std::size_t ratio =3D total > 0 ? CATCH_CONFIG_CONSOLE_WIDTH =
* number/ total : 0;=0D
+-            return ( ratio =3D=3D 0 && number > 0 ) ? 1 : ratio;=0D
+-        }=0D
+-        static std::size_t& findMax( std::size_t& i, std::size_t& j, std:=
:size_t& k ) {=0D
+-            if( i > j && i > k )=0D
+-                return i;=0D
+-            else if( j > k )=0D
+-                return j;=0D
+-            else=0D
+-                return k;=0D
+-        }=0D
+-=0D
+-        void printTotalsDivider( Totals const& totals ) {=0D
+-            if( totals.testCases.total() > 0 ) {=0D
+-                std::size_t failedRatio =3D makeRatio( totals.testCases.f=
ailed, totals.testCases.total() );=0D
+-                std::size_t failedButOkRatio =3D makeRatio( totals.testCa=
ses.failedButOk, totals.testCases.total() );=0D
+-                std::size_t passedRatio =3D makeRatio( totals.testCases.p=
assed, totals.testCases.total() );=0D
+-                while( failedRatio + failedButOkRatio + passedRatio < CAT=
CH_CONFIG_CONSOLE_WIDTH-1 )=0D
+-                    findMax( failedRatio, failedButOkRatio, passedRatio )=
++;=0D
+-                while( failedRatio + failedButOkRatio + passedRatio > CAT=
CH_CONFIG_CONSOLE_WIDTH-1 )=0D
+-                    findMax( failedRatio, failedButOkRatio, passedRatio )=
--;=0D
+-=0D
+-                stream << Colour( Colour::Error ) << std::string( failedR=
atio, '=3D' );=0D
+-                stream << Colour( Colour::ResultExpectedFailure ) << std:=
:string( failedButOkRatio, '=3D' );=0D
+-                if( totals.testCases.allPassed() )=0D
+-                    stream << Colour( Colour::ResultSuccess ) << std::str=
ing( passedRatio, '=3D' );=0D
+-                else=0D
+-                    stream << Colour( Colour::Success ) << std::string( p=
assedRatio, '=3D' );=0D
+-            }=0D
+-            else {=0D
+-                stream << Colour( Colour::Warning ) << std::string( CATCH=
_CONFIG_CONSOLE_WIDTH-1, '=3D' );=0D
+-            }=0D
+-            stream << "\n";=0D
+-        }=0D
+-        void printSummaryDivider() {=0D
+-            stream << getLineOfChars<'-'>() << "\n";=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        bool m_headerPrinted;=0D
+-    };=0D
+-=0D
+-    INTERNAL_CATCH_REGISTER_REPORTER( "console", ConsoleReporter )=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-// #included from: ../reporters/catch_reporter_compact.hpp=0D
+-#define TWOBLUECUBES_CATCH_REPORTER_COMPACT_HPP_INCLUDED=0D
+-=0D
+-namespace Catch {=0D
+-=0D
+-    struct CompactReporter : StreamingReporterBase {=0D
+-=0D
+-        CompactReporter( ReporterConfig const& _config )=0D
+-        : StreamingReporterBase( _config )=0D
+-        {}=0D
+-=0D
+-        virtual ~CompactReporter();=0D
+-=0D
+-        static std::string getDescription() {=0D
+-            return "Reports test results on a single line, suitable for I=
DEs";=0D
+-        }=0D
+-=0D
+-        virtual ReporterPreferences getPreferences() const {=0D
+-            ReporterPreferences prefs;=0D
+-            prefs.shouldRedirectStdOut =3D false;=0D
+-            return prefs;=0D
+-        }=0D
+-=0D
+-        virtual void noMatchingTestCases( std::string const& spec ) {=0D
+-            stream << "No test cases matched '" << spec << "'" << std::en=
dl;=0D
+-        }=0D
+-=0D
+-        virtual void assertionStarting( AssertionInfo const& ) {=0D
+-        }=0D
+-=0D
+-        virtual bool assertionEnded( AssertionStats const& _assertionStat=
s ) {=0D
+-            AssertionResult const& result =3D _assertionStats.assertionRe=
sult;=0D
+-=0D
+-            bool printInfoMessages =3D true;=0D
+-=0D
+-            // Drop out if result was successful and we're not printing t=
hose=0D
+-            if( !m_config->includeSuccessfulResults() && result.isOk() ) =
{=0D
+-                if( result.getResultType() !=3D ResultWas::Warning )=0D
+-                    return false;=0D
+-                printInfoMessages =3D false;=0D
+-            }=0D
+-=0D
+-            AssertionPrinter printer( stream, _assertionStats, printInfoM=
essages );=0D
+-            printer.print();=0D
+-=0D
+-            stream << std::endl;=0D
+-            return true;=0D
+-        }=0D
+-=0D
+-        virtual void testRunEnded( TestRunStats const& _testRunStats ) {=
=0D
+-            printTotals( _testRunStats.totals );=0D
+-            stream << "\n" << std::endl;=0D
+-            StreamingReporterBase::testRunEnded( _testRunStats );=0D
+-        }=0D
+-=0D
+-    private:=0D
+-        class AssertionPrinter {=0D
+-            void operator=3D ( AssertionPrinter const& );=0D
+-        public:=0D
+-            AssertionPrinter( std::ostream& _stream, AssertionStats const=
& _stats, bool _printInfoMessages )=0D
+-            : stream( _stream )=0D
+-            , stats( _stats )=0D
+-            , result( _stats.assertionResult )=0D
+-            , messages( _stats.infoMessages )=0D
+-            , itMessage( _stats.infoMessages.begin() )=0D
+-            , printInfoMessages( _printInfoMessages )=0D
+-            {}=0D
+-=0D
+-            void print() {=0D
+-                printSourceInfo();=0D
+-=0D
+-                itMessage =3D messages.begin();=0D
+-=0D
+-                switch( result.getResultType() ) {=0D
+-                    case ResultWas::Ok:=0D
+-                        printResultType( Colour::ResultSuccess, passedStr=
ing() );=0D
+-                        printOriginalExpression();=0D
+-                        printReconstructedExpression();=0D
+-                        if ( ! result.hasExpression() )=0D
+-                            printRemainingMessages( Colour::None );=0D
+-                        else=0D
+-                            printRemainingMessages();=0D
+-                        break;=0D
+-                    case ResultWas::ExpressionFailed:=0D
+-                        if( result.isOk() )=0D
+-                            printResultType( Colour::ResultSuccess, faile=
dString() + std::string( " - but was ok" ) );=0D
+-                        else=0D
+-                            printResultType( Colour::Error, failedString(=
) );=0D
+-                        printOriginalExpression();=0D
+-                        printReconstructedExpression();=0D
+-                        printRemainingMessages();=0D
+-                        break;=0D
+-                    case ResultWas::ThrewException:=0D
+-                        printResultType( Colour::Error, failedString() );=
=0D
+-                        printIssue( "unexpected exception with message:" =
);=0D
+-                        printMessage();=0D
+-                        printExpressionWas();=0D
+-                        printRemainingMessages();=0D
+-                        break;=0D
+-                    case ResultWas::FatalErrorCondition:=0D
+-                        printResultType( Colour::Error, failedString() );=
=0D
+-                        printIssue( "fatal error condition with message:"=
 );=0D
+-                        printMessage();=0D
+-                        printExpressionWas();=0D
+-                        printRemainingMessages();=0D
+-                        break;=0D
+-                    case ResultWas::DidntThrowException:=0D
+-                        printResultType( Colour::Error, failedString() );=
=0D
+-                        printIssue( "expected exception, got none" );=0D
+-                        printExpressionWas();=0D
+-                        printRemainingMessages();=0D
+-                        break;=0D
+-                    case ResultWas::Info:=0D
+-                        printResultType( Colour::None, "info" );=0D
+-                        printMessage();=0D
+-                        printRemainingMessages();=0D
+-                        break;=0D
+-                    case ResultWas::Warning:=0D
+-                        printResultType( Colour::None, "warning" );=0D
+-                        printMessage();=0D
+-                        printRemainingMessages();=0D
+-                        break;=0D
+-                    case ResultWas::ExplicitFailure:=0D
+-                        printResultType( Colour::Error, failedString() );=
=0D
+-                        printIssue( "explicitly" );=0D
+-                        printRemainingMessages( Colour::None );=0D
+-                        break;=0D
+-                    // These cases are here to prevent compiler warnings=
=0D
+-                    case ResultWas::Unknown:=0D
+-                    case ResultWas::FailureBit:=0D
+-                    case ResultWas::Exception:=0D
+-                        printResultType( Colour::Error, "** internal erro=
r **" );=0D
+-                        break;=0D
+-                }=0D
+-            }=0D
+-=0D
+-        private:=0D
+-            // Colour::LightGrey=0D
+-=0D
+-            static Colour::Code dimColour() { return Colour::FileName; }=
=0D
+-=0D
+-#ifdef CATCH_PLATFORM_MAC=0D
+-            static const char* failedString() { return "FAILED"; }=0D
+-            static const char* passedString() { return "PASSED"; }=0D
+-#else=0D
+-            static const char* failedString() { return "failed"; }=0D
+-            static const char* passedString() { return "passed"; }=0D
+-#endif=0D
+-=0D
+-            void printSourceInfo() const {=0D
+-                Colour colourGuard( Colour::FileName );=0D
+-                stream << result.getSourceInfo() << ":";=0D
+-            }=0D
+-=0D
+-            void printResultType( Colour::Code colour, std::string passOr=
Fail ) const {=0D
+-                if( !passOrFail.empty() ) {=0D
+-                    {=0D
+-                        Colour colourGuard( colour );=0D
+-                        stream << " " << passOrFail;=0D
+-                    }=0D
+-                    stream << ":";=0D
+-                }=0D
+-            }=0D
+-=0D
+-            void printIssue( std::string issue ) const {=0D
+-                stream << " " << issue;=0D
+-            }=0D
+-=0D
+-            void printExpressionWas() {=0D
+-                if( result.hasExpression() ) {=0D
+-                    stream << ";";=0D
+-                    {=0D
+-                        Colour colour( dimColour() );=0D
+-                        stream << " expression was:";=0D
+-                    }=0D
+-                    printOriginalExpression();=0D
+-                }=0D
+-            }=0D
+-=0D
+-            void printOriginalExpression() const {=0D
+-                if( result.hasExpression() ) {=0D
+-                    stream << " " << result.getExpression();=0D
+-                }=0D
+-            }=0D
+-=0D
+-            void printReconstructedExpression() const {=0D
+-                if( result.hasExpandedExpression() ) {=0D
+-                    {=0D
+-                        Colour colour( dimColour() );=0D
+-                        stream << " for: ";=0D
+-                    }=0D
+-                    stream << result.getExpandedExpression();=0D
+-                }=0D
+-            }=0D
+-=0D
+-            void printMessage() {=0D
+-                if ( itMessage !=3D messages.end() ) {=0D
+-                    stream << " '" << itMessage->message << "'";=0D
+-                    ++itMessage;=0D
+-                }=0D
+-            }=0D
+-=0D
+-            void printRemainingMessages( Colour::Code colour =3D dimColou=
r() ) {=0D
+-                if ( itMessage =3D=3D messages.end() )=0D
+-                    return;=0D
+-=0D
+-                // using messages.end() directly yields compilation error=
:=0D
+-                std::vector<MessageInfo>::const_iterator itEnd =3D messag=
es.end();=0D
+-                const std::size_t N =3D static_cast<std::size_t>( std::di=
stance( itMessage, itEnd ) );=0D
+-=0D
+-                {=0D
+-                    Colour colourGuard( colour );=0D
+-                    stream << " with " << pluralise( N, "message" ) << ":=
";=0D
+-                }=0D
+-=0D
+-                for(; itMessage !=3D itEnd; ) {=0D
+-                    // If this assertion is a warning ignore any INFO mes=
sages=0D
+-                    if( printInfoMessages || itMessage->type !=3D ResultW=
as::Info ) {=0D
+-                        stream << " '" << itMessage->message << "'";=0D
+-                        if ( ++itMessage !=3D itEnd ) {=0D
+-                            Colour colourGuard( dimColour() );=0D
+-                            stream << " and";=0D
+-                        }=0D
+-                    }=0D
+-                }=0D
+-            }=0D
+-=0D
+-        private:=0D
+-            std::ostream& stream;=0D
+-            AssertionStats const& stats;=0D
+-            AssertionResult const& result;=0D
+-            std::vector<MessageInfo> messages;=0D
+-            std::vector<MessageInfo>::const_iterator itMessage;=0D
+-            bool printInfoMessages;=0D
+-        };=0D
+-=0D
+-        // Colour, message variants:=0D
+-        // - white: No tests ran.=0D
+-        // -   red: Failed [both/all] N test cases, failed [both/all] M a=
ssertions.=0D
+-        // - white: Passed [both/all] N test cases (no assertions).=0D
+-        // -   red: Failed N tests cases, failed M assertions.=0D
+-        // - green: Passed [both/all] N tests cases with M assertions.=0D
+-=0D
+-        std::string bothOrAll( std::size_t count ) const {=0D
+-            return count =3D=3D 1 ? "" : count =3D=3D 2 ? "both " : "all =
" ;=0D
+-        }=0D
+-=0D
+-        void printTotals( const Totals& totals ) const {=0D
+-            if( totals.testCases.total() =3D=3D 0 ) {=0D
+-                stream << "No tests ran.";=0D
+-            }=0D
+-            else if( totals.testCases.failed =3D=3D totals.testCases.tota=
l() ) {=0D
+-                Colour colour( Colour::ResultError );=0D
+-                const std::string qualify_assertions_failed =3D=0D
+-                    totals.assertions.failed =3D=3D totals.assertions.tot=
al() ?=0D
+-                        bothOrAll( totals.assertions.failed ) : "";=0D
+-                stream <<=0D
+-                    "Failed " << bothOrAll( totals.testCases.failed )=0D
+-                              << pluralise( totals.testCases.failed, "tes=
t case"  ) << ", "=0D
+-                    "failed " << qualify_assertions_failed <<=0D
+-                                 pluralise( totals.assertions.failed, "as=
sertion" ) << ".";=0D
+-            }=0D
+-            else if( totals.assertions.total() =3D=3D 0 ) {=0D
+-                stream <<=0D
+-                    "Passed " << bothOrAll( totals.testCases.total() )=0D
+-                              << pluralise( totals.testCases.total(), "te=
st case" )=0D
+-                              << " (no assertions).";=0D
+-            }=0D
+-            else if( totals.assertions.failed ) {=0D
+-                Colour colour( Colour::ResultError );=0D
+-                stream <<=0D
+-                    "Failed " << pluralise( totals.testCases.failed, "tes=
t case"  ) << ", "=0D
+-                    "failed " << pluralise( totals.assertions.failed, "as=
sertion" ) << ".";=0D
+-            }=0D
+-            else {=0D
+-                Colour colour( Colour::ResultSuccess );=0D
+-                stream <<=0D
+-                    "Passed " << bothOrAll( totals.testCases.passed )=0D
+-                              << pluralise( totals.testCases.passed, "tes=
t case"  ) <<=0D
+-                    " with "  << pluralise( totals.assertions.passed, "as=
sertion" ) << ".";=0D
+-            }=0D
+-        }=0D
+-    };=0D
+-=0D
+-    INTERNAL_CATCH_REGISTER_REPORTER( "compact", CompactReporter )=0D
+-=0D
+-} // end namespace Catch=0D
+-=0D
+-namespace Catch {=0D
+-    // These are all here to avoid warnings about not having any out of l=
ine=0D
+-    // virtual methods=0D
+-    NonCopyable::~NonCopyable() {}=0D
+-    IShared::~IShared() {}=0D
+-    IStream::~IStream() CATCH_NOEXCEPT {}=0D
+-    FileStream::~FileStream() CATCH_NOEXCEPT {}=0D
+-    CoutStream::~CoutStream() CATCH_NOEXCEPT {}=0D
+-    DebugOutStream::~DebugOutStream() CATCH_NOEXCEPT {}=0D
+-    StreamBufBase::~StreamBufBase() CATCH_NOEXCEPT {}=0D
+-    IContext::~IContext() {}=0D
+-    IResultCapture::~IResultCapture() {}=0D
+-    ITestCase::~ITestCase() {}=0D
+-    ITestCaseRegistry::~ITestCaseRegistry() {}=0D
+-    IRegistryHub::~IRegistryHub() {}=0D
+-    IMutableRegistryHub::~IMutableRegistryHub() {}=0D
+-    IExceptionTranslator::~IExceptionTranslator() {}=0D
+-    IExceptionTranslatorRegistry::~IExceptionTranslatorRegistry() {}=0D
+-    IReporter::~IReporter() {}=0D
+-    IReporterFactory::~IReporterFactory() {}=0D
+-    IReporterRegistry::~IReporterRegistry() {}=0D
+-    IStreamingReporter::~IStreamingReporter() {}=0D
+-    AssertionStats::~AssertionStats() {}=0D
+-    SectionStats::~SectionStats() {}=0D
+-    TestCaseStats::~TestCaseStats() {}=0D
+-    TestGroupStats::~TestGroupStats() {}=0D
+-    TestRunStats::~TestRunStats() {}=0D
+-    CumulativeReporterBase::SectionNode::~SectionNode() {}=0D
+-    CumulativeReporterBase::~CumulativeReporterBase() {}=0D
+-=0D
+-    StreamingReporterBase::~StreamingReporterBase() {}=0D
+-    ConsoleReporter::~ConsoleReporter() {}=0D
+-    CompactReporter::~CompactReporter() {}=0D
+-    IRunner::~IRunner() {}=0D
+-    IMutableContext::~IMutableContext() {}=0D
+-    IConfig::~IConfig() {}=0D
+-    XmlReporter::~XmlReporter() {}=0D
+-    JunitReporter::~JunitReporter() {}=0D
+-    TestRegistry::~TestRegistry() {}=0D
+-    FreeFunctionTestCase::~FreeFunctionTestCase() {}=0D
+-    IGeneratorInfo::~IGeneratorInfo() {}=0D
+-    IGeneratorsForTest::~IGeneratorsForTest() {}=0D
+-    WildcardPattern::~WildcardPattern() {}=0D
+-    TestSpec::Pattern::~Pattern() {}=0D
+-    TestSpec::NamePattern::~NamePattern() {}=0D
+-    TestSpec::TagPattern::~TagPattern() {}=0D
+-    TestSpec::ExcludedPattern::~ExcludedPattern() {}=0D
+-=0D
+-    Matchers::Impl::StdString::Equals::~Equals() {}=0D
+-    Matchers::Impl::StdString::Contains::~Contains() {}=0D
+-    Matchers::Impl::StdString::StartsWith::~StartsWith() {}=0D
+-    Matchers::Impl::StdString::EndsWith::~EndsWith() {}=0D
+-=0D
+-    void Config::dummy() {}=0D
+-=0D
+-    namespace TestCaseTracking {=0D
+-        ITracker::~ITracker() {}=0D
+-        TrackerBase::~TrackerBase() {}=0D
+-        SectionTracker::~SectionTracker() {}=0D
+-        IndexTracker::~IndexTracker() {}=0D
+-    }=0D
+-}=0D
+-=0D
+-#ifdef __clang__=0D
+-#pragma clang diagnostic pop=0D
+-#endif=0D
+-=0D
+-#endif=0D
+-=0D
+-#ifdef CATCH_CONFIG_MAIN=0D
+-// #included from: internal/catch_default_main.hpp=0D
+-#define TWOBLUECUBES_CATCH_DEFAULT_MAIN_HPP_INCLUDED=0D
+-=0D
+-#ifndef __OBJC__=0D
+-=0D
+-// Standard C/C++ main entry point=0D
+-int main (int argc, char * argv[]) {=0D
+-    return Catch::Session().run( argc, argv );=0D
+-}=0D
+-=0D
+-#else // __OBJC__=0D
+-=0D
+-// Objective-C entry point=0D
+-int main (int argc, char * const argv[]) {=0D
+-#if !CATCH_ARC_ENABLED=0D
+-    NSAutoreleasePool * pool =3D [[NSAutoreleasePool alloc] init];=0D
+-#endif=0D
+-=0D
+-    Catch::registerTestMethods();=0D
+-    int result =3D Catch::Session().run( argc, (char* const*)argv );=0D
+-=0D
+-#if !CATCH_ARC_ENABLED=0D
+-    [pool drain];=0D
+-#endif=0D
+-=0D
+-    return result;=0D
+-}=0D
+-=0D
+-#endif // __OBJC__=0D
+-=0D
+-#endif=0D
+-=0D
+-#ifdef CLARA_CONFIG_MAIN_NOT_DEFINED=0D
+-#  undef CLARA_CONFIG_MAIN=0D
+-#endif=0D
+-=0D
+-//////=0D
+-=0D
+-// If this config identifier is defined then all CATCH macros are prefixe=
d with CATCH_=0D
+-#ifdef CATCH_CONFIG_PREFIX_ALL=0D
+-=0D
+-#define CATCH_REQUIRE( expr ) INTERNAL_CATCH_TEST( expr, Catch::ResultDis=
position::Normal, "CATCH_REQUIRE" )=0D
+-#define CATCH_REQUIRE_FALSE( expr ) INTERNAL_CATCH_TEST( expr, Catch::Res=
ultDisposition::Normal | Catch::ResultDisposition::FalseTest, "CATCH_REQUIR=
E_FALSE" )=0D
+-=0D
+-#define CATCH_REQUIRE_THROWS( expr ) INTERNAL_CATCH_THROWS( expr, Catch::=
ResultDisposition::Normal, "", "CATCH_REQUIRE_THROWS" )=0D
+-#define CATCH_REQUIRE_THROWS_AS( expr, exceptionType ) INTERNAL_CATCH_THR=
OWS_AS( expr, exceptionType, Catch::ResultDisposition::Normal, "CATCH_REQUI=
RE_THROWS_AS" )=0D
+-#define CATCH_REQUIRE_THROWS_WITH( expr, matcher ) INTERNAL_CATCH_THROWS(=
 expr, Catch::ResultDisposition::Normal, matcher, "CATCH_REQUIRE_THROWS_WIT=
H" )=0D
+-#define CATCH_REQUIRE_NOTHROW( expr ) INTERNAL_CATCH_NO_THROW( expr, Catc=
h::ResultDisposition::Normal, "CATCH_REQUIRE_NOTHROW" )=0D
+-=0D
+-#define CATCH_CHECK( expr ) INTERNAL_CATCH_TEST( expr, Catch::ResultDispo=
sition::ContinueOnFailure, "CATCH_CHECK" )=0D
+-#define CATCH_CHECK_FALSE( expr ) INTERNAL_CATCH_TEST( expr, Catch::Resul=
tDisposition::ContinueOnFailure | Catch::ResultDisposition::FalseTest, "CAT=
CH_CHECK_FALSE" )=0D
+-#define CATCH_CHECKED_IF( expr ) INTERNAL_CATCH_IF( expr, Catch::ResultDi=
sposition::ContinueOnFailure, "CATCH_CHECKED_IF" )=0D
+-#define CATCH_CHECKED_ELSE( expr ) INTERNAL_CATCH_ELSE( expr, Catch::Resu=
ltDisposition::ContinueOnFailure, "CATCH_CHECKED_ELSE" )=0D
+-#define CATCH_CHECK_NOFAIL( expr ) INTERNAL_CATCH_TEST( expr, Catch::Resu=
ltDisposition::ContinueOnFailure | Catch::ResultDisposition::SuppressFail, =
"CATCH_CHECK_NOFAIL" )=0D
+-=0D
+-#define CATCH_CHECK_THROWS( expr )  INTERNAL_CATCH_THROWS( expr, Catch::R=
esultDisposition::ContinueOnFailure, "", "CATCH_CHECK_THROWS" )=0D
+-#define CATCH_CHECK_THROWS_AS( expr, exceptionType ) INTERNAL_CATCH_THROW=
S_AS( expr, exceptionType, Catch::ResultDisposition::ContinueOnFailure, "CA=
TCH_CHECK_THROWS_AS" )=0D
+-#define CATCH_CHECK_THROWS_WITH( expr, matcher ) INTERNAL_CATCH_THROWS( e=
xpr, Catch::ResultDisposition::ContinueOnFailure, matcher, "CATCH_CHECK_THR=
OWS_WITH" )=0D
+-#define CATCH_CHECK_NOTHROW( expr ) INTERNAL_CATCH_NO_THROW( expr, Catch:=
:ResultDisposition::ContinueOnFailure, "CATCH_CHECK_NOTHROW" )=0D
+-=0D
+-#define CATCH_CHECK_THAT( arg, matcher ) INTERNAL_CHECK_THAT( arg, matche=
r, Catch::ResultDisposition::ContinueOnFailure, "CATCH_CHECK_THAT" )=0D
+-#define CATCH_REQUIRE_THAT( arg, matcher ) INTERNAL_CHECK_THAT( arg, matc=
her, Catch::ResultDisposition::Normal, "CATCH_REQUIRE_THAT" )=0D
+-=0D
+-#define CATCH_INFO( msg ) INTERNAL_CATCH_INFO( msg, "CATCH_INFO" )=0D
+-#define CATCH_WARN( msg ) INTERNAL_CATCH_MSG( Catch::ResultWas::Warning, =
Catch::ResultDisposition::ContinueOnFailure, "CATCH_WARN", msg )=0D
+-#define CATCH_SCOPED_INFO( msg ) INTERNAL_CATCH_INFO( msg, "CATCH_INFO" )=
=0D
+-#define CATCH_CAPTURE( msg ) INTERNAL_CATCH_INFO( #msg " :=3D " << msg, "=
CATCH_CAPTURE" )=0D
+-#define CATCH_SCOPED_CAPTURE( msg ) INTERNAL_CATCH_INFO( #msg " :=3D " <<=
 msg, "CATCH_CAPTURE" )=0D
+-=0D
+-#ifdef CATCH_CONFIG_VARIADIC_MACROS=0D
+-    #define CATCH_TEST_CASE( ... ) INTERNAL_CATCH_TESTCASE( __VA_ARGS__ )=
=0D
+-    #define CATCH_TEST_CASE_METHOD( className, ... ) INTERNAL_CATCH_TEST_=
CASE_METHOD( className, __VA_ARGS__ )=0D
+-    #define CATCH_METHOD_AS_TEST_CASE( method, ... ) INTERNAL_CATCH_METHO=
D_AS_TEST_CASE( method, __VA_ARGS__ )=0D
+-    #define CATCH_REGISTER_TEST_CASE( Function, ... ) INTERNAL_CATCH_REGI=
STER_TESTCASE( Function, __VA_ARGS__ )=0D
+-    #define CATCH_SECTION( ... ) INTERNAL_CATCH_SECTION( __VA_ARGS__ )=0D
+-    #define CATCH_FAIL( ... ) INTERNAL_CATCH_MSG( Catch::ResultWas::Expli=
citFailure, Catch::ResultDisposition::Normal, "CATCH_FAIL", __VA_ARGS__ )=0D
+-    #define CATCH_SUCCEED( ... ) INTERNAL_CATCH_MSG( Catch::ResultWas::Ok=
, Catch::ResultDisposition::ContinueOnFailure, "CATCH_SUCCEED", __VA_ARGS__=
 )=0D
+-#else=0D
+-    #define CATCH_TEST_CASE( name, description ) INTERNAL_CATCH_TESTCASE(=
 name, description )=0D
+-    #define CATCH_TEST_CASE_METHOD( className, name, description ) INTERN=
AL_CATCH_TEST_CASE_METHOD( className, name, description )=0D
+-    #define CATCH_METHOD_AS_TEST_CASE( method, name, description ) INTERN=
AL_CATCH_METHOD_AS_TEST_CASE( method, name, description )=0D
+-    #define CATCH_REGISTER_TEST_CASE( function, name, description ) INTER=
NAL_CATCH_REGISTER_TESTCASE( function, name, description )=0D
+-    #define CATCH_SECTION( name, description ) INTERNAL_CATCH_SECTION( na=
me, description )=0D
+-    #define CATCH_FAIL( msg ) INTERNAL_CATCH_MSG( Catch::ResultWas::Expli=
citFailure, Catch::ResultDisposition::Normal, "CATCH_FAIL", msg )=0D
+-    #define CATCH_SUCCEED( msg ) INTERNAL_CATCH_MSG( Catch::ResultWas::Ok=
, Catch::ResultDisposition::ContinueOnFailure, "CATCH_SUCCEED", msg )=0D
+-#endif=0D
+-#define CATCH_ANON_TEST_CASE() INTERNAL_CATCH_TESTCASE( "", "" )=0D
+-=0D
+-#define CATCH_REGISTER_REPORTER( name, reporterType ) INTERNAL_CATCH_REGI=
STER_REPORTER( name, reporterType )=0D
+-#define CATCH_REGISTER_LEGACY_REPORTER( name, reporterType ) INTERNAL_CAT=
CH_REGISTER_LEGACY_REPORTER( name, reporterType )=0D
+-=0D
+-#define CATCH_GENERATE( expr) INTERNAL_CATCH_GENERATE( expr )=0D
+-=0D
+-// "BDD-style" convenience wrappers=0D
+-#ifdef CATCH_CONFIG_VARIADIC_MACROS=0D
+-#define CATCH_SCENARIO( ... ) CATCH_TEST_CASE( "Scenario: " __VA_ARGS__ )=
=0D
+-#define CATCH_SCENARIO_METHOD( className, ... ) INTERNAL_CATCH_TEST_CASE_=
METHOD( className, "Scenario: " __VA_ARGS__ )=0D
+-#else=0D
+-#define CATCH_SCENARIO( name, tags ) CATCH_TEST_CASE( "Scenario: " name, =
tags )=0D
+-#define CATCH_SCENARIO_METHOD( className, name, tags ) INTERNAL_CATCH_TES=
T_CASE_METHOD( className, "Scenario: " name, tags )=0D
+-#endif=0D
+-#define CATCH_GIVEN( desc )    CATCH_SECTION( std::string( "Given: ") + d=
esc, "" )=0D
+-#define CATCH_WHEN( desc )     CATCH_SECTION( std::string( " When: ") + d=
esc, "" )=0D
+-#define CATCH_AND_WHEN( desc ) CATCH_SECTION( std::string( "  And: ") + d=
esc, "" )=0D
+-#define CATCH_THEN( desc )     CATCH_SECTION( std::string( " Then: ") + d=
esc, "" )=0D
+-#define CATCH_AND_THEN( desc ) CATCH_SECTION( std::string( "  And: ") + d=
esc, "" )=0D
+-=0D
+-// If CATCH_CONFIG_PREFIX_ALL is not defined then the CATCH_ prefix is no=
t required=0D
+-#else=0D
+-=0D
+-#define REQUIRE( expr ) INTERNAL_CATCH_TEST( expr, Catch::ResultDispositi=
on::Normal, "REQUIRE" )=0D
+-#define REQUIRE_FALSE( expr ) INTERNAL_CATCH_TEST( expr, Catch::ResultDis=
position::Normal | Catch::ResultDisposition::FalseTest, "REQUIRE_FALSE" )=0D
+-=0D
+-#define REQUIRE_THROWS( expr ) INTERNAL_CATCH_THROWS( expr, Catch::Result=
Disposition::Normal, "", "REQUIRE_THROWS" )=0D
+-#define REQUIRE_THROWS_AS( expr, exceptionType ) INTERNAL_CATCH_THROWS_AS=
( expr, exceptionType, Catch::ResultDisposition::Normal, "REQUIRE_THROWS_AS=
" )=0D
+-#define REQUIRE_THROWS_WITH( expr, matcher ) INTERNAL_CATCH_THROWS( expr,=
 Catch::ResultDisposition::Normal, matcher, "REQUIRE_THROWS_WITH" )=0D
+-#define REQUIRE_NOTHROW( expr ) INTERNAL_CATCH_NO_THROW( expr, Catch::Res=
ultDisposition::Normal, "REQUIRE_NOTHROW" )=0D
+-=0D
+-#define CHECK( expr ) INTERNAL_CATCH_TEST( expr, Catch::ResultDisposition=
::ContinueOnFailure, "CHECK" )=0D
+-#define CHECK_FALSE( expr ) INTERNAL_CATCH_TEST( expr, Catch::ResultDispo=
sition::ContinueOnFailure | Catch::ResultDisposition::FalseTest, "CHECK_FAL=
SE" )=0D
+-#define CHECKED_IF( expr ) INTERNAL_CATCH_IF( expr, Catch::ResultDisposit=
ion::ContinueOnFailure, "CHECKED_IF" )=0D
+-#define CHECKED_ELSE( expr ) INTERNAL_CATCH_ELSE( expr, Catch::ResultDisp=
osition::ContinueOnFailure, "CHECKED_ELSE" )=0D
+-#define CHECK_NOFAIL( expr ) INTERNAL_CATCH_TEST( expr, Catch::ResultDisp=
osition::ContinueOnFailure | Catch::ResultDisposition::SuppressFail, "CHECK=
_NOFAIL" )=0D
+-=0D
+-#define CHECK_THROWS( expr )  INTERNAL_CATCH_THROWS( expr, Catch::ResultD=
isposition::ContinueOnFailure, "", "CHECK_THROWS" )=0D
+-#define CHECK_THROWS_AS( expr, exceptionType ) INTERNAL_CATCH_THROWS_AS( =
expr, exceptionType, Catch::ResultDisposition::ContinueOnFailure, "CHECK_TH=
ROWS_AS" )=0D
+-#define CHECK_THROWS_WITH( expr, matcher ) INTERNAL_CATCH_THROWS( expr, C=
atch::ResultDisposition::ContinueOnFailure, matcher, "CHECK_THROWS_WITH" )=
=0D
+-#define CHECK_NOTHROW( expr ) INTERNAL_CATCH_NO_THROW( expr, Catch::Resul=
tDisposition::ContinueOnFailure, "CHECK_NOTHROW" )=0D
+-=0D
+-#define CHECK_THAT( arg, matcher ) INTERNAL_CHECK_THAT( arg, matcher, Cat=
ch::ResultDisposition::ContinueOnFailure, "CHECK_THAT" )=0D
+-#define REQUIRE_THAT( arg, matcher ) INTERNAL_CHECK_THAT( arg, matcher, C=
atch::ResultDisposition::Normal, "REQUIRE_THAT" )=0D
+-=0D
+-#define INFO( msg ) INTERNAL_CATCH_INFO( msg, "INFO" )=0D
+-#define WARN( msg ) INTERNAL_CATCH_MSG( Catch::ResultWas::Warning, Catch:=
:ResultDisposition::ContinueOnFailure, "WARN", msg )=0D
+-#define SCOPED_INFO( msg ) INTERNAL_CATCH_INFO( msg, "INFO" )=0D
+-#define CAPTURE( msg ) INTERNAL_CATCH_INFO( #msg " :=3D " << msg, "CAPTUR=
E" )=0D
+-#define SCOPED_CAPTURE( msg ) INTERNAL_CATCH_INFO( #msg " :=3D " << msg, =
"CAPTURE" )=0D
+-=0D
+-#ifdef CATCH_CONFIG_VARIADIC_MACROS=0D
+-    #define TEST_CASE( ... ) INTERNAL_CATCH_TESTCASE( __VA_ARGS__ )=0D
+-    #define TEST_CASE_METHOD( className, ... ) INTERNAL_CATCH_TEST_CASE_M=
ETHOD( className, __VA_ARGS__ )=0D
+-    #define METHOD_AS_TEST_CASE( method, ... ) INTERNAL_CATCH_METHOD_AS_T=
EST_CASE( method, __VA_ARGS__ )=0D
+-    #define REGISTER_TEST_CASE( Function, ... ) INTERNAL_CATCH_REGISTER_T=
ESTCASE( Function, __VA_ARGS__ )=0D
+-    #define SECTION( ... ) INTERNAL_CATCH_SECTION( __VA_ARGS__ )=0D
+-    #define FAIL( ... ) INTERNAL_CATCH_MSG( Catch::ResultWas::ExplicitFai=
lure, Catch::ResultDisposition::Normal, "FAIL", __VA_ARGS__ )=0D
+-    #define SUCCEED( ... ) INTERNAL_CATCH_MSG( Catch::ResultWas::Ok, Catc=
h::ResultDisposition::ContinueOnFailure, "SUCCEED", __VA_ARGS__ )=0D
+-#else=0D
+-    #define TEST_CASE( name, description ) INTERNAL_CATCH_TESTCASE( name,=
 description )=0D
+-    #define TEST_CASE_METHOD( className, name, description ) INTERNAL_CAT=
CH_TEST_CASE_METHOD( className, name, description )=0D
+-    #define METHOD_AS_TEST_CASE( method, name, description ) INTERNAL_CAT=
CH_METHOD_AS_TEST_CASE( method, name, description )=0D
+-    #define REGISTER_TEST_CASE( method, name, description ) INTERNAL_CATC=
H_REGISTER_TESTCASE( method, name, description )=0D
+-    #define SECTION( name, description ) INTERNAL_CATCH_SECTION( name, de=
scription )=0D
+-    #define FAIL( msg ) INTERNAL_CATCH_MSG( Catch::ResultWas::ExplicitFai=
lure, Catch::ResultDisposition::Normal, "FAIL", msg )=0D
+-    #define SUCCEED( msg ) INTERNAL_CATCH_MSG( Catch::ResultWas::Ok, Catc=
h::ResultDisposition::ContinueOnFailure, "SUCCEED", msg )=0D
+-#endif=0D
+-#define ANON_TEST_CASE() INTERNAL_CATCH_TESTCASE( "", "" )=0D
+-=0D
+-#define REGISTER_REPORTER( name, reporterType ) INTERNAL_CATCH_REGISTER_R=
EPORTER( name, reporterType )=0D
+-#define REGISTER_LEGACY_REPORTER( name, reporterType ) INTERNAL_CATCH_REG=
ISTER_LEGACY_REPORTER( name, reporterType )=0D
+-=0D
+-#define GENERATE( expr) INTERNAL_CATCH_GENERATE( expr )=0D
+-=0D
+-#endif=0D
+-=0D
+-#define CATCH_TRANSLATE_EXCEPTION( signature ) INTERNAL_CATCH_TRANSLATE_E=
XCEPTION( signature )=0D
+-=0D
+-// "BDD-style" convenience wrappers=0D
+-#ifdef CATCH_CONFIG_VARIADIC_MACROS=0D
+-#define SCENARIO( ... ) TEST_CASE( "Scenario: " __VA_ARGS__ )=0D
+-#define SCENARIO_METHOD( className, ... ) INTERNAL_CATCH_TEST_CASE_METHOD=
( className, "Scenario: " __VA_ARGS__ )=0D
+-#else=0D
+-#define SCENARIO( name, tags ) TEST_CASE( "Scenario: " name, tags )=0D
+-#define SCENARIO_METHOD( className, name, tags ) INTERNAL_CATCH_TEST_CASE=
_METHOD( className, "Scenario: " name, tags )=0D
+-#endif=0D
+-#define GIVEN( desc )    SECTION( std::string("   Given: ") + desc, "" )=
=0D
+-#define WHEN( desc )     SECTION( std::string("    When: ") + desc, "" )=
=0D
+-#define AND_WHEN( desc ) SECTION( std::string("And when: ") + desc, "" )=
=0D
+-#define THEN( desc )     SECTION( std::string("    Then: ") + desc, "" )=
=0D
+-#define AND_THEN( desc ) SECTION( std::string("     And: ") + desc, "" )=
=0D
+-=0D
+-using Catch::Detail::Approx;=0D
+-=0D
+-#endif // TWOBLUECUBES_SINGLE_INCLUDE_CATCH_HPP_INCLUDED=0D
+-=0D
++/*
++ *  Catch v1.12.2
++ *  Generated: 2018-05-14 15:10:01.112442
++ *  ----------------------------------------------------------
++ *  This file has been merged from multiple headers. Please don't edit it=
 directly
++ *  Copyright (c) 2012 Two Blue Cubes Ltd. All rights reserved.
++ *
++ *  Distributed under the Boost Software License, Version 1.0. (See accom=
panying
++ *  file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++ */
++#ifndef TWOBLUECUBES_SINGLE_INCLUDE_CATCH_HPP_INCLUDED
++#define TWOBLUECUBES_SINGLE_INCLUDE_CATCH_HPP_INCLUDED
++
++#define TWOBLUECUBES_CATCH_HPP_INCLUDED
++
++#ifdef __clang__
++#    pragma clang system_header
++#elif defined __GNUC__
++#    pragma GCC system_header
++#endif
++
++// #included from: internal/catch_suppress_warnings.h
++
++#ifdef __clang__
++#   ifdef __ICC // icpc defines the __clang__ macro
++#       pragma warning(push)
++#       pragma warning(disable: 161 1682)
++#   else // __ICC
++#       pragma clang diagnostic ignored "-Wglobal-constructors"
++#       pragma clang diagnostic ignored "-Wvariadic-macros"
++#       pragma clang diagnostic ignored "-Wc99-extensions"
++#       pragma clang diagnostic ignored "-Wunused-variable"
++#       pragma clang diagnostic push
++#       pragma clang diagnostic ignored "-Wpadded"
++#       pragma clang diagnostic ignored "-Wc++98-compat"
++#       pragma clang diagnostic ignored "-Wc++98-compat-pedantic"
++#       pragma clang diagnostic ignored "-Wswitch-enum"
++#       pragma clang diagnostic ignored "-Wcovered-switch-default"
++#    endif
++#elif defined __GNUC__
++#    pragma GCC diagnostic ignored "-Wvariadic-macros"
++#    pragma GCC diagnostic ignored "-Wunused-variable"
++#    pragma GCC diagnostic ignored "-Wparentheses"
++
++#    pragma GCC diagnostic push
++#    pragma GCC diagnostic ignored "-Wpadded"
++#endif
++#if defined(CATCH_CONFIG_MAIN) || defined(CATCH_CONFIG_RUNNER)
++#  define CATCH_IMPL
++#endif
++
++#ifdef CATCH_IMPL
++#  ifndef CLARA_CONFIG_MAIN
++#    define CLARA_CONFIG_MAIN_NOT_DEFINED
++#    define CLARA_CONFIG_MAIN
++#  endif
++#endif
++
++// #included from: internal/catch_notimplemented_exception.h
++#define TWOBLUECUBES_CATCH_NOTIMPLEMENTED_EXCEPTION_H_INCLUDED
++
++// #included from: catch_common.h
++#define TWOBLUECUBES_CATCH_COMMON_H_INCLUDED
++
++// #included from: catch_compiler_capabilities.h
++#define TWOBLUECUBES_CATCH_COMPILER_CAPABILITIES_HPP_INCLUDED
++
++// Detect a number of compiler features - mostly C++11/14 conformance - b=
y compiler
++// The following features are defined:
++//
++// CATCH_CONFIG_CPP11_NULLPTR : is nullptr supported?
++// CATCH_CONFIG_CPP11_NOEXCEPT : is noexcept supported?
++// CATCH_CONFIG_CPP11_GENERATED_METHODS : The delete and default keywords=
 for compiler generated methods
++// CATCH_CONFIG_CPP11_IS_ENUM : std::is_enum is supported?
++// CATCH_CONFIG_CPP11_TUPLE : std::tuple is supported
++// CATCH_CONFIG_CPP11_LONG_LONG : is long long supported?
++// CATCH_CONFIG_CPP11_OVERRIDE : is override supported?
++// CATCH_CONFIG_CPP11_UNIQUE_PTR : is unique_ptr supported (otherwise use=
 auto_ptr)
++// CATCH_CONFIG_CPP11_SHUFFLE : is std::shuffle supported?
++// CATCH_CONFIG_CPP11_TYPE_TRAITS : are type_traits and enable_if support=
ed?
++
++// CATCH_CONFIG_CPP11_OR_GREATER : Is C++11 supported?
++
++// CATCH_CONFIG_VARIADIC_MACROS : are variadic macros supported?
++// CATCH_CONFIG_COUNTER : is the __COUNTER__ macro supported?
++// CATCH_CONFIG_WINDOWS_SEH : is Windows SEH supported?
++// CATCH_CONFIG_POSIX_SIGNALS : are POSIX signals supported?
++// ****************
++// Note to maintainers: if new toggles are added please document them
++// in configuration.md, too
++// ****************
++
++// In general each macro has a _NO_<feature name> form
++// (e.g. CATCH_CONFIG_CPP11_NO_NULLPTR) which disables the feature.
++// Many features, at point of detection, define an _INTERNAL_ macro, so t=
hey
++// can be combined, en-mass, with the _NO_ forms later.
++
++// All the C++11 features can be disabled with CATCH_CONFIG_NO_CPP11
++
++#ifdef __cplusplus
++
++#  if __cplusplus >=3D 201103L
++#    define CATCH_CPP11_OR_GREATER
++#  endif
++
++#  if __cplusplus >=3D 201402L
++#    define CATCH_CPP14_OR_GREATER
++#  endif
++
++#endif
++
++#ifdef __clang__
++
++#  if __has_feature(cxx_nullptr)
++#    define CATCH_INTERNAL_CONFIG_CPP11_NULLPTR
++#  endif
++
++#  if __has_feature(cxx_noexcept)
++#    define CATCH_INTERNAL_CONFIG_CPP11_NOEXCEPT
++#  endif
++
++#   if defined(CATCH_CPP11_OR_GREATER)
++#       define CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS \
++            _Pragma( "clang diagnostic push" ) \
++            _Pragma( "clang diagnostic ignored \"-Wexit-time-destructors\=
"" )
++#       define CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS \
++            _Pragma( "clang diagnostic pop" )
++
++#       define CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS \
++            _Pragma( "clang diagnostic push" ) \
++            _Pragma( "clang diagnostic ignored \"-Wparentheses\"" )
++#       define CATCH_INTERNAL_UNSUPPRESS_PARENTHESES_WARNINGS \
++            _Pragma( "clang diagnostic pop" )
++#   endif
++
++#endif // __clang__
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// We know some environments not to support full POSIX signals
++#if defined(__CYGWIN__) || defined(__QNX__)
++
++#   if !defined(CATCH_CONFIG_POSIX_SIGNALS)
++#       define CATCH_INTERNAL_CONFIG_NO_POSIX_SIGNALS
++#   endif
++
++#endif
++
++#ifdef __OS400__
++#       define CATCH_INTERNAL_CONFIG_NO_POSIX_SIGNALS
++#       define CATCH_CONFIG_COLOUR_NONE
++#endif
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// Cygwin
++#ifdef __CYGWIN__
++
++// Required for some versions of Cygwin to declare gettimeofday
++// see: http://stackoverflow.com/questions/36901803/gettimeofday-not-decl=
ared-in-this-scope-cygwin
++#   define _BSD_SOURCE
++
++#endif // __CYGWIN__
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// Borland
++#ifdef __BORLANDC__
++
++#endif // __BORLANDC__
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// EDG
++#ifdef __EDG_VERSION__
++
++#endif // __EDG_VERSION__
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// Digital Mars
++#ifdef __DMC__
++
++#endif // __DMC__
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// GCC
++#ifdef __GNUC__
++
++#   if __GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 6 && defined(__GXX_EXPERI=
MENTAL_CXX0X__)
++#       define CATCH_INTERNAL_CONFIG_CPP11_NULLPTR
++#   endif
++
++// - otherwise more recent versions define __cplusplus >=3D 201103L
++// and will get picked up below
++
++#endif // __GNUC__
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// Visual C++
++#ifdef _MSC_VER
++
++#define CATCH_INTERNAL_CONFIG_WINDOWS_SEH
++
++#if (_MSC_VER >=3D 1600)
++#   define CATCH_INTERNAL_CONFIG_CPP11_NULLPTR
++#   define CATCH_INTERNAL_CONFIG_CPP11_UNIQUE_PTR
++#endif
++
++#if (_MSC_VER >=3D 1900 ) // (VC++ 13 (VS2015))
++#define CATCH_INTERNAL_CONFIG_CPP11_NOEXCEPT
++#define CATCH_INTERNAL_CONFIG_CPP11_GENERATED_METHODS
++#define CATCH_INTERNAL_CONFIG_CPP11_SHUFFLE
++#define CATCH_INTERNAL_CONFIG_CPP11_TYPE_TRAITS
++#endif
++
++#endif // _MSC_VER
++
++/////////////////////////////////////////////////////////////////////////=
///////
++
++// Use variadic macros if the compiler supports them
++#if ( defined _MSC_VER && _MSC_VER > 1400 && !defined __EDGE__) || \
++    ( defined __WAVE__ && __WAVE_HAS_VARIADICS ) || \
++    ( defined __GNUC__ && __GNUC__ >=3D 3 ) || \
++    ( !defined __cplusplus && __STDC_VERSION__ >=3D 199901L || __cplusplu=
s >=3D 201103L )
++
++#define CATCH_INTERNAL_CONFIG_VARIADIC_MACROS
++
++#endif
++
++// Use __COUNTER__ if the compiler supports it
++#if ( defined _MSC_VER && _MSC_VER >=3D 1300 ) || \
++    ( defined __GNUC__  && ( __GNUC__ > 4 || (__GNUC__ =3D=3D 4 && __GNUC=
_MINOR__ >=3D 3 )) ) || \
++    ( defined __clang__ && __clang_major__ >=3D 3 )
++
++// Use of __COUNTER__ is suppressed during code analysis in CLion/AppCode=
 2017.2.x and former,
++// because __COUNTER__ is not properly handled by it.
++// This does not affect compilation
++#if ( !defined __JETBRAINS_IDE__ || __JETBRAINS_IDE__ >=3D 20170300L )
++    #define CATCH_INTERNAL_CONFIG_COUNTER
++#endif
++
++#endif
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// C++ language feature support
++
++// catch all support for C++11
++#if defined(CATCH_CPP11_OR_GREATER)
++
++#  if !defined(CATCH_INTERNAL_CONFIG_CPP11_NULLPTR)
++#    define CATCH_INTERNAL_CONFIG_CPP11_NULLPTR
++#  endif
++
++#  ifndef CATCH_INTERNAL_CONFIG_CPP11_NOEXCEPT
++#    define CATCH_INTERNAL_CONFIG_CPP11_NOEXCEPT
++#  endif
++
++#  ifndef CATCH_INTERNAL_CONFIG_CPP11_GENERATED_METHODS
++#    define CATCH_INTERNAL_CONFIG_CPP11_GENERATED_METHODS
++#  endif
++
++#  ifndef CATCH_INTERNAL_CONFIG_CPP11_IS_ENUM
++#    define CATCH_INTERNAL_CONFIG_CPP11_IS_ENUM
++#  endif
++
++#  ifndef CATCH_INTERNAL_CONFIG_CPP11_TUPLE
++#    define CATCH_INTERNAL_CONFIG_CPP11_TUPLE
++#  endif
++
++#  ifndef CATCH_INTERNAL_CONFIG_VARIADIC_MACROS
++#    define CATCH_INTERNAL_CONFIG_VARIADIC_MACROS
++#  endif
++
++#  if !defined(CATCH_INTERNAL_CONFIG_CPP11_LONG_LONG)
++#    define CATCH_INTERNAL_CONFIG_CPP11_LONG_LONG
++#  endif
++
++#  if !defined(CATCH_INTERNAL_CONFIG_CPP11_OVERRIDE)
++#    define CATCH_INTERNAL_CONFIG_CPP11_OVERRIDE
++#  endif
++#  if !defined(CATCH_INTERNAL_CONFIG_CPP11_UNIQUE_PTR)
++#    define CATCH_INTERNAL_CONFIG_CPP11_UNIQUE_PTR
++#  endif
++# if !defined(CATCH_INTERNAL_CONFIG_CPP11_SHUFFLE)
++#   define CATCH_INTERNAL_CONFIG_CPP11_SHUFFLE
++#  endif
++# if !defined(CATCH_INTERNAL_CONFIG_CPP11_TYPE_TRAITS)
++#  define CATCH_INTERNAL_CONFIG_CPP11_TYPE_TRAITS
++# endif
++
++#endif // __cplusplus >=3D 201103L
++
++// Now set the actual defines based on the above + anything the user has =
configured
++#if defined(CATCH_INTERNAL_CONFIG_CPP11_NULLPTR) && !defined(CATCH_CONFIG=
_CPP11_NO_NULLPTR) && !defined(CATCH_CONFIG_CPP11_NULLPTR) && !defined(CATC=
H_CONFIG_NO_CPP11)
++#   define CATCH_CONFIG_CPP11_NULLPTR
++#endif
++#if defined(CATCH_INTERNAL_CONFIG_CPP11_NOEXCEPT) && !defined(CATCH_CONFI=
G_CPP11_NO_NOEXCEPT) && !defined(CATCH_CONFIG_CPP11_NOEXCEPT) && !defined(C=
ATCH_CONFIG_NO_CPP11)
++#   define CATCH_CONFIG_CPP11_NOEXCEPT
++#endif
++#if defined(CATCH_INTERNAL_CONFIG_CPP11_GENERATED_METHODS) && !defined(CA=
TCH_CONFIG_CPP11_NO_GENERATED_METHODS) && !defined(CATCH_CONFIG_CPP11_GENER=
ATED_METHODS) && !defined(CATCH_CONFIG_NO_CPP11)
++#   define CATCH_CONFIG_CPP11_GENERATED_METHODS
++#endif
++#if defined(CATCH_INTERNAL_CONFIG_CPP11_IS_ENUM) && !defined(CATCH_CONFIG=
_CPP11_NO_IS_ENUM) && !defined(CATCH_CONFIG_CPP11_IS_ENUM) && !defined(CATC=
H_CONFIG_NO_CPP11)
++#   define CATCH_CONFIG_CPP11_IS_ENUM
++#endif
++#if defined(CATCH_INTERNAL_CONFIG_CPP11_TUPLE) && !defined(CATCH_CONFIG_C=
PP11_NO_TUPLE) && !defined(CATCH_CONFIG_CPP11_TUPLE) && !defined(CATCH_CONF=
IG_NO_CPP11)
++#   define CATCH_CONFIG_CPP11_TUPLE
++#endif
++#if defined(CATCH_INTERNAL_CONFIG_VARIADIC_MACROS) && !defined(CATCH_CONF=
IG_NO_VARIADIC_MACROS) && !defined(CATCH_CONFIG_VARIADIC_MACROS)
++#   define CATCH_CONFIG_VARIADIC_MACROS
++#endif
++#if defined(CATCH_INTERNAL_CONFIG_CPP11_LONG_LONG) && !defined(CATCH_CONF=
IG_CPP11_NO_LONG_LONG) && !defined(CATCH_CONFIG_CPP11_LONG_LONG) && !define=
d(CATCH_CONFIG_NO_CPP11)
++#   define CATCH_CONFIG_CPP11_LONG_LONG
++#endif
++#if defined(CATCH_INTERNAL_CONFIG_CPP11_OVERRIDE) && !defined(CATCH_CONFI=
G_CPP11_NO_OVERRIDE) && !defined(CATCH_CONFIG_CPP11_OVERRIDE) && !defined(C=
ATCH_CONFIG_NO_CPP11)
++#   define CATCH_CONFIG_CPP11_OVERRIDE
++#endif
++#if defined(CATCH_INTERNAL_CONFIG_CPP11_UNIQUE_PTR) && !defined(CATCH_CON=
FIG_CPP11_NO_UNIQUE_PTR) && !defined(CATCH_CONFIG_CPP11_UNIQUE_PTR) && !def=
ined(CATCH_CONFIG_NO_CPP11)
++#   define CATCH_CONFIG_CPP11_UNIQUE_PTR
++#endif
++#if defined(CATCH_INTERNAL_CONFIG_COUNTER) && !defined(CATCH_CONFIG_NO_CO=
UNTER) && !defined(CATCH_CONFIG_COUNTER)
++#   define CATCH_CONFIG_COUNTER
++#endif
++#if defined(CATCH_INTERNAL_CONFIG_CPP11_SHUFFLE) && !defined(CATCH_CONFIG=
_CPP11_NO_SHUFFLE) && !defined(CATCH_CONFIG_CPP11_SHUFFLE) && !defined(CATC=
H_CONFIG_NO_CPP11)
++#   define CATCH_CONFIG_CPP11_SHUFFLE
++#endif
++# if defined(CATCH_INTERNAL_CONFIG_CPP11_TYPE_TRAITS) && !defined(CATCH_C=
ONFIG_CPP11_NO_TYPE_TRAITS) && !defined(CATCH_CONFIG_CPP11_TYPE_TRAITS) && =
!defined(CATCH_CONFIG_NO_CPP11)
++#  define CATCH_CONFIG_CPP11_TYPE_TRAITS
++# endif
++#if defined(CATCH_INTERNAL_CONFIG_WINDOWS_SEH) && !defined(CATCH_CONFIG_N=
O_WINDOWS_SEH) && !defined(CATCH_CONFIG_WINDOWS_SEH)
++#   define CATCH_CONFIG_WINDOWS_SEH
++#endif
++// This is set by default, because we assume that unix compilers are posi=
x-signal-compatible by default.
++#if !defined(CATCH_INTERNAL_CONFIG_NO_POSIX_SIGNALS) && !defined(CATCH_CO=
NFIG_NO_POSIX_SIGNALS) && !defined(CATCH_CONFIG_POSIX_SIGNALS)
++#   define CATCH_CONFIG_POSIX_SIGNALS
++#endif
++
++#if !defined(CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS)
++#   define CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS
++#   define CATCH_INTERNAL_UNSUPPRESS_PARENTHESES_WARNINGS
++#endif
++#if !defined(CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS)
++#   define CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS
++#   define CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS
++#endif
++
++// noexcept support:
++#if defined(CATCH_CONFIG_CPP11_NOEXCEPT) && !defined(CATCH_NOEXCEPT)
++#  define CATCH_NOEXCEPT noexcept
++#  define CATCH_NOEXCEPT_IS(x) noexcept(x)
++#else
++#  define CATCH_NOEXCEPT throw()
++#  define CATCH_NOEXCEPT_IS(x)
++#endif
++
++// nullptr support
++#ifdef CATCH_CONFIG_CPP11_NULLPTR
++#   define CATCH_NULL nullptr
++#else
++#   define CATCH_NULL NULL
++#endif
++
++// override support
++#ifdef CATCH_CONFIG_CPP11_OVERRIDE
++#   define CATCH_OVERRIDE override
++#else
++#   define CATCH_OVERRIDE
++#endif
++
++// unique_ptr support
++#ifdef CATCH_CONFIG_CPP11_UNIQUE_PTR
++#   define CATCH_AUTO_PTR( T ) std::unique_ptr<T>
++#else
++#   define CATCH_AUTO_PTR( T ) std::auto_ptr<T>
++#endif
++
++#define INTERNAL_CATCH_UNIQUE_NAME_LINE2( name, line ) name##line
++#define INTERNAL_CATCH_UNIQUE_NAME_LINE( name, line ) INTERNAL_CATCH_UNIQ=
UE_NAME_LINE2( name, line )
++#ifdef CATCH_CONFIG_COUNTER
++#  define INTERNAL_CATCH_UNIQUE_NAME( name ) INTERNAL_CATCH_UNIQUE_NAME_L=
INE( name, __COUNTER__ )
++#else
++#  define INTERNAL_CATCH_UNIQUE_NAME( name ) INTERNAL_CATCH_UNIQUE_NAME_L=
INE( name, __LINE__ )
++#endif
++
++#define INTERNAL_CATCH_STRINGIFY2( expr ) #expr
++#define INTERNAL_CATCH_STRINGIFY( expr ) INTERNAL_CATCH_STRINGIFY2( expr )
++
++#include <sstream>
++#include <algorithm>
++
++namespace Catch {
++
++    struct IConfig;
++
++    struct CaseSensitive { enum Choice {
++        Yes,
++        No
++    }; };
++
++    class NonCopyable {
++#ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS
++        NonCopyable( NonCopyable const& )              =3D delete;
++        NonCopyable( NonCopyable && )                  =3D delete;
++        NonCopyable& operator =3D ( NonCopyable const& ) =3D delete;
++        NonCopyable& operator =3D ( NonCopyable && )     =3D delete;
++#else
++        NonCopyable( NonCopyable const& info );
++        NonCopyable& operator =3D ( NonCopyable const& );
++#endif
++
++    protected:
++        NonCopyable() {}
++        virtual ~NonCopyable();
++    };
++
++    class SafeBool {
++    public:
++        typedef void (SafeBool::*type)() const;
++
++        static type makeSafe( bool value ) {
++            return value ? &SafeBool::trueValue : 0;
++        }
++    private:
++        void trueValue() const {}
++    };
++
++    template<typename ContainerT>
++    void deleteAll( ContainerT& container ) {
++        typename ContainerT::const_iterator it =3D container.begin();
++        typename ContainerT::const_iterator itEnd =3D container.end();
++        for(; it !=3D itEnd; ++it )
++            delete *it;
++    }
++    template<typename AssociativeContainerT>
++    void deleteAllValues( AssociativeContainerT& container ) {
++        typename AssociativeContainerT::const_iterator it =3D container.b=
egin();
++        typename AssociativeContainerT::const_iterator itEnd =3D containe=
r.end();
++        for(; it !=3D itEnd; ++it )
++            delete it->second;
++    }
++
++    bool startsWith( std::string const& s, std::string const& prefix );
++    bool startsWith( std::string const& s, char prefix );
++    bool endsWith( std::string const& s, std::string const& suffix );
++    bool endsWith( std::string const& s, char suffix );
++    bool contains( std::string const& s, std::string const& infix );
++    void toLowerInPlace( std::string& s );
++    std::string toLower( std::string const& s );
++    std::string trim( std::string const& str );
++    bool replaceInPlace( std::string& str, std::string const& replaceThis=
, std::string const& withThis );
++
++    struct pluralise {
++        pluralise( std::size_t count, std::string const& label );
++
++        friend std::ostream& operator << ( std::ostream& os, pluralise co=
nst& pluraliser );
++
++        std::size_t m_count;
++        std::string m_label;
++    };
++
++    struct SourceLineInfo {
++
++        SourceLineInfo();
++        SourceLineInfo( char const* _file, std::size_t _line );
++#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS
++        SourceLineInfo(SourceLineInfo const& other)          =3D default;
++        SourceLineInfo( SourceLineInfo && )                  =3D default;
++        SourceLineInfo& operator =3D ( SourceLineInfo const& ) =3D defaul=
t;
++        SourceLineInfo& operator =3D ( SourceLineInfo && )     =3D defaul=
t;
++#  endif
++        bool empty() const;
++        bool operator =3D=3D ( SourceLineInfo const& other ) const;
++        bool operator < ( SourceLineInfo const& other ) const;
++
++        char const* file;
++        std::size_t line;
++    };
++
++    std::ostream& operator << ( std::ostream& os, SourceLineInfo const& i=
nfo );
++
++    // This is just here to avoid compiler warnings with macro constants =
and boolean literals
++    inline bool isTrue( bool value ){ return value; }
++    inline bool alwaysTrue() { return true; }
++    inline bool alwaysFalse() { return false; }
++
++    void throwLogicError( std::string const& message, SourceLineInfo cons=
t& locationInfo );
++
++    void seedRng( IConfig const& config );
++    unsigned int rngSeed();
++
++    // Use this in variadic streaming macros to allow
++    //    >> +StreamEndStop
++    // as well as
++    //    >> stuff +StreamEndStop
++    struct StreamEndStop {
++        std::string operator+() {
++            return std::string();
++        }
++    };
++    template<typename T>
++    T const& operator + ( T const& value, StreamEndStop ) {
++        return value;
++    }
++}
++
++#define CATCH_INTERNAL_LINEINFO ::Catch::SourceLineInfo( __FILE__, static=
_cast<std::size_t>( __LINE__ ) )
++#define CATCH_INTERNAL_ERROR( msg ) ::Catch::throwLogicError( msg, CATCH_=
INTERNAL_LINEINFO );
++
++namespace Catch {
++
++    class NotImplementedException : public std::exception
++    {
++    public:
++        NotImplementedException( SourceLineInfo const& lineInfo );
++
++        virtual ~NotImplementedException() CATCH_NOEXCEPT {}
++
++        virtual const char* what() const CATCH_NOEXCEPT;
++
++    private:
++        std::string m_what;
++        SourceLineInfo m_lineInfo;
++    };
++
++} // end namespace Catch
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define CATCH_NOT_IMPLEMENTED throw Catch::NotImplementedException( CATCH=
_INTERNAL_LINEINFO )
++
++// #included from: internal/catch_context.h
++#define TWOBLUECUBES_CATCH_CONTEXT_H_INCLUDED
++
++// #included from: catch_interfaces_generators.h
++#define TWOBLUECUBES_CATCH_INTERFACES_GENERATORS_H_INCLUDED
++
++#include <string>
++
++namespace Catch {
++
++    struct IGeneratorInfo {
++        virtual ~IGeneratorInfo();
++        virtual bool moveNext() =3D 0;
++        virtual std::size_t getCurrentIndex() const =3D 0;
++    };
++
++    struct IGeneratorsForTest {
++        virtual ~IGeneratorsForTest();
++
++        virtual IGeneratorInfo& getGeneratorInfo( std::string const& file=
Info, std::size_t size ) =3D 0;
++        virtual bool moveNext() =3D 0;
++    };
++
++    IGeneratorsForTest* createGeneratorsForTest();
++
++} // end namespace Catch
++
++// #included from: catch_ptr.hpp
++#define TWOBLUECUBES_CATCH_PTR_HPP_INCLUDED
++
++#ifdef __clang__
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wpadded"
++#endif
++
++namespace Catch {
++
++    // An intrusive reference counting smart pointer.
++    // T must implement addRef() and release() methods
++    // typically implementing the IShared interface
++    template<typename T>
++    class Ptr {
++    public:
++        Ptr() : m_p( CATCH_NULL ){}
++        Ptr( T* p ) : m_p( p ){
++            if( m_p )
++                m_p->addRef();
++        }
++        Ptr( Ptr const& other ) : m_p( other.m_p ){
++            if( m_p )
++                m_p->addRef();
++        }
++        ~Ptr(){
++            if( m_p )
++                m_p->release();
++        }
++        void reset() {
++            if( m_p )
++                m_p->release();
++            m_p =3D CATCH_NULL;
++        }
++        Ptr& operator =3D ( T* p ){
++            Ptr temp( p );
++            swap( temp );
++            return *this;
++        }
++        Ptr& operator =3D ( Ptr const& other ){
++            Ptr temp( other );
++            swap( temp );
++            return *this;
++        }
++        void swap( Ptr& other ) { std::swap( m_p, other.m_p ); }
++        T* get() const{ return m_p; }
++        T& operator*() const { return *m_p; }
++        T* operator->() const { return m_p; }
++        bool operator !() const { return m_p =3D=3D CATCH_NULL; }
++        operator SafeBool::type() const { return SafeBool::makeSafe( m_p =
!=3D CATCH_NULL ); }
++
++    private:
++        T* m_p;
++    };
++
++    struct IShared : NonCopyable {
++        virtual ~IShared();
++        virtual void addRef() const =3D 0;
++        virtual void release() const =3D 0;
++    };
++
++    template<typename T =3D IShared>
++    struct SharedImpl : T {
++
++        SharedImpl() : m_rc( 0 ){}
++
++        virtual void addRef() const {
++            ++m_rc;
++        }
++        virtual void release() const {
++            if( --m_rc =3D=3D 0 )
++                delete this;
++        }
++
++        mutable unsigned int m_rc;
++    };
++
++} // end namespace Catch
++
++#ifdef __clang__
++#pragma clang diagnostic pop
++#endif
++
++namespace Catch {
++
++    class TestCase;
++    class Stream;
++    struct IResultCapture;
++    struct IRunner;
++    struct IGeneratorsForTest;
++    struct IConfig;
++
++    struct IContext
++    {
++        virtual ~IContext();
++
++        virtual IResultCapture* getResultCapture() =3D 0;
++        virtual IRunner* getRunner() =3D 0;
++        virtual size_t getGeneratorIndex( std::string const& fileInfo, si=
ze_t totalSize ) =3D 0;
++        virtual bool advanceGeneratorsForCurrentTest() =3D 0;
++        virtual Ptr<IConfig const> getConfig() const =3D 0;
++    };
++
++    struct IMutableContext : IContext
++    {
++        virtual ~IMutableContext();
++        virtual void setResultCapture( IResultCapture* resultCapture ) =
=3D 0;
++        virtual void setRunner( IRunner* runner ) =3D 0;
++        virtual void setConfig( Ptr<IConfig const> const& config ) =3D 0;
++    };
++
++    IContext& getCurrentContext();
++    IMutableContext& getCurrentMutableContext();
++    void cleanUpContext();
++    Stream createStream( std::string const& streamName );
++
++}
++
++// #included from: internal/catch_test_registry.hpp
++#define TWOBLUECUBES_CATCH_TEST_REGISTRY_HPP_INCLUDED
++
++// #included from: catch_interfaces_testcase.h
++#define TWOBLUECUBES_CATCH_INTERFACES_TESTCASE_H_INCLUDED
++
++#include <vector>
++
++namespace Catch {
++
++    class TestSpec;
++
++    struct ITestCase : IShared {
++        virtual void invoke () const =3D 0;
++    protected:
++        virtual ~ITestCase();
++    };
++
++    class TestCase;
++    struct IConfig;
++
++    struct ITestCaseRegistry {
++        virtual ~ITestCaseRegistry();
++        virtual std::vector<TestCase> const& getAllTests() const =3D 0;
++        virtual std::vector<TestCase> const& getAllTestsSorted( IConfig c=
onst& config ) const =3D 0;
++    };
++
++    bool matchTest( TestCase const& testCase, TestSpec const& testSpec, I=
Config const& config );
++    std::vector<TestCase> filterTests( std::vector<TestCase> const& testC=
ases, TestSpec const& testSpec, IConfig const& config );
++    std::vector<TestCase> const& getAllTestCasesSorted( IConfig const& co=
nfig );
++
++}
++
++namespace Catch {
++
++template<typename C>
++class MethodTestCase : public SharedImpl<ITestCase> {
++
++public:
++    MethodTestCase( void (C::*method)() ) : m_method( method ) {}
++
++    virtual void invoke() const {
++        C obj;
++        (obj.*m_method)();
++    }
++
++private:
++    virtual ~MethodTestCase() {}
++
++    void (C::*m_method)();
++};
++
++typedef void(*TestFunction)();
++
++struct NameAndDesc {
++    NameAndDesc( const char* _name =3D "", const char* _description=3D ""=
 )
++    : name( _name ), description( _description )
++    {}
++
++    const char* name;
++    const char* description;
++};
++
++void registerTestCase
++    (   ITestCase* testCase,
++        char const* className,
++        NameAndDesc const& nameAndDesc,
++        SourceLineInfo const& lineInfo );
++
++struct AutoReg {
++
++    AutoReg
++        (   TestFunction function,
++            SourceLineInfo const& lineInfo,
++            NameAndDesc const& nameAndDesc );
++
++    template<typename C>
++    AutoReg
++        (   void (C::*method)(),
++            char const* className,
++            NameAndDesc const& nameAndDesc,
++            SourceLineInfo const& lineInfo ) {
++
++        registerTestCase
++            (   new MethodTestCase<C>( method ),
++                className,
++                nameAndDesc,
++                lineInfo );
++    }
++
++    ~AutoReg();
++
++private:
++    AutoReg( AutoReg const& );
++    void operator=3D ( AutoReg const& );
++};
++
++void registerTestCaseFunction
++    (   TestFunction function,
++        SourceLineInfo const& lineInfo,
++        NameAndDesc const& nameAndDesc );
++
++} // end namespace Catch
++
++#ifdef CATCH_CONFIG_VARIADIC_MACROS
++    /////////////////////////////////////////////////////////////////////=
//////////
++    #define INTERNAL_CATCH_TESTCASE2( TestName, ... ) \
++        static void TestName(); \
++        CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS \
++        namespace{ Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistr=
ar )( &TestName, CATCH_INTERNAL_LINEINFO, Catch::NameAndDesc( __VA_ARGS__ )=
 ); } /* NOLINT */ \
++        CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS \
++        static void TestName()
++    #define INTERNAL_CATCH_TESTCASE( ... ) \
++        INTERNAL_CATCH_TESTCASE2( INTERNAL_CATCH_UNIQUE_NAME( ____C_A_T_C=
_H____T_E_S_T____ ), __VA_ARGS__ )
++
++    /////////////////////////////////////////////////////////////////////=
//////////
++    #define INTERNAL_CATCH_METHOD_AS_TEST_CASE( QualifiedMethod, ... ) \
++        CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS \
++        namespace{ Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistr=
ar )( &QualifiedMethod, "&" #QualifiedMethod, Catch::NameAndDesc( __VA_ARGS=
__ ), CATCH_INTERNAL_LINEINFO ); } /* NOLINT */ \
++        CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS
++
++    /////////////////////////////////////////////////////////////////////=
//////////
++    #define INTERNAL_CATCH_TEST_CASE_METHOD2( TestName, ClassName, ... )\
++        CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS \
++        namespace{ \
++            struct TestName : ClassName{ \
++                void test(); \
++            }; \
++            Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistrar ) ( =
&TestName::test, #ClassName, Catch::NameAndDesc( __VA_ARGS__ ), CATCH_INTER=
NAL_LINEINFO ); /* NOLINT */ \
++        } \
++        CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS \
++        void TestName::test()
++    #define INTERNAL_CATCH_TEST_CASE_METHOD( ClassName, ... ) \
++        INTERNAL_CATCH_TEST_CASE_METHOD2( INTERNAL_CATCH_UNIQUE_NAME( ___=
_C_A_T_C_H____T_E_S_T____ ), ClassName, __VA_ARGS__ )
++
++    /////////////////////////////////////////////////////////////////////=
//////////
++    #define INTERNAL_CATCH_REGISTER_TESTCASE( Function, ... ) \
++        CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS \
++        Catch::AutoReg( Function, CATCH_INTERNAL_LINEINFO, Catch::NameAnd=
Desc( __VA_ARGS__ ) ); /* NOLINT */ \
++        CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS
++
++#else
++    /////////////////////////////////////////////////////////////////////=
//////////
++    #define INTERNAL_CATCH_TESTCASE2( TestName, Name, Desc ) \
++        static void TestName(); \
++        CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS \
++        namespace{ Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistr=
ar )( &TestName, CATCH_INTERNAL_LINEINFO, Catch::NameAndDesc( Name, Desc ) =
); } /* NOLINT */ \
++        CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS \
++        static void TestName()
++    #define INTERNAL_CATCH_TESTCASE( Name, Desc ) \
++        INTERNAL_CATCH_TESTCASE2( INTERNAL_CATCH_UNIQUE_NAME( ____C_A_T_C=
_H____T_E_S_T____ ), Name, Desc )
++
++    /////////////////////////////////////////////////////////////////////=
//////////
++    #define INTERNAL_CATCH_METHOD_AS_TEST_CASE( QualifiedMethod, Name, De=
sc ) \
++        CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS \
++        namespace{ Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistr=
ar )( &QualifiedMethod, "&" #QualifiedMethod, Catch::NameAndDesc( Name, Des=
c ), CATCH_INTERNAL_LINEINFO ); } /* NOLINT */ \
++        CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS
++
++    /////////////////////////////////////////////////////////////////////=
//////////
++    #define INTERNAL_CATCH_TEST_CASE_METHOD2( TestCaseName, ClassName, Te=
stName, Desc )\
++        CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS \
++        namespace{ \
++            struct TestCaseName : ClassName{ \
++                void test(); \
++            }; \
++            Catch::AutoReg INTERNAL_CATCH_UNIQUE_NAME( autoRegistrar ) ( =
&TestCaseName::test, #ClassName, Catch::NameAndDesc( TestName, Desc ), CATC=
H_INTERNAL_LINEINFO ); /* NOLINT */ \
++        } \
++        CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS \
++        void TestCaseName::test()
++    #define INTERNAL_CATCH_TEST_CASE_METHOD( ClassName, TestName, Desc )\
++        INTERNAL_CATCH_TEST_CASE_METHOD2( INTERNAL_CATCH_UNIQUE_NAME( ___=
_C_A_T_C_H____T_E_S_T____ ), ClassName, TestName, Desc )
++
++    /////////////////////////////////////////////////////////////////////=
//////////
++    #define INTERNAL_CATCH_REGISTER_TESTCASE( Function, Name, Desc ) \
++        CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS \
++        Catch::AutoReg( Function, CATCH_INTERNAL_LINEINFO, Catch::NameAnd=
Desc( Name, Desc ) ); /* NOLINT */ \
++        CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS
++
++#endif
++
++// #included from: internal/catch_capture.hpp
++#define TWOBLUECUBES_CATCH_CAPTURE_HPP_INCLUDED
++
++// #included from: catch_result_builder.h
++#define TWOBLUECUBES_CATCH_RESULT_BUILDER_H_INCLUDED
++
++// #included from: catch_result_type.h
++#define TWOBLUECUBES_CATCH_RESULT_TYPE_H_INCLUDED
++
++namespace Catch {
++
++    // ResultWas::OfType enum
++    struct ResultWas { enum OfType {
++        Unknown =3D -1,
++        Ok =3D 0,
++        Info =3D 1,
++        Warning =3D 2,
++
++        FailureBit =3D 0x10,
++
++        ExpressionFailed =3D FailureBit | 1,
++        ExplicitFailure =3D FailureBit | 2,
++
++        Exception =3D 0x100 | FailureBit,
++
++        ThrewException =3D Exception | 1,
++        DidntThrowException =3D Exception | 2,
++
++        FatalErrorCondition =3D 0x200 | FailureBit
++
++    }; };
++
++    inline bool isOk( ResultWas::OfType resultType ) {
++        return ( resultType & ResultWas::FailureBit ) =3D=3D 0;
++    }
++    inline bool isJustInfo( int flags ) {
++        return flags =3D=3D ResultWas::Info;
++    }
++
++    // ResultDisposition::Flags enum
++    struct ResultDisposition { enum Flags {
++        Normal =3D 0x01,
++
++        ContinueOnFailure =3D 0x02,   // Failures fail test, but executio=
n continues
++        FalseTest =3D 0x04,           // Prefix expression with !
++        SuppressFail =3D 0x08         // Failures are reported but do not=
 fail the test
++    }; };
++
++    inline ResultDisposition::Flags operator | ( ResultDisposition::Flags=
 lhs, ResultDisposition::Flags rhs ) {
++        return static_cast<ResultDisposition::Flags>( static_cast<int>( l=
hs ) | static_cast<int>( rhs ) );
++    }
++
++    inline bool shouldContinueOnFailure( int flags )    { return ( flags =
& ResultDisposition::ContinueOnFailure ) !=3D 0; }
++    inline bool isFalseTest( int flags )                { return ( flags =
& ResultDisposition::FalseTest ) !=3D 0; }
++    inline bool shouldSuppressFailure( int flags )      { return ( flags =
& ResultDisposition::SuppressFail ) !=3D 0; }
++
++} // end namespace Catch
++
++// #included from: catch_assertionresult.h
++#define TWOBLUECUBES_CATCH_ASSERTIONRESULT_H_INCLUDED
++
++#include <string>
++
++namespace Catch {
++
++    struct STATIC_ASSERT_Expression_Too_Complex_Please_Rewrite_As_Binary_=
Comparison;
++
++    struct DecomposedExpression
++    {
++        virtual ~DecomposedExpression() {}
++        virtual bool isBinaryExpression() const {
++            return false;
++        }
++        virtual void reconstructExpression( std::string& dest ) const =3D=
 0;
++
++        // Only simple binary comparisons can be decomposed.
++        // If more complex check is required then wrap sub-expressions in=
 parentheses.
++        template<typename T> STATIC_ASSERT_Expression_Too_Complex_Please_=
Rewrite_As_Binary_Comparison& operator + ( T const& );
++        template<typename T> STATIC_ASSERT_Expression_Too_Complex_Please_=
Rewrite_As_Binary_Comparison& operator - ( T const& );
++        template<typename T> STATIC_ASSERT_Expression_Too_Complex_Please_=
Rewrite_As_Binary_Comparison& operator * ( T const& );
++        template<typename T> STATIC_ASSERT_Expression_Too_Complex_Please_=
Rewrite_As_Binary_Comparison& operator / ( T const& );
++        template<typename T> STATIC_ASSERT_Expression_Too_Complex_Please_=
Rewrite_As_Binary_Comparison& operator % ( T const& );
++        template<typename T> STATIC_ASSERT_Expression_Too_Complex_Please_=
Rewrite_As_Binary_Comparison& operator && ( T const& );
++        template<typename T> STATIC_ASSERT_Expression_Too_Complex_Please_=
Rewrite_As_Binary_Comparison& operator || ( T const& );
++
++    private:
++        DecomposedExpression& operator =3D (DecomposedExpression const&);
++    };
++
++    struct AssertionInfo
++    {
++        AssertionInfo();
++        AssertionInfo(  char const * _macroName,
++                        SourceLineInfo const& _lineInfo,
++                        char const * _capturedExpression,
++                        ResultDisposition::Flags _resultDisposition,
++                        char const * _secondArg =3D "");
++
++        char const * macroName;
++        SourceLineInfo lineInfo;
++        char const * capturedExpression;
++        ResultDisposition::Flags resultDisposition;
++        char const * secondArg;
++    };
++
++    struct AssertionResultData
++    {
++        AssertionResultData() : decomposedExpression( CATCH_NULL )
++                              , resultType( ResultWas::Unknown )
++                              , negated( false )
++                              , parenthesized( false ) {}
++
++        void negate( bool parenthesize ) {
++            negated =3D !negated;
++            parenthesized =3D parenthesize;
++            if( resultType =3D=3D ResultWas::Ok )
++                resultType =3D ResultWas::ExpressionFailed;
++            else if( resultType =3D=3D ResultWas::ExpressionFailed )
++                resultType =3D ResultWas::Ok;
++        }
++
++        std::string const& reconstructExpression() const {
++            if( decomposedExpression !=3D CATCH_NULL ) {
++                decomposedExpression->reconstructExpression( reconstructe=
dExpression );
++                if( parenthesized ) {
++                    reconstructedExpression.insert( 0, 1, '(' );
++                    reconstructedExpression.append( 1, ')' );
++                }
++                if( negated ) {
++                    reconstructedExpression.insert( 0, 1, '!' );
++                }
++                decomposedExpression =3D CATCH_NULL;
++            }
++            return reconstructedExpression;
++        }
++
++        mutable DecomposedExpression const* decomposedExpression;
++        mutable std::string reconstructedExpression;
++        std::string message;
++        ResultWas::OfType resultType;
++        bool negated;
++        bool parenthesized;
++    };
++
++    class AssertionResult {
++    public:
++        AssertionResult();
++        AssertionResult( AssertionInfo const& info, AssertionResultData c=
onst& data );
++        ~AssertionResult();
++#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS
++         AssertionResult( AssertionResult const& )              =3D defau=
lt;
++         AssertionResult( AssertionResult && )                  =3D defau=
lt;
++         AssertionResult& operator =3D ( AssertionResult const& ) =3D def=
ault;
++         AssertionResult& operator =3D ( AssertionResult && )     =3D def=
ault;
++#  endif
++
++        bool isOk() const;
++        bool succeeded() const;
++        ResultWas::OfType getResultType() const;
++        bool hasExpression() const;
++        bool hasMessage() const;
++        std::string getExpression() const;
++        std::string getExpressionInMacro() const;
++        bool hasExpandedExpression() const;
++        std::string getExpandedExpression() const;
++        std::string getMessage() const;
++        SourceLineInfo getSourceInfo() const;
++        std::string getTestMacroName() const;
++        void discardDecomposedExpression() const;
++        void expandDecomposedExpression() const;
++
++    protected:
++        AssertionInfo m_info;
++        AssertionResultData m_resultData;
++    };
++
++} // end namespace Catch
++
++// #included from: catch_matchers.hpp
++#define TWOBLUECUBES_CATCH_MATCHERS_HPP_INCLUDED
++
++namespace Catch {
++namespace Matchers {
++    namespace Impl {
++
++        template<typename ArgT> struct MatchAllOf;
++        template<typename ArgT> struct MatchAnyOf;
++        template<typename ArgT> struct MatchNotOf;
++
++        class MatcherUntypedBase {
++        public:
++            std::string toString() const {
++                if( m_cachedToString.empty() )
++                    m_cachedToString =3D describe();
++                return m_cachedToString;
++            }
++
++        protected:
++            virtual ~MatcherUntypedBase();
++            virtual std::string describe() const =3D 0;
++            mutable std::string m_cachedToString;
++        private:
++            MatcherUntypedBase& operator =3D ( MatcherUntypedBase const& =
);
++        };
++
++        template<typename ObjectT>
++        struct MatcherMethod {
++            virtual bool match( ObjectT const& arg ) const =3D 0;
++        };
++        template<typename PtrT>
++        struct MatcherMethod<PtrT*> {
++            virtual bool match( PtrT* arg ) const =3D 0;
++        };
++
++        template<typename ObjectT, typename ComparatorT =3D ObjectT>
++        struct MatcherBase : MatcherUntypedBase, MatcherMethod<ObjectT> {
++
++            MatchAllOf<ComparatorT> operator && ( MatcherBase const& othe=
r ) const;
++            MatchAnyOf<ComparatorT> operator || ( MatcherBase const& othe=
r ) const;
++            MatchNotOf<ComparatorT> operator ! () const;
++        };
++
++        template<typename ArgT>
++        struct MatchAllOf : MatcherBase<ArgT> {
++            virtual bool match( ArgT const& arg ) const CATCH_OVERRIDE {
++                for( std::size_t i =3D 0; i < m_matchers.size(); ++i ) {
++                    if (!m_matchers[i]->match(arg))
++                        return false;
++                }
++                return true;
++            }
++            virtual std::string describe() const CATCH_OVERRIDE {
++                std::string description;
++                description.reserve( 4 + m_matchers.size()*32 );
++                description +=3D "( ";
++                for( std::size_t i =3D 0; i < m_matchers.size(); ++i ) {
++                    if( i !=3D 0 )
++                        description +=3D " and ";
++                    description +=3D m_matchers[i]->toString();
++                }
++                description +=3D " )";
++                return description;
++            }
++
++            MatchAllOf<ArgT>& operator && ( MatcherBase<ArgT> const& othe=
r ) {
++                m_matchers.push_back( &other );
++                return *this;
++            }
++
++            std::vector<MatcherBase<ArgT> const*> m_matchers;
++        };
++        template<typename ArgT>
++        struct MatchAnyOf : MatcherBase<ArgT> {
++
++            virtual bool match( ArgT const& arg ) const CATCH_OVERRIDE {
++                for( std::size_t i =3D 0; i < m_matchers.size(); ++i ) {
++                    if (m_matchers[i]->match(arg))
++                        return true;
++                }
++                return false;
++            }
++            virtual std::string describe() const CATCH_OVERRIDE {
++                std::string description;
++                description.reserve( 4 + m_matchers.size()*32 );
++                description +=3D "( ";
++                for( std::size_t i =3D 0; i < m_matchers.size(); ++i ) {
++                    if( i !=3D 0 )
++                        description +=3D " or ";
++                    description +=3D m_matchers[i]->toString();
++                }
++                description +=3D " )";
++                return description;
++            }
++
++            MatchAnyOf<ArgT>& operator || ( MatcherBase<ArgT> const& othe=
r ) {
++                m_matchers.push_back( &other );
++                return *this;
++            }
++
++            std::vector<MatcherBase<ArgT> const*> m_matchers;
++        };
++
++        template<typename ArgT>
++        struct MatchNotOf : MatcherBase<ArgT> {
++
++            MatchNotOf( MatcherBase<ArgT> const& underlyingMatcher ) : m_=
underlyingMatcher( underlyingMatcher ) {}
++
++            virtual bool match( ArgT const& arg ) const CATCH_OVERRIDE {
++                return !m_underlyingMatcher.match( arg );
++            }
++
++            virtual std::string describe() const CATCH_OVERRIDE {
++                return "not " + m_underlyingMatcher.toString();
++            }
++            MatcherBase<ArgT> const& m_underlyingMatcher;
++        };
++
++        template<typename ObjectT, typename ComparatorT>
++        MatchAllOf<ComparatorT> MatcherBase<ObjectT, ComparatorT>::operat=
or && ( MatcherBase const& other ) const {
++            return MatchAllOf<ComparatorT>() && *this && other;
++        }
++        template<typename ObjectT, typename ComparatorT>
++        MatchAnyOf<ComparatorT> MatcherBase<ObjectT, ComparatorT>::operat=
or || ( MatcherBase const& other ) const {
++            return MatchAnyOf<ComparatorT>() || *this || other;
++        }
++        template<typename ObjectT, typename ComparatorT>
++        MatchNotOf<ComparatorT> MatcherBase<ObjectT, ComparatorT>::operat=
or ! () const {
++            return MatchNotOf<ComparatorT>( *this );
++        }
++
++    } // namespace Impl
++
++    // The following functions create the actual matcher objects.
++    // This allows the types to be inferred
++    // - deprecated: prefer ||, && and !
++    template<typename T>
++    Impl::MatchNotOf<T> Not( Impl::MatcherBase<T> const& underlyingMatche=
r ) {
++        return Impl::MatchNotOf<T>( underlyingMatcher );
++    }
++    template<typename T>
++    Impl::MatchAllOf<T> AllOf( Impl::MatcherBase<T> const& m1, Impl::Matc=
herBase<T> const& m2 ) {
++        return Impl::MatchAllOf<T>() && m1 && m2;
++    }
++    template<typename T>
++    Impl::MatchAllOf<T> AllOf( Impl::MatcherBase<T> const& m1, Impl::Matc=
herBase<T> const& m2, Impl::MatcherBase<T> const& m3 ) {
++        return Impl::MatchAllOf<T>() && m1 && m2 && m3;
++    }
++    template<typename T>
++    Impl::MatchAnyOf<T> AnyOf( Impl::MatcherBase<T> const& m1, Impl::Matc=
herBase<T> const& m2 ) {
++        return Impl::MatchAnyOf<T>() || m1 || m2;
++    }
++    template<typename T>
++    Impl::MatchAnyOf<T> AnyOf( Impl::MatcherBase<T> const& m1, Impl::Matc=
herBase<T> const& m2, Impl::MatcherBase<T> const& m3 ) {
++        return Impl::MatchAnyOf<T>() || m1 || m2 || m3;
++    }
++
++} // namespace Matchers
++
++using namespace Matchers;
++using Matchers::Impl::MatcherBase;
++
++} // namespace Catch
++
++namespace Catch {
++
++    struct TestFailureException{};
++
++    template<typename T> class ExpressionLhs;
++
++    struct CopyableStream {
++        CopyableStream() {}
++        CopyableStream( CopyableStream const& other ) {
++            oss << other.oss.str();
++        }
++        CopyableStream& operator=3D( CopyableStream const& other ) {
++            oss.str(std::string());
++            oss << other.oss.str();
++            return *this;
++        }
++        std::ostringstream oss;
++    };
++
++    class ResultBuilder : public DecomposedExpression {
++    public:
++        ResultBuilder(  char const* macroName,
++                        SourceLineInfo const& lineInfo,
++                        char const* capturedExpression,
++                        ResultDisposition::Flags resultDisposition,
++                        char const* secondArg =3D "" );
++        ~ResultBuilder();
++
++        template<typename T>
++        ExpressionLhs<T const&> operator <=3D ( T const& operand );
++        ExpressionLhs<bool> operator <=3D ( bool value );
++
++        template<typename T>
++        ResultBuilder& operator << ( T const& value ) {
++            stream().oss << value;
++            return *this;
++        }
++
++        ResultBuilder& setResultType( ResultWas::OfType result );
++        ResultBuilder& setResultType( bool result );
++
++        void endExpression( DecomposedExpression const& expr );
++
++        virtual void reconstructExpression( std::string& dest ) const CAT=
CH_OVERRIDE;
++
++        AssertionResult build() const;
++        AssertionResult build( DecomposedExpression const& expr ) const;
++
++        void useActiveException( ResultDisposition::Flags resultDispositi=
on =3D ResultDisposition::Normal );
++        void captureResult( ResultWas::OfType resultType );
++        void captureExpression();
++        void captureExpectedException( std::string const& expectedMessage=
 );
++        void captureExpectedException( Matchers::Impl::MatcherBase<std::s=
tring> const& matcher );
++        void handleResult( AssertionResult const& result );
++        void react();
++        bool shouldDebugBreak() const;
++        bool allowThrows() const;
++
++        template<typename ArgT, typename MatcherT>
++        void captureMatch( ArgT const& arg, MatcherT const& matcher, char=
 const* matcherString );
++
++        void setExceptionGuard();
++        void unsetExceptionGuard();
++
++    private:
++        AssertionInfo m_assertionInfo;
++        AssertionResultData m_data;
++
++        CopyableStream &stream()
++        {
++            if(!m_usedStream)
++            {
++                m_usedStream =3D true;
++                m_stream().oss.str("");
++            }
++            return m_stream();
++        }
++
++        static CopyableStream &m_stream()
++        {
++            static CopyableStream s;
++            return s;
++        }
++
++        bool m_shouldDebugBreak;
++        bool m_shouldThrow;
++        bool m_guardException;
++        bool m_usedStream;
++    };
++
++} // namespace Catch
++
++// Include after due to circular dependency:
++// #included from: catch_expression_lhs.hpp
++#define TWOBLUECUBES_CATCH_EXPRESSION_LHS_HPP_INCLUDED
++
++// #included from: catch_evaluate.hpp
++#define TWOBLUECUBES_CATCH_EVALUATE_HPP_INCLUDED
++
++#ifdef _MSC_VER
++#pragma warning(push)
++#pragma warning(disable:4389) // '=3D=3D' : signed/unsigned mismatch
++#pragma warning(disable:4018) // more "signed/unsigned mismatch"
++#pragma warning(disable:4312) // Converting int to T* using reinterpret_c=
ast (issue on x64 platform)
++#endif
++
++#include <cstddef>
++
++namespace Catch {
++namespace Internal {
++
++    enum Operator {
++        IsEqualTo,
++        IsNotEqualTo,
++        IsLessThan,
++        IsGreaterThan,
++        IsLessThanOrEqualTo,
++        IsGreaterThanOrEqualTo
++    };
++
++    template<Operator Op> struct OperatorTraits             { static cons=
t char* getName(){ return "*error*"; } };
++    template<> struct OperatorTraits<IsEqualTo>             { static cons=
t char* getName(){ return "=3D=3D"; } };
++    template<> struct OperatorTraits<IsNotEqualTo>          { static cons=
t char* getName(){ return "!=3D"; } };
++    template<> struct OperatorTraits<IsLessThan>            { static cons=
t char* getName(){ return "<"; } };
++    template<> struct OperatorTraits<IsGreaterThan>         { static cons=
t char* getName(){ return ">"; } };
++    template<> struct OperatorTraits<IsLessThanOrEqualTo>   { static cons=
t char* getName(){ return "<=3D"; } };
++    template<> struct OperatorTraits<IsGreaterThanOrEqualTo>{ static cons=
t char* getName(){ return ">=3D"; } };
++
++    template<typename T>
++    T& opCast(T const& t) { return const_cast<T&>(t); }
++
++// nullptr_t support based on pull request #154 from Konstantin Baumann
++#ifdef CATCH_CONFIG_CPP11_NULLPTR
++    inline std::nullptr_t opCast(std::nullptr_t) { return nullptr; }
++#endif // CATCH_CONFIG_CPP11_NULLPTR
++
++    // So the compare overloads can be operator agnostic we convey the op=
erator as a template
++    // enum, which is used to specialise an Evaluator for doing the compa=
rison.
++    template<typename T1, typename T2, Operator Op>
++    struct Evaluator{};
++
++    template<typename T1, typename T2>
++    struct Evaluator<T1, T2, IsEqualTo> {
++        static bool evaluate( T1 const& lhs, T2 const& rhs) {
++            return bool( opCast( lhs ) =3D=3D  opCast( rhs ) );
++        }
++    };
++    template<typename T1, typename T2>
++    struct Evaluator<T1, T2, IsNotEqualTo> {
++        static bool evaluate( T1 const& lhs, T2 const& rhs ) {
++            return bool( opCast( lhs ) !=3D opCast( rhs ) );
++        }
++    };
++    template<typename T1, typename T2>
++    struct Evaluator<T1, T2, IsLessThan> {
++        static bool evaluate( T1 const& lhs, T2 const& rhs ) {
++            return bool( opCast( lhs ) < opCast( rhs ) );
++        }
++    };
++    template<typename T1, typename T2>
++    struct Evaluator<T1, T2, IsGreaterThan> {
++        static bool evaluate( T1 const& lhs, T2 const& rhs ) {
++            return bool( opCast( lhs ) > opCast( rhs ) );
++        }
++    };
++    template<typename T1, typename T2>
++    struct Evaluator<T1, T2, IsGreaterThanOrEqualTo> {
++        static bool evaluate( T1 const& lhs, T2 const& rhs ) {
++            return bool( opCast( lhs ) >=3D opCast( rhs ) );
++        }
++    };
++    template<typename T1, typename T2>
++    struct Evaluator<T1, T2, IsLessThanOrEqualTo> {
++        static bool evaluate( T1 const& lhs, T2 const& rhs ) {
++            return bool( opCast( lhs ) <=3D opCast( rhs ) );
++        }
++    };
++
++    template<Operator Op, typename T1, typename T2>
++    bool applyEvaluator( T1 const& lhs, T2 const& rhs ) {
++        return Evaluator<T1, T2, Op>::evaluate( lhs, rhs );
++    }
++
++    // This level of indirection allows us to specialise for integer types
++    // to avoid signed/ unsigned warnings
++
++    // "base" overload
++    template<Operator Op, typename T1, typename T2>
++    bool compare( T1 const& lhs, T2 const& rhs ) {
++        return Evaluator<T1, T2, Op>::evaluate( lhs, rhs );
++    }
++
++    // unsigned X to int
++    template<Operator Op> bool compare( unsigned int lhs, int rhs ) {
++        return applyEvaluator<Op>( lhs, static_cast<unsigned int>( rhs ) =
);
++    }
++    template<Operator Op> bool compare( unsigned long lhs, int rhs ) {
++        return applyEvaluator<Op>( lhs, static_cast<unsigned int>( rhs ) =
);
++    }
++    template<Operator Op> bool compare( unsigned char lhs, int rhs ) {
++        return applyEvaluator<Op>( lhs, static_cast<unsigned int>( rhs ) =
);
++    }
++
++    // unsigned X to long
++    template<Operator Op> bool compare( unsigned int lhs, long rhs ) {
++        return applyEvaluator<Op>( lhs, static_cast<unsigned long>( rhs )=
 );
++    }
++    template<Operator Op> bool compare( unsigned long lhs, long rhs ) {
++        return applyEvaluator<Op>( lhs, static_cast<unsigned long>( rhs )=
 );
++    }
++    template<Operator Op> bool compare( unsigned char lhs, long rhs ) {
++        return applyEvaluator<Op>( lhs, static_cast<unsigned long>( rhs )=
 );
++    }
++
++    // int to unsigned X
++    template<Operator Op> bool compare( int lhs, unsigned int rhs ) {
++        return applyEvaluator<Op>( static_cast<unsigned int>( lhs ), rhs =
);
++    }
++    template<Operator Op> bool compare( int lhs, unsigned long rhs ) {
++        return applyEvaluator<Op>( static_cast<unsigned int>( lhs ), rhs =
);
++    }
++    template<Operator Op> bool compare( int lhs, unsigned char rhs ) {
++        return applyEvaluator<Op>( static_cast<unsigned int>( lhs ), rhs =
);
++    }
++
++    // long to unsigned X
++    template<Operator Op> bool compare( long lhs, unsigned int rhs ) {
++        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );
++    }
++    template<Operator Op> bool compare( long lhs, unsigned long rhs ) {
++        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );
++    }
++    template<Operator Op> bool compare( long lhs, unsigned char rhs ) {
++        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );
++    }
++
++    // pointer to long (when comparing against NULL)
++    template<Operator Op, typename T> bool compare( long lhs, T* rhs ) {
++        return Evaluator<T*, T*, Op>::evaluate( reinterpret_cast<T*>( lhs=
 ), rhs );
++    }
++    template<Operator Op, typename T> bool compare( T* lhs, long rhs ) {
++        return Evaluator<T*, T*, Op>::evaluate( lhs, reinterpret_cast<T*>=
( rhs ) );
++    }
++
++    // pointer to int (when comparing against NULL)
++    template<Operator Op, typename T> bool compare( int lhs, T* rhs ) {
++        return Evaluator<T*, T*, Op>::evaluate( reinterpret_cast<T*>( lhs=
 ), rhs );
++    }
++    template<Operator Op, typename T> bool compare( T* lhs, int rhs ) {
++        return Evaluator<T*, T*, Op>::evaluate( lhs, reinterpret_cast<T*>=
( rhs ) );
++    }
++
++#ifdef CATCH_CONFIG_CPP11_LONG_LONG
++    // long long to unsigned X
++    template<Operator Op> bool compare( long long lhs, unsigned int rhs )=
 {
++        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );
++    }
++    template<Operator Op> bool compare( long long lhs, unsigned long rhs =
) {
++        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );
++    }
++    template<Operator Op> bool compare( long long lhs, unsigned long long=
 rhs ) {
++        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );
++    }
++    template<Operator Op> bool compare( long long lhs, unsigned char rhs =
) {
++        return applyEvaluator<Op>( static_cast<unsigned long>( lhs ), rhs=
 );
++    }
++
++    // unsigned long long to X
++    template<Operator Op> bool compare( unsigned long long lhs, int rhs )=
 {
++        return applyEvaluator<Op>( static_cast<long>( lhs ), rhs );
++    }
++    template<Operator Op> bool compare( unsigned long long lhs, long rhs =
) {
++        return applyEvaluator<Op>( static_cast<long>( lhs ), rhs );
++    }
++    template<Operator Op> bool compare( unsigned long long lhs, long long=
 rhs ) {
++        return applyEvaluator<Op>( static_cast<long>( lhs ), rhs );
++    }
++    template<Operator Op> bool compare( unsigned long long lhs, char rhs =
) {
++        return applyEvaluator<Op>( static_cast<long>( lhs ), rhs );
++    }
++
++    // pointer to long long (when comparing against NULL)
++    template<Operator Op, typename T> bool compare( long long lhs, T* rhs=
 ) {
++        return Evaluator<T*, T*, Op>::evaluate( reinterpret_cast<T*>( lhs=
 ), rhs );
++    }
++    template<Operator Op, typename T> bool compare( T* lhs, long long rhs=
 ) {
++        return Evaluator<T*, T*, Op>::evaluate( lhs, reinterpret_cast<T*>=
( rhs ) );
++    }
++#endif // CATCH_CONFIG_CPP11_LONG_LONG
++
++#ifdef CATCH_CONFIG_CPP11_NULLPTR
++    // pointer to nullptr_t (when comparing against nullptr)
++    template<Operator Op, typename T> bool compare( std::nullptr_t, T* rh=
s ) {
++        return Evaluator<T*, T*, Op>::evaluate( nullptr, rhs );
++    }
++    template<Operator Op, typename T> bool compare( T* lhs, std::nullptr_=
t ) {
++        return Evaluator<T*, T*, Op>::evaluate( lhs, nullptr );
++    }
++#endif // CATCH_CONFIG_CPP11_NULLPTR
++
++} // end of namespace Internal
++} // end of namespace Catch
++
++#ifdef _MSC_VER
++#pragma warning(pop)
++#endif
++
++// #included from: catch_tostring.h
++#define TWOBLUECUBES_CATCH_TOSTRING_H_INCLUDED
++
++#include <sstream>
++#include <iomanip>
++#include <limits>
++#include <vector>
++#include <cstddef>
++
++#ifdef __OBJC__
++// #included from: catch_objc_arc.hpp
++#define TWOBLUECUBES_CATCH_OBJC_ARC_HPP_INCLUDED
++
++#import <Foundation/Foundation.h>
++
++#ifdef __has_feature
++#define CATCH_ARC_ENABLED __has_feature(objc_arc)
++#else
++#define CATCH_ARC_ENABLED 0
++#endif
++
++void arcSafeRelease( NSObject* obj );
++id performOptionalSelector( id obj, SEL sel );
++
++#if !CATCH_ARC_ENABLED
++inline void arcSafeRelease( NSObject* obj ) {
++    [obj release];
++}
++inline id performOptionalSelector( id obj, SEL sel ) {
++    if( [obj respondsToSelector: sel] )
++        return [obj performSelector: sel];
++    return nil;
++}
++#define CATCH_UNSAFE_UNRETAINED
++#define CATCH_ARC_STRONG
++#else
++inline void arcSafeRelease( NSObject* ){}
++inline id performOptionalSelector( id obj, SEL sel ) {
++#ifdef __clang__
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
++#endif
++    if( [obj respondsToSelector: sel] )
++        return [obj performSelector: sel];
++#ifdef __clang__
++#pragma clang diagnostic pop
++#endif
++    return nil;
++}
++#define CATCH_UNSAFE_UNRETAINED __unsafe_unretained
++#define CATCH_ARC_STRONG __strong
++#endif
++
++#endif
++
++#ifdef CATCH_CONFIG_CPP11_TUPLE
++#include <tuple>
++#endif
++
++#ifdef CATCH_CONFIG_CPP11_IS_ENUM
++#include <type_traits>
++#endif
++
++namespace Catch {
++
++// Why we're here.
++template<typename T>
++std::string toString( T const& value );
++
++// Built in overloads
++
++std::string toString( std::string const& value );
++std::string toString( std::wstring const& value );
++std::string toString( const char* const value );
++std::string toString( char* const value );
++std::string toString( const wchar_t* const value );
++std::string toString( wchar_t* const value );
++std::string toString( int value );
++std::string toString( unsigned long value );
++std::string toString( unsigned int value );
++std::string toString( const double value );
++std::string toString( const float value );
++std::string toString( bool value );
++std::string toString( char value );
++std::string toString( signed char value );
++std::string toString( unsigned char value );
++
++#ifdef CATCH_CONFIG_CPP11_LONG_LONG
++std::string toString( long long value );
++std::string toString( unsigned long long value );
++#endif
++
++#ifdef CATCH_CONFIG_CPP11_NULLPTR
++std::string toString( std::nullptr_t );
++#endif
++
++#ifdef __OBJC__
++    std::string toString( NSString const * const& nsstring );
++    std::string toString( NSString * CATCH_ARC_STRONG & nsstring );
++    std::string toString( NSObject* const& nsObject );
++#endif
++
++namespace Detail {
++
++    extern const std::string unprintableString;
++
++ #if !defined(CATCH_CONFIG_CPP11_STREAM_INSERTABLE_CHECK)
++    struct BorgType {
++        template<typename T> BorgType( T const& );
++    };
++
++    struct TrueType { char sizer[1]; };
++    struct FalseType { char sizer[2]; };
++
++    TrueType& testStreamable( std::ostream& );
++    FalseType testStreamable( FalseType );
++
++    FalseType operator<<( std::ostream const&, BorgType const& );
++
++    template<typename T>
++    struct IsStreamInsertable {
++        static std::ostream &s;
++        static T  const&t;
++        enum { value =3D sizeof( testStreamable(s << t) ) =3D=3D sizeof( =
TrueType ) };
++    };
++#else
++    template<typename T>
++    class IsStreamInsertable {
++        template<typename SS, typename TT>
++        static auto test(int)
++        -> decltype( std::declval<SS&>() << std::declval<TT>(), std::true=
_type() );
++
++        template<typename, typename>
++        static auto test(...) -> std::false_type;
++
++    public:
++        static const bool value =3D decltype(test<std::ostream,const T&>(=
0))::value;
++    };
++#endif
++
++#if defined(CATCH_CONFIG_CPP11_IS_ENUM)
++    template<typename T,
++             bool IsEnum =3D std::is_enum<T>::value
++             >
++    struct EnumStringMaker
++    {
++        static std::string convert( T const& ) { return unprintableString=
; }
++    };
++
++    template<typename T>
++    struct EnumStringMaker<T,true>
++    {
++        static std::string convert( T const& v )
++        {
++            return ::Catch::toString(
++                static_cast<typename std::underlying_type<T>::type>(v)
++                );
++        }
++    };
++#endif
++    template<bool C>
++    struct StringMakerBase {
++#if defined(CATCH_CONFIG_CPP11_IS_ENUM)
++        template<typename T>
++        static std::string convert( T const& v )
++        {
++            return EnumStringMaker<T>::convert( v );
++        }
++#else
++        template<typename T>
++        static std::string convert( T const& ) { return unprintableString=
; }
++#endif
++    };
++
++    template<>
++    struct StringMakerBase<true> {
++        template<typename T>
++        static std::string convert( T const& _value ) {
++            std::ostringstream oss;
++            oss << _value;
++            return oss.str();
++        }
++    };
++
++    std::string rawMemoryToString( const void *object, std::size_t size );
++
++    template<typename T>
++    std::string rawMemoryToString( const T& object ) {
++      return rawMemoryToString( &object, sizeof(object) );
++    }
++
++} // end namespace Detail
++
++template<typename T>
++struct StringMaker :
++    Detail::StringMakerBase<Detail::IsStreamInsertable<T>::value> {};
++
++template<typename T>
++struct StringMaker<T*> {
++    template<typename U>
++    static std::string convert( U* p ) {
++        if( !p )
++            return "NULL";
++        else
++            return Detail::rawMemoryToString( p );
++    }
++};
++
++template<typename R, typename C>
++struct StringMaker<R C::*> {
++    static std::string convert( R C::* p ) {
++        if( !p )
++            return "NULL";
++        else
++            return Detail::rawMemoryToString( p );
++    }
++};
++
++namespace Detail {
++    template<typename InputIterator>
++    std::string rangeToString( InputIterator first, InputIterator last );
++}
++
++//template<typename T, typename Allocator>
++//struct StringMaker<std::vector<T, Allocator> > {
++//    static std::string convert( std::vector<T,Allocator> const& v ) {
++//        return Detail::rangeToString( v.begin(), v.end() );
++//    }
++//};
++
++template<typename T, typename Allocator>
++std::string toString( std::vector<T,Allocator> const& v ) {
++    return Detail::rangeToString( v.begin(), v.end() );
++}
++
++#ifdef CATCH_CONFIG_CPP11_TUPLE
++
++// toString for tuples
++namespace TupleDetail {
++  template<
++      typename Tuple,
++      std::size_t N =3D 0,
++      bool =3D (N < std::tuple_size<Tuple>::value)
++      >
++  struct ElementPrinter {
++      static void print( const Tuple& tuple, std::ostream& os )
++      {
++          os << ( N ? ", " : " " )
++             << Catch::toString(std::get<N>(tuple));
++          ElementPrinter<Tuple,N+1>::print(tuple,os);
++      }
++  };
++
++  template<
++      typename Tuple,
++      std::size_t N
++      >
++  struct ElementPrinter<Tuple,N,false> {
++      static void print( const Tuple&, std::ostream& ) {}
++  };
++
++}
++
++template<typename ...Types>
++struct StringMaker<std::tuple<Types...>> {
++
++    static std::string convert( const std::tuple<Types...>& tuple )
++    {
++        std::ostringstream os;
++        os << '{';
++        TupleDetail::ElementPrinter<std::tuple<Types...>>::print( tuple, =
os );
++        os << " }";
++        return os.str();
++    }
++};
++#endif // CATCH_CONFIG_CPP11_TUPLE
++
++namespace Detail {
++    template<typename T>
++    std::string makeString( T const& value ) {
++        return StringMaker<T>::convert( value );
++    }
++} // end namespace Detail
++
++/// \brief converts any type to a string
++///
++/// The default template forwards on to ostringstream - except when an
++/// ostringstream overload does not exist - in which case it attempts to =
detect
++/// that and writes {?}.
++/// Overload (not specialise) this template for custom typs that you don'=
t want
++/// to provide an ostream overload for.
++template<typename T>
++std::string toString( T const& value ) {
++    return StringMaker<T>::convert( value );
++}
++
++    namespace Detail {
++    template<typename InputIterator>
++    std::string rangeToString( InputIterator first, InputIterator last ) {
++        std::ostringstream oss;
++        oss << "{ ";
++        if( first !=3D last ) {
++            oss << Catch::toString( *first );
++            for( ++first ; first !=3D last ; ++first )
++                oss << ", " << Catch::toString( *first );
++        }
++        oss << " }";
++        return oss.str();
++    }
++}
++
++} // end namespace Catch
++
++namespace Catch {
++
++template<typename LhsT, Internal::Operator Op, typename RhsT>
++class BinaryExpression;
++
++template<typename ArgT, typename MatcherT>
++class MatchExpression;
++
++// Wraps the LHS of an expression and overloads comparison operators
++// for also capturing those and RHS (if any)
++template<typename T>
++class ExpressionLhs : public DecomposedExpression {
++public:
++    ExpressionLhs( ResultBuilder& rb, T lhs ) : m_rb( rb ), m_lhs( lhs ),=
 m_truthy(false) {}
++
++    ExpressionLhs& operator =3D ( const ExpressionLhs& );
++
++    template<typename RhsT>
++    BinaryExpression<T, Internal::IsEqualTo, RhsT const&>
++    operator =3D=3D ( RhsT const& rhs ) {
++        return captureExpression<Internal::IsEqualTo>( rhs );
++    }
++
++    template<typename RhsT>
++    BinaryExpression<T, Internal::IsNotEqualTo, RhsT const&>
++    operator !=3D ( RhsT const& rhs ) {
++        return captureExpression<Internal::IsNotEqualTo>( rhs );
++    }
++
++    template<typename RhsT>
++    BinaryExpression<T, Internal::IsLessThan, RhsT const&>
++    operator < ( RhsT const& rhs ) {
++        return captureExpression<Internal::IsLessThan>( rhs );
++    }
++
++    template<typename RhsT>
++    BinaryExpression<T, Internal::IsGreaterThan, RhsT const&>
++    operator > ( RhsT const& rhs ) {
++        return captureExpression<Internal::IsGreaterThan>( rhs );
++    }
++
++    template<typename RhsT>
++    BinaryExpression<T, Internal::IsLessThanOrEqualTo, RhsT const&>
++    operator <=3D ( RhsT const& rhs ) {
++        return captureExpression<Internal::IsLessThanOrEqualTo>( rhs );
++    }
++
++    template<typename RhsT>
++    BinaryExpression<T, Internal::IsGreaterThanOrEqualTo, RhsT const&>
++    operator >=3D ( RhsT const& rhs ) {
++        return captureExpression<Internal::IsGreaterThanOrEqualTo>( rhs );
++    }
++
++    BinaryExpression<T, Internal::IsEqualTo, bool> operator =3D=3D ( bool=
 rhs ) {
++        return captureExpression<Internal::IsEqualTo>( rhs );
++    }
++
++    BinaryExpression<T, Internal::IsNotEqualTo, bool> operator !=3D ( boo=
l rhs ) {
++        return captureExpression<Internal::IsNotEqualTo>( rhs );
++    }
++
++    void endExpression() {
++        m_truthy =3D m_lhs ? true : false;
++        m_rb
++            .setResultType( m_truthy )
++            .endExpression( *this );
++    }
++
++    virtual void reconstructExpression( std::string& dest ) const CATCH_O=
VERRIDE {
++        dest =3D Catch::toString( m_lhs );
++    }
++
++private:
++    template<Internal::Operator Op, typename RhsT>
++    BinaryExpression<T, Op, RhsT&> captureExpression( RhsT& rhs ) const {
++        return BinaryExpression<T, Op, RhsT&>( m_rb, m_lhs, rhs );
++    }
++
++    template<Internal::Operator Op>
++    BinaryExpression<T, Op, bool> captureExpression( bool rhs ) const {
++        return BinaryExpression<T, Op, bool>( m_rb, m_lhs, rhs );
++    }
++
++private:
++    ResultBuilder& m_rb;
++    T m_lhs;
++    bool m_truthy;
++};
++
++template<typename LhsT, Internal::Operator Op, typename RhsT>
++class BinaryExpression : public DecomposedExpression {
++public:
++    BinaryExpression( ResultBuilder& rb, LhsT lhs, RhsT rhs )
++        : m_rb( rb ), m_lhs( lhs ), m_rhs( rhs ) {}
++
++    BinaryExpression& operator =3D ( BinaryExpression& );
++
++    void endExpression() const {
++        m_rb
++            .setResultType( Internal::compare<Op>( m_lhs, m_rhs ) )
++            .endExpression( *this );
++    }
++
++    virtual bool isBinaryExpression() const CATCH_OVERRIDE {
++        return true;
++    }
++
++    virtual void reconstructExpression( std::string& dest ) const CATCH_O=
VERRIDE {
++        std::string lhs =3D Catch::toString( m_lhs );
++        std::string rhs =3D Catch::toString( m_rhs );
++        char delim =3D lhs.size() + rhs.size() < 40 &&
++                     lhs.find('\n') =3D=3D std::string::npos &&
++                     rhs.find('\n') =3D=3D std::string::npos ? ' ' : '\n';
++        dest.reserve( 7 + lhs.size() + rhs.size() );
++                   // 2 for spaces around operator
++                   // 2 for operator
++                   // 2 for parentheses (conditionally added later)
++                   // 1 for negation (conditionally added later)
++        dest =3D lhs;
++        dest +=3D delim;
++        dest +=3D Internal::OperatorTraits<Op>::getName();
++        dest +=3D delim;
++        dest +=3D rhs;
++    }
++
++private:
++    ResultBuilder& m_rb;
++    LhsT m_lhs;
++    RhsT m_rhs;
++};
++
++template<typename ArgT, typename MatcherT>
++class MatchExpression : public DecomposedExpression {
++public:
++    MatchExpression( ArgT arg, MatcherT matcher, char const* matcherStrin=
g )
++        : m_arg( arg ), m_matcher( matcher ), m_matcherString( matcherStr=
ing ) {}
++
++    virtual bool isBinaryExpression() const CATCH_OVERRIDE {
++        return true;
++    }
++
++    virtual void reconstructExpression( std::string& dest ) const CATCH_O=
VERRIDE {
++        std::string matcherAsString =3D m_matcher.toString();
++        dest =3D Catch::toString( m_arg );
++        dest +=3D ' ';
++        if( matcherAsString =3D=3D Detail::unprintableString )
++            dest +=3D m_matcherString;
++        else
++            dest +=3D matcherAsString;
++    }
++
++private:
++    ArgT m_arg;
++    MatcherT m_matcher;
++    char const* m_matcherString;
++};
++
++} // end namespace Catch
++
++
++namespace Catch {
++
++    template<typename T>
++    ExpressionLhs<T const&> ResultBuilder::operator <=3D ( T const& opera=
nd ) {
++        return ExpressionLhs<T const&>( *this, operand );
++    }
++
++    inline ExpressionLhs<bool> ResultBuilder::operator <=3D ( bool value =
) {
++        return ExpressionLhs<bool>( *this, value );
++    }
++
++    template<typename ArgT, typename MatcherT>
++    void ResultBuilder::captureMatch( ArgT const& arg, MatcherT const& ma=
tcher,
++                                             char const* matcherString ) {
++        MatchExpression<ArgT const&, MatcherT const&> expr( arg, matcher,=
 matcherString );
++        setResultType( matcher.match( arg ) );
++        endExpression( expr );
++    }
++
++} // namespace Catch
++
++// #included from: catch_message.h
++#define TWOBLUECUBES_CATCH_MESSAGE_H_INCLUDED
++
++#include <string>
++
++namespace Catch {
++
++    struct MessageInfo {
++        MessageInfo(    std::string const& _macroName,
++                        SourceLineInfo const& _lineInfo,
++                        ResultWas::OfType _type );
++
++        std::string macroName;
++        SourceLineInfo lineInfo;
++        ResultWas::OfType type;
++        std::string message;
++        unsigned int sequence;
++
++        bool operator =3D=3D ( MessageInfo const& other ) const {
++            return sequence =3D=3D other.sequence;
++        }
++        bool operator < ( MessageInfo const& other ) const {
++            return sequence < other.sequence;
++        }
++    private:
++        static unsigned int globalCount;
++    };
++
++    struct MessageBuilder {
++        MessageBuilder( std::string const& macroName,
++                        SourceLineInfo const& lineInfo,
++                        ResultWas::OfType type )
++        : m_info( macroName, lineInfo, type )
++        {}
++
++        template<typename T>
++        MessageBuilder& operator << ( T const& value ) {
++            m_stream << value;
++            return *this;
++        }
++
++        MessageInfo m_info;
++        std::ostringstream m_stream;
++    };
++
++    class ScopedMessage {
++    public:
++        ScopedMessage( MessageBuilder const& builder );
++        ScopedMessage( ScopedMessage const& other );
++        ~ScopedMessage();
++
++        MessageInfo m_info;
++    };
++
++} // end namespace Catch
++
++// #included from: catch_interfaces_capture.h
++#define TWOBLUECUBES_CATCH_INTERFACES_CAPTURE_H_INCLUDED
++
++#include <string>
++
++namespace Catch {
++
++    class TestCase;
++    class AssertionResult;
++    struct AssertionInfo;
++    struct SectionInfo;
++    struct SectionEndInfo;
++    struct MessageInfo;
++    class ScopedMessageBuilder;
++    struct Counts;
++
++    struct IResultCapture {
++
++        virtual ~IResultCapture();
++
++        virtual void assertionEnded( AssertionResult const& result ) =3D =
0;
++        virtual bool sectionStarted(    SectionInfo const& sectionInfo,
++                                        Counts& assertions ) =3D 0;
++        virtual void sectionEnded( SectionEndInfo const& endInfo ) =3D 0;
++        virtual void sectionEndedEarly( SectionEndInfo const& endInfo ) =
=3D 0;
++        virtual void pushScopedMessage( MessageInfo const& message ) =3D =
0;
++        virtual void popScopedMessage( MessageInfo const& message ) =3D 0;
++
++        virtual std::string getCurrentTestName() const =3D 0;
++        virtual const AssertionResult* getLastResult() const =3D 0;
++
++        virtual void exceptionEarlyReported() =3D 0;
++
++        virtual void handleFatalErrorCondition( std::string const& messag=
e ) =3D 0;
++
++        virtual bool lastAssertionPassed() =3D 0;
++        virtual void assertionPassed() =3D 0;
++        virtual void assertionRun() =3D 0;
++    };
++
++    IResultCapture& getResultCapture();
++}
++
++// #included from: catch_debugger.h
++#define TWOBLUECUBES_CATCH_DEBUGGER_H_INCLUDED
++
++// #included from: catch_platform.h
++#define TWOBLUECUBES_CATCH_PLATFORM_H_INCLUDED
++
++#if defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
++#  define CATCH_PLATFORM_MAC
++#elif  defined(__IPHONE_OS_VERSION_MIN_REQUIRED)
++#  define CATCH_PLATFORM_IPHONE
++#elif defined(linux) || defined(__linux) || defined(__linux__)
++#  define CATCH_PLATFORM_LINUX
++#elif defined(WIN32) || defined(__WIN32__) || defined(_WIN32) || defined(=
_MSC_VER)
++#  define CATCH_PLATFORM_WINDOWS
++#  if !defined(NOMINMAX) && !defined(CATCH_CONFIG_NO_NOMINMAX)
++#    define CATCH_DEFINES_NOMINMAX
++#  endif
++#  if !defined(WIN32_LEAN_AND_MEAN) && !defined(CATCH_CONFIG_NO_WIN32_LEA=
N_AND_MEAN)
++#    define CATCH_DEFINES_WIN32_LEAN_AND_MEAN
++#  endif
++#endif
++
++#include <string>
++
++namespace Catch{
++
++    bool isDebuggerActive();
++    void writeToDebugConsole( std::string const& text );
++}
++
++#ifdef CATCH_PLATFORM_MAC
++
++    // The following code snippet based on:
++    // http://cocoawithlove.com/2008/03/break-into-debugger.html
++    #if defined(__ppc64__) || defined(__ppc__)
++        #define CATCH_TRAP() \
++                __asm__("li r0, 20\nsc\nnop\nli r0, 37\nli r4, 2\nsc\nnop=
\n" \
++                : : : "memory","r0","r3","r4" ) /* NOLINT */
++    #else
++        #define CATCH_TRAP() __asm__("int $3\n" : : /* NOLINT */ )
++    #endif
++
++#elif defined(CATCH_PLATFORM_LINUX)
++    // If we can use inline assembler, do it because this allows us to br=
eak
++    // directly at the location of the failing check instead of breaking =
inside
++    // raise() called from it, i.e. one stack frame below.
++    #if defined(__GNUC__) && (defined(__i386) || defined(__x86_64))
++        #define CATCH_TRAP() asm volatile ("int $3") /* NOLINT */
++    #else // Fall back to the generic way.
++        #include <signal.h>
++
++        #define CATCH_TRAP() raise(SIGTRAP)
++    #endif
++#elif defined(_MSC_VER)
++    #define CATCH_TRAP() __debugbreak()
++#elif defined(__MINGW32__)
++    extern "C" __declspec(dllimport) void __stdcall DebugBreak();
++    #define CATCH_TRAP() DebugBreak()
++#endif
++
++#ifdef CATCH_TRAP
++    #define CATCH_BREAK_INTO_DEBUGGER() if( Catch::isDebuggerActive() ) {=
 CATCH_TRAP(); }
++#else
++    #define CATCH_BREAK_INTO_DEBUGGER() Catch::alwaysTrue();
++#endif
++
++// #included from: catch_interfaces_runner.h
++#define TWOBLUECUBES_CATCH_INTERFACES_RUNNER_H_INCLUDED
++
++namespace Catch {
++    class TestCase;
++
++    struct IRunner {
++        virtual ~IRunner();
++        virtual bool aborting() const =3D 0;
++    };
++}
++
++#if !defined(CATCH_CONFIG_DISABLE_STRINGIFICATION)
++# define CATCH_INTERNAL_STRINGIFY(expr) #expr
++#else
++# define CATCH_INTERNAL_STRINGIFY(expr) "Disabled by CATCH_CONFIG_DISABLE=
_STRINGIFICATION"
++#endif
++
++#if defined(CATCH_CONFIG_FAST_COMPILE)
++/////////////////////////////////////////////////////////////////////////=
//////
++// We can speedup compilation significantly by breaking into debugger low=
er in
++// the callstack, because then we don't have to expand CATCH_BREAK_INTO_D=
EBUGGER
++// macro in each assertion
++#define INTERNAL_CATCH_REACT( resultBuilder ) \
++    resultBuilder.react();
++
++/////////////////////////////////////////////////////////////////////////=
//////
++// Another way to speed-up compilation is to omit local try-catch for REQ=
UIRE*
++// macros.
++// This can potentially cause false negative, if the test code catches
++// the exception before it propagates back up to the runner.
++#define INTERNAL_CATCH_TEST_NO_TRY( macroName, resultDisposition, expr ) \
++    do { \
++        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, CATCH_INTERNAL_STRINGIFY(expr), resultDisposition ); \
++        __catchResult.setExceptionGuard(); \
++        CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS \
++        ( __catchResult <=3D expr ).endExpression(); \
++        CATCH_INTERNAL_UNSUPPRESS_PARENTHESES_WARNINGS \
++        __catchResult.unsetExceptionGuard(); \
++        INTERNAL_CATCH_REACT( __catchResult ) \
++    } while( Catch::isTrue( false && static_cast<bool>( !!(expr) ) ) ) //=
 expr here is never evaluated at runtime but it forces the compiler to give=
 it a look
++// The double negation silences MSVC's C4800 warning, the static_cast for=
ces short-circuit evaluation if the type has overloaded &&.
++
++#define INTERNAL_CHECK_THAT_NO_TRY( macroName, matcher, resultDisposition=
, arg ) \
++    do { \
++        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, CATCH_INTERNAL_STRINGIFY(arg) ", " CATCH_INTERNAL_STRINGIFY(matcher)=
, resultDisposition ); \
++        __catchResult.setExceptionGuard(); \
++        __catchResult.captureMatch( arg, matcher, CATCH_INTERNAL_STRINGIF=
Y(matcher) ); \
++        __catchResult.unsetExceptionGuard(); \
++        INTERNAL_CATCH_REACT( __catchResult ) \
++    } while( Catch::alwaysFalse() )
++
++#else
++/////////////////////////////////////////////////////////////////////////=
//////
++// In the event of a failure works out if the debugger needs to be invoked
++// and/or an exception thrown and takes appropriate action.
++// This needs to be done as a macro so the debugger will stop in the user
++// source code rather than in Catch library code
++#define INTERNAL_CATCH_REACT( resultBuilder ) \
++    if( resultBuilder.shouldDebugBreak() ) CATCH_BREAK_INTO_DEBUGGER(); \
++    resultBuilder.react();
++#endif
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define INTERNAL_CATCH_TEST( macroName, resultDisposition, expr ) \
++    do { \
++        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, CATCH_INTERNAL_STRINGIFY(expr), resultDisposition ); \
++        try { \
++            CATCH_INTERNAL_SUPPRESS_PARENTHESES_WARNINGS \
++            ( __catchResult <=3D expr ).endExpression(); \
++            CATCH_INTERNAL_UNSUPPRESS_PARENTHESES_WARNINGS \
++        } \
++        catch( ... ) { \
++            __catchResult.useActiveException( resultDisposition ); \
++        } \
++        INTERNAL_CATCH_REACT( __catchResult ) \
++    } while( Catch::isTrue( false && static_cast<bool>( !!(expr) ) ) ) //=
 expr here is never evaluated at runtime but it forces the compiler to give=
 it a look
++    // The double negation silences MSVC's C4800 warning, the static_cast=
 forces short-circuit evaluation if the type has overloaded &&.
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define INTERNAL_CATCH_IF( macroName, resultDisposition, expr ) \
++    INTERNAL_CATCH_TEST( macroName, resultDisposition, expr ); \
++    if( Catch::getResultCapture().lastAssertionPassed() )
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define INTERNAL_CATCH_ELSE( macroName, resultDisposition, expr ) \
++    INTERNAL_CATCH_TEST( macroName, resultDisposition, expr ); \
++    if( !Catch::getResultCapture().lastAssertionPassed() )
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define INTERNAL_CATCH_NO_THROW( macroName, resultDisposition, expr ) \
++    do { \
++        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, CATCH_INTERNAL_STRINGIFY(expr), resultDisposition ); \
++        try { \
++            static_cast<void>(expr); \
++            __catchResult.captureResult( Catch::ResultWas::Ok ); \
++        } \
++        catch( ... ) { \
++            __catchResult.useActiveException( resultDisposition ); \
++        } \
++        INTERNAL_CATCH_REACT( __catchResult ) \
++    } while( Catch::alwaysFalse() )
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define INTERNAL_CATCH_THROWS( macroName, resultDisposition, matcher, exp=
r ) \
++    do { \
++        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, CATCH_INTERNAL_STRINGIFY(expr), resultDisposition, CATCH_INTERNAL_ST=
RINGIFY(matcher) ); \
++        if( __catchResult.allowThrows() ) \
++            try { \
++                static_cast<void>(expr); \
++                __catchResult.captureResult( Catch::ResultWas::DidntThrow=
Exception ); \
++            } \
++            catch( ... ) { \
++                __catchResult.captureExpectedException( matcher ); \
++            } \
++        else \
++            __catchResult.captureResult( Catch::ResultWas::Ok ); \
++        INTERNAL_CATCH_REACT( __catchResult ) \
++    } while( Catch::alwaysFalse() )
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define INTERNAL_CATCH_THROWS_AS( macroName, exceptionType, resultDisposi=
tion, expr ) \
++    do { \
++        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, CATCH_INTERNAL_STRINGIFY(expr) ", " CATCH_INTERNAL_STRINGIFY(excepti=
onType), resultDisposition ); \
++        if( __catchResult.allowThrows() ) \
++            try { \
++                static_cast<void>(expr); \
++                __catchResult.captureResult( Catch::ResultWas::DidntThrow=
Exception ); \
++            } \
++            catch( exceptionType ) { \
++                __catchResult.captureResult( Catch::ResultWas::Ok ); \
++            } \
++            catch( ... ) { \
++                __catchResult.useActiveException( resultDisposition ); \
++            } \
++        else \
++            __catchResult.captureResult( Catch::ResultWas::Ok ); \
++        INTERNAL_CATCH_REACT( __catchResult ) \
++    } while( Catch::alwaysFalse() )
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#ifdef CATCH_CONFIG_VARIADIC_MACROS
++    #define INTERNAL_CATCH_MSG( macroName, messageType, resultDisposition=
, ... ) \
++        do { \
++            Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL=
_LINEINFO, "", resultDisposition ); \
++            __catchResult << __VA_ARGS__ + ::Catch::StreamEndStop(); \
++            __catchResult.captureResult( messageType ); \
++            INTERNAL_CATCH_REACT( __catchResult ) \
++        } while( Catch::alwaysFalse() )
++#else
++    #define INTERNAL_CATCH_MSG( macroName, messageType, resultDisposition=
, log ) \
++        do { \
++            Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL=
_LINEINFO, "", resultDisposition ); \
++            __catchResult << log + ::Catch::StreamEndStop(); \
++            __catchResult.captureResult( messageType ); \
++            INTERNAL_CATCH_REACT( __catchResult ) \
++        } while( Catch::alwaysFalse() )
++#endif
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define INTERNAL_CATCH_INFO( macroName, log ) \
++    Catch::ScopedMessage INTERNAL_CATCH_UNIQUE_NAME( scopedMessage ) =3D =
Catch::MessageBuilder( macroName, CATCH_INTERNAL_LINEINFO, Catch::ResultWas=
::Info ) << log;
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define INTERNAL_CHECK_THAT( macroName, matcher, resultDisposition, arg )=
 \
++    do { \
++        Catch::ResultBuilder __catchResult( macroName, CATCH_INTERNAL_LIN=
EINFO, CATCH_INTERNAL_STRINGIFY(arg) ", " CATCH_INTERNAL_STRINGIFY(matcher)=
, resultDisposition ); \
++        try { \
++            __catchResult.captureMatch( arg, matcher, CATCH_INTERNAL_STRI=
NGIFY(matcher) ); \
++        } catch( ... ) { \
++            __catchResult.useActiveException( resultDisposition | Catch::=
ResultDisposition::ContinueOnFailure ); \
++        } \
++        INTERNAL_CATCH_REACT( __catchResult ) \
++    } while( Catch::alwaysFalse() )
++
++// #included from: internal/catch_section.h
++#define TWOBLUECUBES_CATCH_SECTION_H_INCLUDED
++
++// #included from: catch_section_info.h
++#define TWOBLUECUBES_CATCH_SECTION_INFO_H_INCLUDED
++
++// #included from: catch_totals.hpp
++#define TWOBLUECUBES_CATCH_TOTALS_HPP_INCLUDED
++
++#include <cstddef>
++
++namespace Catch {
++
++    struct Counts {
++        Counts() : passed( 0 ), failed( 0 ), failedButOk( 0 ) {}
++
++        Counts operator - ( Counts const& other ) const {
++            Counts diff;
++            diff.passed =3D passed - other.passed;
++            diff.failed =3D failed - other.failed;
++            diff.failedButOk =3D failedButOk - other.failedButOk;
++            return diff;
++        }
++        Counts& operator +=3D ( Counts const& other ) {
++            passed +=3D other.passed;
++            failed +=3D other.failed;
++            failedButOk +=3D other.failedButOk;
++            return *this;
++        }
++
++        std::size_t total() const {
++            return passed + failed + failedButOk;
++        }
++        bool allPassed() const {
++            return failed =3D=3D 0 && failedButOk =3D=3D 0;
++        }
++        bool allOk() const {
++            return failed =3D=3D 0;
++        }
++
++        std::size_t passed;
++        std::size_t failed;
++        std::size_t failedButOk;
++    };
++
++    struct Totals {
++
++        Totals operator - ( Totals const& other ) const {
++            Totals diff;
++            diff.assertions =3D assertions - other.assertions;
++            diff.testCases =3D testCases - other.testCases;
++            return diff;
++        }
++
++        Totals delta( Totals const& prevTotals ) const {
++            Totals diff =3D *this - prevTotals;
++            if( diff.assertions.failed > 0 )
++                ++diff.testCases.failed;
++            else if( diff.assertions.failedButOk > 0 )
++                ++diff.testCases.failedButOk;
++            else
++                ++diff.testCases.passed;
++            return diff;
++        }
++
++        Totals& operator +=3D ( Totals const& other ) {
++            assertions +=3D other.assertions;
++            testCases +=3D other.testCases;
++            return *this;
++        }
++
++        Counts assertions;
++        Counts testCases;
++    };
++}
++
++#include <string>
++
++namespace Catch {
++
++    struct SectionInfo {
++        SectionInfo
++            (   SourceLineInfo const& _lineInfo,
++                std::string const& _name,
++                std::string const& _description =3D std::string() );
++
++        std::string name;
++        std::string description;
++        SourceLineInfo lineInfo;
++    };
++
++    struct SectionEndInfo {
++        SectionEndInfo( SectionInfo const& _sectionInfo, Counts const& _p=
revAssertions, double _durationInSeconds )
++        : sectionInfo( _sectionInfo ), prevAssertions( _prevAssertions ),=
 durationInSeconds( _durationInSeconds )
++        {}
++
++        SectionInfo sectionInfo;
++        Counts prevAssertions;
++        double durationInSeconds;
++    };
++
++} // end namespace Catch
++
++// #included from: catch_timer.h
++#define TWOBLUECUBES_CATCH_TIMER_H_INCLUDED
++
++#ifdef _MSC_VER
++
++namespace Catch {
++    typedef unsigned long long UInt64;
++}
++#else
++#include <stdint.h>
++namespace Catch {
++    typedef uint64_t UInt64;
++}
++#endif
++
++namespace Catch {
++    class Timer {
++    public:
++        Timer() : m_ticks( 0 ) {}
++        void start();
++        unsigned int getElapsedMicroseconds() const;
++        unsigned int getElapsedMilliseconds() const;
++        double getElapsedSeconds() const;
++
++    private:
++        UInt64 m_ticks;
++    };
++
++} // namespace Catch
++
++#include <string>
++
++namespace Catch {
++
++    class Section : NonCopyable {
++    public:
++        Section( SectionInfo const& info );
++        ~Section();
++
++        // This indicates whether the section should be executed or not
++        operator bool() const;
++
++    private:
++        SectionInfo m_info;
++
++        std::string m_name;
++        Counts m_assertions;
++        bool m_sectionIncluded;
++        Timer m_timer;
++    };
++
++} // end namespace Catch
++
++#ifdef CATCH_CONFIG_VARIADIC_MACROS
++    #define INTERNAL_CATCH_SECTION( ... ) \
++        if( Catch::Section const& INTERNAL_CATCH_UNIQUE_NAME( catch_inter=
nal_Section ) =3D Catch::SectionInfo( CATCH_INTERNAL_LINEINFO, __VA_ARGS__ =
) )
++#else
++    #define INTERNAL_CATCH_SECTION( name, desc ) \
++        if( Catch::Section const& INTERNAL_CATCH_UNIQUE_NAME( catch_inter=
nal_Section ) =3D Catch::SectionInfo( CATCH_INTERNAL_LINEINFO, name, desc )=
 )
++#endif
++
++// #included from: internal/catch_generators.hpp
++#define TWOBLUECUBES_CATCH_GENERATORS_HPP_INCLUDED
++
++#include <vector>
++#include <string>
++#include <stdlib.h>
++
++namespace Catch {
++
++template<typename T>
++struct IGenerator {
++    virtual ~IGenerator() {}
++    virtual T getValue( std::size_t index ) const =3D 0;
++    virtual std::size_t size () const =3D 0;
++};
++
++template<typename T>
++class BetweenGenerator : public IGenerator<T> {
++public:
++    BetweenGenerator( T from, T to ) : m_from( from ), m_to( to ){}
++
++    virtual T getValue( std::size_t index ) const {
++        return m_from+static_cast<int>( index );
++    }
++
++    virtual std::size_t size() const {
++        return static_cast<std::size_t>( 1+m_to-m_from );
++    }
++
++private:
++
++    T m_from;
++    T m_to;
++};
++
++template<typename T>
++class ValuesGenerator : public IGenerator<T> {
++public:
++    ValuesGenerator(){}
++
++    void add( T value ) {
++        m_values.push_back( value );
++    }
++
++    virtual T getValue( std::size_t index ) const {
++        return m_values[index];
++    }
++
++    virtual std::size_t size() const {
++        return m_values.size();
++    }
++
++private:
++    std::vector<T> m_values;
++};
++
++template<typename T>
++class CompositeGenerator {
++public:
++    CompositeGenerator() : m_totalSize( 0 ) {}
++
++    // *** Move semantics, similar to auto_ptr ***
++    CompositeGenerator( CompositeGenerator& other )
++    :   m_fileInfo( other.m_fileInfo ),
++        m_totalSize( 0 )
++    {
++        move( other );
++    }
++
++    CompositeGenerator& setFileInfo( const char* fileInfo ) {
++        m_fileInfo =3D fileInfo;
++        return *this;
++    }
++
++    ~CompositeGenerator() {
++        deleteAll( m_composed );
++    }
++
++    operator T () const {
++        size_t overallIndex =3D getCurrentContext().getGeneratorIndex( m_=
fileInfo, m_totalSize );
++
++        typename std::vector<const IGenerator<T>*>::const_iterator it =3D=
 m_composed.begin();
++        typename std::vector<const IGenerator<T>*>::const_iterator itEnd =
=3D m_composed.end();
++        for( size_t index =3D 0; it !=3D itEnd; ++it )
++        {
++            const IGenerator<T>* generator =3D *it;
++            if( overallIndex >=3D index && overallIndex < index + generat=
or->size() )
++            {
++                return generator->getValue( overallIndex-index );
++            }
++            index +=3D generator->size();
++        }
++        CATCH_INTERNAL_ERROR( "Indexed past end of generated range" );
++        return T(); // Suppress spurious "not all control paths return a =
value" warning in Visual Studio - if you know how to fix this please do so
++    }
++
++    void add( const IGenerator<T>* generator ) {
++        m_totalSize +=3D generator->size();
++        m_composed.push_back( generator );
++    }
++
++    CompositeGenerator& then( CompositeGenerator& other ) {
++        move( other );
++        return *this;
++    }
++
++    CompositeGenerator& then( T value ) {
++        ValuesGenerator<T>* valuesGen =3D new ValuesGenerator<T>();
++        valuesGen->add( value );
++        add( valuesGen );
++        return *this;
++    }
++
++private:
++
++    void move( CompositeGenerator& other ) {
++        m_composed.insert( m_composed.end(), other.m_composed.begin(), ot=
her.m_composed.end() );
++        m_totalSize +=3D other.m_totalSize;
++        other.m_composed.clear();
++    }
++
++    std::vector<const IGenerator<T>*> m_composed;
++    std::string m_fileInfo;
++    size_t m_totalSize;
++};
++
++namespace Generators
++{
++    template<typename T>
++    CompositeGenerator<T> between( T from, T to ) {
++        CompositeGenerator<T> generators;
++        generators.add( new BetweenGenerator<T>( from, to ) );
++        return generators;
++    }
++
++    template<typename T>
++    CompositeGenerator<T> values( T val1, T val2 ) {
++        CompositeGenerator<T> generators;
++        ValuesGenerator<T>* valuesGen =3D new ValuesGenerator<T>();
++        valuesGen->add( val1 );
++        valuesGen->add( val2 );
++        generators.add( valuesGen );
++        return generators;
++    }
++
++    template<typename T>
++    CompositeGenerator<T> values( T val1, T val2, T val3 ){
++        CompositeGenerator<T> generators;
++        ValuesGenerator<T>* valuesGen =3D new ValuesGenerator<T>();
++        valuesGen->add( val1 );
++        valuesGen->add( val2 );
++        valuesGen->add( val3 );
++        generators.add( valuesGen );
++        return generators;
++    }
++
++    template<typename T>
++    CompositeGenerator<T> values( T val1, T val2, T val3, T val4 ) {
++        CompositeGenerator<T> generators;
++        ValuesGenerator<T>* valuesGen =3D new ValuesGenerator<T>();
++        valuesGen->add( val1 );
++        valuesGen->add( val2 );
++        valuesGen->add( val3 );
++        valuesGen->add( val4 );
++        generators.add( valuesGen );
++        return generators;
++    }
++
++} // end namespace Generators
++
++using namespace Generators;
++
++} // end namespace Catch
++
++#define INTERNAL_CATCH_LINESTR2( line ) #line
++#define INTERNAL_CATCH_LINESTR( line ) INTERNAL_CATCH_LINESTR2( line )
++
++#define INTERNAL_CATCH_GENERATE( expr ) expr.setFileInfo( __FILE__ "(" IN=
TERNAL_CATCH_LINESTR( __LINE__ ) ")" )
++
++// #included from: internal/catch_interfaces_exception.h
++#define TWOBLUECUBES_CATCH_INTERFACES_EXCEPTION_H_INCLUDED
++
++#include <string>
++#include <vector>
++
++// #included from: catch_interfaces_registry_hub.h
++#define TWOBLUECUBES_CATCH_INTERFACES_REGISTRY_HUB_H_INCLUDED
++
++#include <string>
++
++namespace Catch {
++
++    class TestCase;
++    struct ITestCaseRegistry;
++    struct IExceptionTranslatorRegistry;
++    struct IExceptionTranslator;
++    struct IReporterRegistry;
++    struct IReporterFactory;
++    struct ITagAliasRegistry;
++
++    struct IRegistryHub {
++        virtual ~IRegistryHub();
++
++        virtual IReporterRegistry const& getReporterRegistry() const =3D =
0;
++        virtual ITestCaseRegistry const& getTestCaseRegistry() const =3D =
0;
++        virtual ITagAliasRegistry const& getTagAliasRegistry() const =3D =
0;
++
++        virtual IExceptionTranslatorRegistry& getExceptionTranslatorRegis=
try() =3D 0;
++    };
++
++    struct IMutableRegistryHub {
++        virtual ~IMutableRegistryHub();
++        virtual void registerReporter( std::string const& name, Ptr<IRepo=
rterFactory> const& factory ) =3D 0;
++        virtual void registerListener( Ptr<IReporterFactory> const& facto=
ry ) =3D 0;
++        virtual void registerTest( TestCase const& testInfo ) =3D 0;
++        virtual void registerTranslator( const IExceptionTranslator* tran=
slator ) =3D 0;
++        virtual void registerTagAlias( std::string const& alias, std::str=
ing const& tag, SourceLineInfo const& lineInfo ) =3D 0;
++    };
++
++    IRegistryHub& getRegistryHub();
++    IMutableRegistryHub& getMutableRegistryHub();
++    void cleanUp();
++    std::string translateActiveException();
++
++}
++
++namespace Catch {
++
++    typedef std::string(*exceptionTranslateFunction)();
++
++    struct IExceptionTranslator;
++    typedef std::vector<const IExceptionTranslator*> ExceptionTranslators;
++
++    struct IExceptionTranslator {
++        virtual ~IExceptionTranslator();
++        virtual std::string translate( ExceptionTranslators::const_iterat=
or it, ExceptionTranslators::const_iterator itEnd ) const =3D 0;
++    };
++
++    struct IExceptionTranslatorRegistry {
++        virtual ~IExceptionTranslatorRegistry();
++
++        virtual std::string translateActiveException() const =3D 0;
++    };
++
++    class ExceptionTranslatorRegistrar {
++        template<typename T>
++        class ExceptionTranslator : public IExceptionTranslator {
++        public:
++
++            ExceptionTranslator( std::string(*translateFunction)( T& ) )
++            : m_translateFunction( translateFunction )
++            {}
++
++            virtual std::string translate( ExceptionTranslators::const_it=
erator it, ExceptionTranslators::const_iterator itEnd ) const CATCH_OVERRID=
E {
++                try {
++                    if( it =3D=3D itEnd )
++                        throw;
++                    else
++                        return (*it)->translate( it+1, itEnd );
++                }
++                catch( T& ex ) {
++                    return m_translateFunction( ex );
++                }
++            }
++
++        protected:
++            std::string(*m_translateFunction)( T& );
++        };
++
++    public:
++        template<typename T>
++        ExceptionTranslatorRegistrar( std::string(*translateFunction)( T&=
 ) ) {
++            getMutableRegistryHub().registerTranslator
++                ( new ExceptionTranslator<T>( translateFunction ) );
++        }
++    };
++}
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define INTERNAL_CATCH_TRANSLATE_EXCEPTION2( translatorName, signature ) \
++    static std::string translatorName( signature ); \
++    namespace{ Catch::ExceptionTranslatorRegistrar INTERNAL_CATCH_UNIQUE_=
NAME( catch_internal_ExceptionRegistrar )( &translatorName ); }\
++    static std::string translatorName( signature )
++
++#define INTERNAL_CATCH_TRANSLATE_EXCEPTION( signature ) INTERNAL_CATCH_TR=
ANSLATE_EXCEPTION2( INTERNAL_CATCH_UNIQUE_NAME( catch_internal_ExceptionTra=
nslator ), signature )
++
++// #included from: internal/catch_approx.hpp
++#define TWOBLUECUBES_CATCH_APPROX_HPP_INCLUDED
++
++#include <cmath>
++#include <limits>
++
++#if defined(CATCH_CONFIG_CPP11_TYPE_TRAITS)
++#include <type_traits>
++#endif
++
++namespace Catch {
++namespace Detail {
++
++    class Approx {
++    public:
++        explicit Approx ( double value )
++        :   m_epsilon( std::numeric_limits<float>::epsilon()*100 ),
++            m_margin( 0.0 ),
++            m_scale( 1.0 ),
++            m_value( value )
++        {}
++
++        static Approx custom() {
++            return Approx( 0 );
++        }
++
++#if defined(CATCH_CONFIG_CPP11_TYPE_TRAITS)
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        Approx operator()( T value ) {
++            Approx approx( static_cast<double>(value) );
++            approx.epsilon( m_epsilon );
++            approx.margin( m_margin );
++            approx.scale( m_scale );
++            return approx;
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        explicit Approx( T value ): Approx(static_cast<double>(value))
++        {}
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        friend bool operator =3D=3D ( const T& lhs, Approx const& rhs ) {
++            // Thanks to Richard Harris for his help refining this formula
++            auto lhs_v =3D double(lhs);
++            bool relativeOK =3D std::fabs(lhs_v - rhs.m_value) < rhs.m_ep=
silon * (rhs.m_scale + (std::max)(std::fabs(lhs_v), std::fabs(rhs.m_value))=
);
++            if (relativeOK) {
++                return true;
++            }
++
++            return std::fabs(lhs_v - rhs.m_value) <=3D rhs.m_margin;
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        friend bool operator =3D=3D ( Approx const& lhs, const T& rhs ) {
++            return operator=3D=3D( rhs, lhs );
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        friend bool operator !=3D ( T lhs, Approx const& rhs ) {
++            return !operator=3D=3D( lhs, rhs );
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        friend bool operator !=3D ( Approx const& lhs, T rhs ) {
++            return !operator=3D=3D( rhs, lhs );
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        friend bool operator <=3D ( T lhs, Approx const& rhs ) {
++            return double(lhs) < rhs.m_value || lhs =3D=3D rhs;
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        friend bool operator <=3D ( Approx const& lhs, T rhs ) {
++            return lhs.m_value < double(rhs) || lhs =3D=3D rhs;
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        friend bool operator >=3D ( T lhs, Approx const& rhs ) {
++            return double(lhs) > rhs.m_value || lhs =3D=3D rhs;
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        friend bool operator >=3D ( Approx const& lhs, T rhs ) {
++            return lhs.m_value > double(rhs) || lhs =3D=3D rhs;
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        Approx& epsilon( T newEpsilon ) {
++            m_epsilon =3D double(newEpsilon);
++            return *this;
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        Approx& margin( T newMargin ) {
++            m_margin =3D double(newMargin);
++            return *this;
++        }
++
++        template <typename T, typename =3D typename std::enable_if<std::i=
s_constructible<double, T>::value>::type>
++        Approx& scale( T newScale ) {
++            m_scale =3D double(newScale);
++            return *this;
++        }
++
++#else
++
++        Approx operator()( double value ) {
++            Approx approx( value );
++            approx.epsilon( m_epsilon );
++            approx.margin( m_margin );
++            approx.scale( m_scale );
++            return approx;
++        }
++
++        friend bool operator =3D=3D ( double lhs, Approx const& rhs ) {
++            // Thanks to Richard Harris for his help refining this formula
++            bool relativeOK =3D std::fabs( lhs - rhs.m_value ) < rhs.m_ep=
silon * (rhs.m_scale + (std::max)( std::fabs(lhs), std::fabs(rhs.m_value) )=
 );
++            if (relativeOK) {
++                return true;
++            }
++            return std::fabs(lhs - rhs.m_value) <=3D rhs.m_margin;
++        }
++
++        friend bool operator =3D=3D ( Approx const& lhs, double rhs ) {
++            return operator=3D=3D( rhs, lhs );
++        }
++
++        friend bool operator !=3D ( double lhs, Approx const& rhs ) {
++            return !operator=3D=3D( lhs, rhs );
++        }
++
++        friend bool operator !=3D ( Approx const& lhs, double rhs ) {
++            return !operator=3D=3D( rhs, lhs );
++        }
++
++        friend bool operator <=3D ( double lhs, Approx const& rhs ) {
++            return lhs < rhs.m_value || lhs =3D=3D rhs;
++        }
++
++        friend bool operator <=3D ( Approx const& lhs, double rhs ) {
++            return lhs.m_value < rhs || lhs =3D=3D rhs;
++        }
++
++        friend bool operator >=3D ( double lhs, Approx const& rhs ) {
++            return lhs > rhs.m_value || lhs =3D=3D rhs;
++        }
++
++        friend bool operator >=3D ( Approx const& lhs, double rhs ) {
++            return lhs.m_value > rhs || lhs =3D=3D rhs;
++        }
++
++        Approx& epsilon( double newEpsilon ) {
++            m_epsilon =3D newEpsilon;
++            return *this;
++        }
++
++        Approx& margin( double newMargin ) {
++            m_margin =3D newMargin;
++            return *this;
++        }
++
++        Approx& scale( double newScale ) {
++            m_scale =3D newScale;
++            return *this;
++        }
++#endif
++
++        std::string toString() const {
++            std::ostringstream oss;
++            oss << "Approx( " << Catch::toString( m_value ) << " )";
++            return oss.str();
++        }
++
++    private:
++        double m_epsilon;
++        double m_margin;
++        double m_scale;
++        double m_value;
++    };
++}
++
++template<>
++inline std::string toString<Detail::Approx>( Detail::Approx const& value =
) {
++    return value.toString();
++}
++
++} // end namespace Catch
++
++// #included from: internal/catch_matchers_string.h
++#define TWOBLUECUBES_CATCH_MATCHERS_STRING_H_INCLUDED
++
++namespace Catch {
++namespace Matchers {
++
++    namespace StdString {
++
++        struct CasedString
++        {
++            CasedString( std::string const& str, CaseSensitive::Choice ca=
seSensitivity );
++            std::string adjustString( std::string const& str ) const;
++            std::string caseSensitivitySuffix() const;
++
++            CaseSensitive::Choice m_caseSensitivity;
++            std::string m_str;
++        };
++
++        struct StringMatcherBase : MatcherBase<std::string> {
++            StringMatcherBase( std::string const& operation, CasedString =
const& comparator );
++            virtual std::string describe() const CATCH_OVERRIDE;
++
++            CasedString m_comparator;
++            std::string m_operation;
++        };
++
++        struct EqualsMatcher : StringMatcherBase {
++            EqualsMatcher( CasedString const& comparator );
++            virtual bool match( std::string const& source ) const CATCH_O=
VERRIDE;
++        };
++        struct ContainsMatcher : StringMatcherBase {
++            ContainsMatcher( CasedString const& comparator );
++            virtual bool match( std::string const& source ) const CATCH_O=
VERRIDE;
++        };
++        struct StartsWithMatcher : StringMatcherBase {
++            StartsWithMatcher( CasedString const& comparator );
++            virtual bool match( std::string const& source ) const CATCH_O=
VERRIDE;
++        };
++        struct EndsWithMatcher : StringMatcherBase {
++            EndsWithMatcher( CasedString const& comparator );
++            virtual bool match( std::string const& source ) const CATCH_O=
VERRIDE;
++        };
++
++    } // namespace StdString
++
++    // The following functions create the actual matcher objects.
++    // This allows the types to be inferred
++
++    StdString::EqualsMatcher Equals( std::string const& str, CaseSensitiv=
e::Choice caseSensitivity =3D CaseSensitive::Yes );
++    StdString::ContainsMatcher Contains( std::string const& str, CaseSens=
itive::Choice caseSensitivity =3D CaseSensitive::Yes );
++    StdString::EndsWithMatcher EndsWith( std::string const& str, CaseSens=
itive::Choice caseSensitivity =3D CaseSensitive::Yes );
++    StdString::StartsWithMatcher StartsWith( std::string const& str, Case=
Sensitive::Choice caseSensitivity =3D CaseSensitive::Yes );
++
++} // namespace Matchers
++} // namespace Catch
++
++// #included from: internal/catch_matchers_vector.h
++#define TWOBLUECUBES_CATCH_MATCHERS_VECTOR_H_INCLUDED
++
++namespace Catch {
++namespace Matchers {
++
++    namespace Vector {
++
++        template<typename T>
++        struct ContainsElementMatcher : MatcherBase<std::vector<T>, T> {
++
++            ContainsElementMatcher(T const &comparator) : m_comparator( c=
omparator) {}
++
++            bool match(std::vector<T> const &v) const CATCH_OVERRIDE {
++                return std::find(v.begin(), v.end(), m_comparator) !=3D v=
.end();
++            }
++
++            virtual std::string describe() const CATCH_OVERRIDE {
++                return "Contains: " + Catch::toString( m_comparator );
++            }
++
++            T const& m_comparator;
++        };
++
++        template<typename T>
++        struct ContainsMatcher : MatcherBase<std::vector<T>, std::vector<=
T> > {
++
++            ContainsMatcher(std::vector<T> const &comparator) : m_compara=
tor( comparator ) {}
++
++            bool match(std::vector<T> const &v) const CATCH_OVERRIDE {
++                // !TBD: see note in EqualsMatcher
++                if (m_comparator.size() > v.size())
++                    return false;
++                for (size_t i =3D 0; i < m_comparator.size(); ++i)
++                    if (std::find(v.begin(), v.end(), m_comparator[i]) =
=3D=3D v.end())
++                        return false;
++                return true;
++            }
++            virtual std::string describe() const CATCH_OVERRIDE {
++                return "Contains: " + Catch::toString( m_comparator );
++            }
++
++            std::vector<T> const& m_comparator;
++        };
++
++        template<typename T>
++        struct EqualsMatcher : MatcherBase<std::vector<T>, std::vector<T>=
 > {
++
++            EqualsMatcher(std::vector<T> const &comparator) : m_comparato=
r( comparator ) {}
++
++            bool match(std::vector<T> const &v) const CATCH_OVERRIDE {
++                // !TBD: This currently works if all elements can be comp=
ared using !=3D
++                // - a more general approach would be via a compare templ=
ate that defaults
++                // to using !=3D. but could be specialised for, e.g. std:=
:vector<T> etc
++                // - then just call that directly
++                if (m_comparator.size() !=3D v.size())
++                    return false;
++                for (size_t i =3D 0; i < v.size(); ++i)
++                    if (m_comparator[i] !=3D v[i])
++                        return false;
++                return true;
++            }
++            virtual std::string describe() const CATCH_OVERRIDE {
++                return "Equals: " + Catch::toString( m_comparator );
++            }
++            std::vector<T> const& m_comparator;
++        };
++
++    } // namespace Vector
++
++    // The following functions create the actual matcher objects.
++    // This allows the types to be inferred
++
++    template<typename T>
++    Vector::ContainsMatcher<T> Contains( std::vector<T> const& comparator=
 ) {
++        return Vector::ContainsMatcher<T>( comparator );
++    }
++
++    template<typename T>
++    Vector::ContainsElementMatcher<T> VectorContains( T const& comparator=
 ) {
++        return Vector::ContainsElementMatcher<T>( comparator );
++    }
++
++    template<typename T>
++    Vector::EqualsMatcher<T> Equals( std::vector<T> const& comparator ) {
++        return Vector::EqualsMatcher<T>( comparator );
++    }
++
++} // namespace Matchers
++} // namespace Catch
++
++// #included from: internal/catch_interfaces_tag_alias_registry.h
++#define TWOBLUECUBES_CATCH_INTERFACES_TAG_ALIAS_REGISTRY_H_INCLUDED
++
++// #included from: catch_tag_alias.h
++#define TWOBLUECUBES_CATCH_TAG_ALIAS_H_INCLUDED
++
++#include <string>
++
++namespace Catch {
++
++    struct TagAlias {
++        TagAlias( std::string const& _tag, SourceLineInfo _lineInfo ) : t=
ag( _tag ), lineInfo( _lineInfo ) {}
++
++        std::string tag;
++        SourceLineInfo lineInfo;
++    };
++
++    struct RegistrarForTagAliases {
++        RegistrarForTagAliases( char const* alias, char const* tag, Sourc=
eLineInfo const& lineInfo );
++    };
++
++} // end namespace Catch
++
++#define CATCH_REGISTER_TAG_ALIAS( alias, spec ) namespace{ Catch::Registr=
arForTagAliases INTERNAL_CATCH_UNIQUE_NAME( AutoRegisterTagAlias )( alias, =
spec, CATCH_INTERNAL_LINEINFO ); }
++// #included from: catch_option.hpp
++#define TWOBLUECUBES_CATCH_OPTION_HPP_INCLUDED
++
++namespace Catch {
++
++    // An optional type
++    template<typename T>
++    class Option {
++    public:
++        Option() : nullableValue( CATCH_NULL ) {}
++        Option( T const& _value )
++        : nullableValue( new( storage ) T( _value ) )
++        {}
++        Option( Option const& _other )
++        : nullableValue( _other ? new( storage ) T( *_other ) : CATCH_NUL=
L )
++        {}
++
++        ~Option() {
++            reset();
++        }
++
++        Option& operator=3D ( Option const& _other ) {
++            if( &_other !=3D this ) {
++                reset();
++                if( _other )
++                    nullableValue =3D new( storage ) T( *_other );
++            }
++            return *this;
++        }
++        Option& operator =3D ( T const& _value ) {
++            reset();
++            nullableValue =3D new( storage ) T( _value );
++            return *this;
++        }
++
++        void reset() {
++            if( nullableValue )
++                nullableValue->~T();
++            nullableValue =3D CATCH_NULL;
++        }
++
++        T& operator*() { return *nullableValue; }
++        T const& operator*() const { return *nullableValue; }
++        T* operator->() { return nullableValue; }
++        const T* operator->() const { return nullableValue; }
++
++        T valueOr( T const& defaultValue ) const {
++            return nullableValue ? *nullableValue : defaultValue;
++        }
++
++        bool some() const { return nullableValue !=3D CATCH_NULL; }
++        bool none() const { return nullableValue =3D=3D CATCH_NULL; }
++
++        bool operator !() const { return nullableValue =3D=3D CATCH_NULL;=
 }
++        operator SafeBool::type() const {
++            return SafeBool::makeSafe( some() );
++        }
++
++    private:
++        T *nullableValue;
++        union {
++            char storage[sizeof(T)];
++
++            // These are here to force alignment for the storage
++            long double dummy1;
++            void (*dummy2)();
++            long double dummy3;
++#ifdef CATCH_CONFIG_CPP11_LONG_LONG
++            long long dummy4;
++#endif
++        };
++    };
++
++} // end namespace Catch
++
++namespace Catch {
++
++    struct ITagAliasRegistry {
++        virtual ~ITagAliasRegistry();
++        virtual Option<TagAlias> find( std::string const& alias ) const =
=3D 0;
++        virtual std::string expandAliases( std::string const& unexpandedT=
estSpec ) const =3D 0;
++
++        static ITagAliasRegistry const& get();
++    };
++
++} // end namespace Catch
++
++// These files are included here so the single_include script doesn't put=
 them
++// in the conditionally compiled sections
++// #included from: internal/catch_test_case_info.h
++#define TWOBLUECUBES_CATCH_TEST_CASE_INFO_H_INCLUDED
++
++#include <string>
++#include <set>
++
++#ifdef __clang__
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wpadded"
++#endif
++
++namespace Catch {
++
++    struct ITestCase;
++
++    struct TestCaseInfo {
++        enum SpecialProperties{
++            None =3D 0,
++            IsHidden =3D 1 << 1,
++            ShouldFail =3D 1 << 2,
++            MayFail =3D 1 << 3,
++            Throws =3D 1 << 4,
++            NonPortable =3D 1 << 5
++        };
++
++        TestCaseInfo(   std::string const& _name,
++                        std::string const& _className,
++                        std::string const& _description,
++                        std::set<std::string> const& _tags,
++                        SourceLineInfo const& _lineInfo );
++
++        TestCaseInfo( TestCaseInfo const& other );
++
++        friend void setTags( TestCaseInfo& testCaseInfo, std::set<std::st=
ring> const& tags );
++
++        bool isHidden() const;
++        bool throws() const;
++        bool okToFail() const;
++        bool expectedToFail() const;
++
++        std::string name;
++        std::string className;
++        std::string description;
++        std::set<std::string> tags;
++        std::set<std::string> lcaseTags;
++        std::string tagsAsString;
++        SourceLineInfo lineInfo;
++        SpecialProperties properties;
++    };
++
++    class TestCase : public TestCaseInfo {
++    public:
++
++        TestCase( ITestCase* testCase, TestCaseInfo const& info );
++        TestCase( TestCase const& other );
++
++        TestCase withName( std::string const& _newName ) const;
++
++        void invoke() const;
++
++        TestCaseInfo const& getTestCaseInfo() const;
++
++        void swap( TestCase& other );
++        bool operator =3D=3D ( TestCase const& other ) const;
++        bool operator < ( TestCase const& other ) const;
++        TestCase& operator =3D ( TestCase const& other );
++
++    private:
++        Ptr<ITestCase> test;
++    };
++
++    TestCase makeTestCase(  ITestCase* testCase,
++                            std::string const& className,
++                            std::string const& name,
++                            std::string const& description,
++                            SourceLineInfo const& lineInfo );
++}
++
++#ifdef __clang__
++#pragma clang diagnostic pop
++#endif
++
++
++#ifdef __OBJC__
++// #included from: internal/catch_objc.hpp
++#define TWOBLUECUBES_CATCH_OBJC_HPP_INCLUDED
++
++#import <objc/runtime.h>
++
++#include <string>
++
++// NB. Any general catch headers included here must be included
++// in catch.hpp first to make sure they are included by the single
++// header for non obj-usage
++
++/////////////////////////////////////////////////////////////////////////=
//////
++// This protocol is really only here for (self) documenting purposes, sin=
ce
++// all its methods are optional.
++@protocol OcFixture
++
++@optional
++
++-(void) setUp;
++-(void) tearDown;
++
++@end
++
++namespace Catch {
++
++    class OcMethod : public SharedImpl<ITestCase> {
++
++    public:
++        OcMethod( Class cls, SEL sel ) : m_cls( cls ), m_sel( sel ) {}
++
++        virtual void invoke() const {
++            id obj =3D [[m_cls alloc] init];
++
++            performOptionalSelector( obj, @selector(setUp)  );
++            performOptionalSelector( obj, m_sel );
++            performOptionalSelector( obj, @selector(tearDown)  );
++
++            arcSafeRelease( obj );
++        }
++    private:
++        virtual ~OcMethod() {}
++
++        Class m_cls;
++        SEL m_sel;
++    };
++
++    namespace Detail{
++
++        inline std::string getAnnotation(   Class cls,
++                                            std::string const& annotation=
Name,
++                                            std::string const& testCaseNa=
me ) {
++            NSString* selStr =3D [[NSString alloc] initWithFormat:@"Catch=
_%s_%s", annotationName.c_str(), testCaseName.c_str()];
++            SEL sel =3D NSSelectorFromString( selStr );
++            arcSafeRelease( selStr );
++            id value =3D performOptionalSelector( cls, sel );
++            if( value )
++                return [(NSString*)value UTF8String];
++            return "";
++        }
++    }
++
++    inline size_t registerTestMethods() {
++        size_t noTestMethods =3D 0;
++        int noClasses =3D objc_getClassList( CATCH_NULL, 0 );
++
++        Class* classes =3D (CATCH_UNSAFE_UNRETAINED Class *)malloc( sizeo=
f(Class) * noClasses);
++        objc_getClassList( classes, noClasses );
++
++        for( int c =3D 0; c < noClasses; c++ ) {
++            Class cls =3D classes[c];
++            {
++                u_int count;
++                Method* methods =3D class_copyMethodList( cls, &count );
++                for( u_int m =3D 0; m < count ; m++ ) {
++                    SEL selector =3D method_getName(methods[m]);
++                    std::string methodName =3D sel_getName(selector);
++                    if( startsWith( methodName, "Catch_TestCase_" ) ) {
++                        std::string testCaseName =3D methodName.substr( 1=
5 );
++                        std::string name =3D Detail::getAnnotation( cls, =
"Name", testCaseName );
++                        std::string desc =3D Detail::getAnnotation( cls, =
"Description", testCaseName );
++                        const char* className =3D class_getName( cls );
++
++                        getMutableRegistryHub().registerTest( makeTestCas=
e( new OcMethod( cls, selector ), className, name.c_str(), desc.c_str(), So=
urceLineInfo() ) );
++                        noTestMethods++;
++                    }
++                }
++                free(methods);
++            }
++        }
++        return noTestMethods;
++    }
++
++    namespace Matchers {
++        namespace Impl {
++        namespace NSStringMatchers {
++
++            struct StringHolder : MatcherBase<NSString*>{
++                StringHolder( NSString* substr ) : m_substr( [substr copy=
] ){}
++                StringHolder( StringHolder const& other ) : m_substr( [ot=
her.m_substr copy] ){}
++                StringHolder() {
++                    arcSafeRelease( m_substr );
++                }
++
++                virtual bool match( NSString* arg ) const CATCH_OVERRIDE {
++                    return false;
++                }
++
++                NSString* m_substr;
++            };
++
++            struct Equals : StringHolder {
++                Equals( NSString* substr ) : StringHolder( substr ){}
++
++                virtual bool match( NSString* str ) const CATCH_OVERRIDE {
++                    return  (str !=3D nil || m_substr =3D=3D nil ) &&
++                            [str isEqualToString:m_substr];
++                }
++
++                virtual std::string describe() const CATCH_OVERRIDE {
++                    return "equals string: " + Catch::toString( m_substr =
);
++                }
++            };
++
++            struct Contains : StringHolder {
++                Contains( NSString* substr ) : StringHolder( substr ){}
++
++                virtual bool match( NSString* str ) const {
++                    return  (str !=3D nil || m_substr =3D=3D nil ) &&
++                            [str rangeOfString:m_substr].location !=3D NS=
NotFound;
++                }
++
++                virtual std::string describe() const CATCH_OVERRIDE {
++                    return "contains string: " + Catch::toString( m_subst=
r );
++                }
++            };
++
++            struct StartsWith : StringHolder {
++                StartsWith( NSString* substr ) : StringHolder( substr ){}
++
++                virtual bool match( NSString* str ) const {
++                    return  (str !=3D nil || m_substr =3D=3D nil ) &&
++                            [str rangeOfString:m_substr].location =3D=3D =
0;
++                }
++
++                virtual std::string describe() const CATCH_OVERRIDE {
++                    return "starts with: " + Catch::toString( m_substr );
++                }
++            };
++            struct EndsWith : StringHolder {
++                EndsWith( NSString* substr ) : StringHolder( substr ){}
++
++                virtual bool match( NSString* str ) const {
++                    return  (str !=3D nil || m_substr =3D=3D nil ) &&
++                            [str rangeOfString:m_substr].location =3D=3D =
[str length] - [m_substr length];
++                }
++
++                virtual std::string describe() const CATCH_OVERRIDE {
++                    return "ends with: " + Catch::toString( m_substr );
++                }
++            };
++
++        } // namespace NSStringMatchers
++        } // namespace Impl
++
++        inline Impl::NSStringMatchers::Equals
++            Equals( NSString* substr ){ return Impl::NSStringMatchers::Eq=
uals( substr ); }
++
++        inline Impl::NSStringMatchers::Contains
++            Contains( NSString* substr ){ return Impl::NSStringMatchers::=
Contains( substr ); }
++
++        inline Impl::NSStringMatchers::StartsWith
++            StartsWith( NSString* substr ){ return Impl::NSStringMatchers=
::StartsWith( substr ); }
++
++        inline Impl::NSStringMatchers::EndsWith
++            EndsWith( NSString* substr ){ return Impl::NSStringMatchers::=
EndsWith( substr ); }
++
++    } // namespace Matchers
++
++    using namespace Matchers;
++
++} // namespace Catch
++
++/////////////////////////////////////////////////////////////////////////=
//////
++#define OC_TEST_CASE( name, desc )\
+++(NSString*) INTERNAL_CATCH_UNIQUE_NAME( Catch_Name_test ) \
++{\
++return @ name; \
++}\
+++(NSString*) INTERNAL_CATCH_UNIQUE_NAME( Catch_Description_test ) \
++{ \
++return @ desc; \
++} \
++-(void) INTERNAL_CATCH_UNIQUE_NAME( Catch_TestCase_test )
++
++#endif
++
++#ifdef CATCH_IMPL
++
++// !TBD: Move the leak detector code into a separate header
++#ifdef CATCH_CONFIG_WINDOWS_CRTDBG
++#include <crtdbg.h>
++class LeakDetector {
++public:
++    LeakDetector() {
++        int flag =3D _CrtSetDbgFlag(_CRTDBG_REPORT_FLAG);
++        flag |=3D _CRTDBG_LEAK_CHECK_DF;
++        flag |=3D _CRTDBG_ALLOC_MEM_DF;
++        _CrtSetDbgFlag(flag);
++        _CrtSetReportMode(_CRT_WARN, _CRTDBG_MODE_FILE | _CRTDBG_MODE_DEB=
UG);
++        _CrtSetReportFile(_CRT_WARN, _CRTDBG_FILE_STDERR);
++        // Change this to leaking allocation's number to break there
++        _CrtSetBreakAlloc(-1);
++    }
++};
++#else
++class LeakDetector {};
++#endif
++
++LeakDetector leakDetector;
++
++// #included from: internal/catch_impl.hpp
++#define TWOBLUECUBES_CATCH_IMPL_HPP_INCLUDED
++
++// Collect all the implementation files together here
++// These are the equivalent of what would usually be cpp files
++
++#ifdef __clang__
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wweak-vtables"
++#endif
++
++// #included from: ../catch_session.hpp
++#define TWOBLUECUBES_CATCH_RUNNER_HPP_INCLUDED
++
++// #included from: internal/catch_commandline.hpp
++#define TWOBLUECUBES_CATCH_COMMANDLINE_HPP_INCLUDED
++
++// #included from: catch_config.hpp
++#define TWOBLUECUBES_CATCH_CONFIG_HPP_INCLUDED
++
++// #included from: catch_test_spec_parser.hpp
++#define TWOBLUECUBES_CATCH_TEST_SPEC_PARSER_HPP_INCLUDED
++
++#ifdef __clang__
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wpadded"
++#endif
++
++// #included from: catch_test_spec.hpp
++#define TWOBLUECUBES_CATCH_TEST_SPEC_HPP_INCLUDED
++
++#ifdef __clang__
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wpadded"
++#endif
++
++// #included from: catch_wildcard_pattern.hpp
++#define TWOBLUECUBES_CATCH_WILDCARD_PATTERN_HPP_INCLUDED
++
++#include <stdexcept>
++
++namespace Catch
++{
++    class WildcardPattern {
++        enum WildcardPosition {
++            NoWildcard =3D 0,
++            WildcardAtStart =3D 1,
++            WildcardAtEnd =3D 2,
++            WildcardAtBothEnds =3D WildcardAtStart | WildcardAtEnd
++        };
++
++    public:
++
++        WildcardPattern( std::string const& pattern, CaseSensitive::Choic=
e caseSensitivity )
++        :   m_caseSensitivity( caseSensitivity ),
++            m_wildcard( NoWildcard ),
++            m_pattern( adjustCase( pattern ) )
++        {
++            if( startsWith( m_pattern, '*' ) ) {
++                m_pattern =3D m_pattern.substr( 1 );
++                m_wildcard =3D WildcardAtStart;
++            }
++            if( endsWith( m_pattern, '*' ) ) {
++                m_pattern =3D m_pattern.substr( 0, m_pattern.size()-1 );
++                m_wildcard =3D static_cast<WildcardPosition>( m_wildcard =
| WildcardAtEnd );
++            }
++        }
++        virtual ~WildcardPattern();
++        virtual bool matches( std::string const& str ) const {
++            switch( m_wildcard ) {
++                case NoWildcard:
++                    return m_pattern =3D=3D adjustCase( str );
++                case WildcardAtStart:
++                    return endsWith( adjustCase( str ), m_pattern );
++                case WildcardAtEnd:
++                    return startsWith( adjustCase( str ), m_pattern );
++                case WildcardAtBothEnds:
++                    return contains( adjustCase( str ), m_pattern );
++            }
++
++#ifdef __clang__
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wunreachable-code"
++#endif
++            throw std::logic_error( "Unknown enum" );
++#ifdef __clang__
++#pragma clang diagnostic pop
++#endif
++        }
++    private:
++        std::string adjustCase( std::string const& str ) const {
++            return m_caseSensitivity =3D=3D CaseSensitive::No ? toLower( =
str ) : str;
++        }
++        CaseSensitive::Choice m_caseSensitivity;
++        WildcardPosition m_wildcard;
++        std::string m_pattern;
++    };
++}
++
++#include <string>
++#include <vector>
++
++namespace Catch {
++
++    class TestSpec {
++        struct Pattern : SharedImpl<> {
++            virtual ~Pattern();
++            virtual bool matches( TestCaseInfo const& testCase ) const =
=3D 0;
++        };
++        class NamePattern : public Pattern {
++        public:
++            NamePattern( std::string const& name )
++            : m_wildcardPattern( toLower( name ), CaseSensitive::No )
++            {}
++            virtual ~NamePattern();
++            virtual bool matches( TestCaseInfo const& testCase ) const {
++                return m_wildcardPattern.matches( toLower( testCase.name =
) );
++            }
++        private:
++            WildcardPattern m_wildcardPattern;
++        };
++
++        class TagPattern : public Pattern {
++        public:
++            TagPattern( std::string const& tag ) : m_tag( toLower( tag ) =
) {}
++            virtual ~TagPattern();
++            virtual bool matches( TestCaseInfo const& testCase ) const {
++                return testCase.lcaseTags.find( m_tag ) !=3D testCase.lca=
seTags.end();
++            }
++        private:
++            std::string m_tag;
++        };
++
++        class ExcludedPattern : public Pattern {
++        public:
++            ExcludedPattern( Ptr<Pattern> const& underlyingPattern ) : m_=
underlyingPattern( underlyingPattern ) {}
++            virtual ~ExcludedPattern();
++            virtual bool matches( TestCaseInfo const& testCase ) const { =
return !m_underlyingPattern->matches( testCase ); }
++        private:
++            Ptr<Pattern> m_underlyingPattern;
++        };
++
++        struct Filter {
++            std::vector<Ptr<Pattern> > m_patterns;
++
++            bool matches( TestCaseInfo const& testCase ) const {
++                // All patterns in a filter must match for the filter to =
be a match
++                for( std::vector<Ptr<Pattern> >::const_iterator it =3D m_=
patterns.begin(), itEnd =3D m_patterns.end(); it !=3D itEnd; ++it ) {
++                    if( !(*it)->matches( testCase ) )
++                        return false;
++                }
++                return true;
++            }
++        };
++
++    public:
++        bool hasFilters() const {
++            return !m_filters.empty();
++        }
++        bool matches( TestCaseInfo const& testCase ) const {
++            // A TestSpec matches if any filter matches
++            for( std::vector<Filter>::const_iterator it =3D m_filters.beg=
in(), itEnd =3D m_filters.end(); it !=3D itEnd; ++it )
++                if( it->matches( testCase ) )
++                    return true;
++            return false;
++        }
++
++    private:
++        std::vector<Filter> m_filters;
++
++        friend class TestSpecParser;
++    };
++}
++
++#ifdef __clang__
++#pragma clang diagnostic pop
++#endif
++
++namespace Catch {
++
++    class TestSpecParser {
++        enum Mode{ None, Name, QuotedName, Tag, EscapedName };
++        Mode m_mode;
++        bool m_exclusion;
++        std::size_t m_start, m_pos;
++        std::string m_arg;
++        std::vector<std::size_t> m_escapeChars;
++        TestSpec::Filter m_currentFilter;
++        TestSpec m_testSpec;
++        ITagAliasRegistry const* m_tagAliases;
++
++    public:
++        TestSpecParser( ITagAliasRegistry const& tagAliases ) :m_mode(Non=
e), m_exclusion(false), m_start(0), m_pos(0), m_tagAliases( &tagAliases ) {}
++
++        TestSpecParser& parse( std::string const& arg ) {
++            m_mode =3D None;
++            m_exclusion =3D false;
++            m_start =3D std::string::npos;
++            m_arg =3D m_tagAliases->expandAliases( arg );
++            m_escapeChars.clear();
++            for( m_pos =3D 0; m_pos < m_arg.size(); ++m_pos )
++                visitChar( m_arg[m_pos] );
++            if( m_mode =3D=3D Name )
++                addPattern<TestSpec::NamePattern>();
++            return *this;
++        }
++        TestSpec testSpec() {
++            addFilter();
++            return m_testSpec;
++        }
++    private:
++        void visitChar( char c ) {
++            if( m_mode =3D=3D None ) {
++                switch( c ) {
++                case ' ': return;
++                case '~': m_exclusion =3D true; return;
++                case '[': return startNewMode( Tag, ++m_pos );
++                case '"': return startNewMode( QuotedName, ++m_pos );
++                case '\\': return escape();
++                default: startNewMode( Name, m_pos ); break;
++                }
++            }
++            if( m_mode =3D=3D Name ) {
++                if( c =3D=3D ',' ) {
++                    addPattern<TestSpec::NamePattern>();
++                    addFilter();
++                }
++                else if( c =3D=3D '[' ) {
++                    if( subString() =3D=3D "exclude:" )
++                        m_exclusion =3D true;
++                    else
++                        addPattern<TestSpec::NamePattern>();
++                    startNewMode( Tag, ++m_pos );
++                }
++                else if( c =3D=3D '\\' )
++                    escape();
++            }
++            else if( m_mode =3D=3D EscapedName )
++                m_mode =3D Name;
++            else if( m_mode =3D=3D QuotedName && c =3D=3D '"' )
++                addPattern<TestSpec::NamePattern>();
++            else if( m_mode =3D=3D Tag && c =3D=3D ']' )
++                addPattern<TestSpec::TagPattern>();
++        }
++        void startNewMode( Mode mode, std::size_t start ) {
++            m_mode =3D mode;
++            m_start =3D start;
++        }
++        void escape() {
++            if( m_mode =3D=3D None )
++                m_start =3D m_pos;
++            m_mode =3D EscapedName;
++            m_escapeChars.push_back( m_pos );
++        }
++        std::string subString() const { return m_arg.substr( m_start, m_p=
os - m_start ); }
++        template<typename T>
++        void addPattern() {
++            std::string token =3D subString();
++            for( size_t i =3D 0; i < m_escapeChars.size(); ++i )
++                token =3D token.substr( 0, m_escapeChars[i]-m_start-i ) +=
 token.substr( m_escapeChars[i]-m_start-i+1 );
++            m_escapeChars.clear();
++            if( startsWith( token, "exclude:" ) ) {
++                m_exclusion =3D true;
++                token =3D token.substr( 8 );
++            }
++            if( !token.empty() ) {
++                Ptr<TestSpec::Pattern> pattern =3D new T( token );
++                if( m_exclusion )
++                    pattern =3D new TestSpec::ExcludedPattern( pattern );
++                m_currentFilter.m_patterns.push_back( pattern );
++            }
++            m_exclusion =3D false;
++            m_mode =3D None;
++        }
++        void addFilter() {
++            if( !m_currentFilter.m_patterns.empty() ) {
++                m_testSpec.m_filters.push_back( m_currentFilter );
++                m_currentFilter =3D TestSpec::Filter();
++            }
++        }
++    };
++    inline TestSpec parseTestSpec( std::string const& arg ) {
++        return TestSpecParser( ITagAliasRegistry::get() ).parse( arg ).te=
stSpec();
++    }
++
++} // namespace Catch
++
++#ifdef __clang__
++#pragma clang diagnostic pop
++#endif
++
++// #included from: catch_interfaces_config.h
++#define TWOBLUECUBES_CATCH_INTERFACES_CONFIG_H_INCLUDED
++
++#include <iosfwd>
++#include <string>
++#include <vector>
++
++namespace Catch {
++
++    struct Verbosity { enum Level {
++        NoOutput =3D 0,
++        Quiet,
++        Normal
++    }; };
++
++    struct WarnAbout { enum What {
++        Nothing =3D 0x00,
++        NoAssertions =3D 0x01
++    }; };
++
++    struct ShowDurations { enum OrNot {
++        DefaultForReporter,
++        Always,
++        Never
++    }; };
++    struct RunTests { enum InWhatOrder {
++        InDeclarationOrder,
++        InLexicographicalOrder,
++        InRandomOrder
++    }; };
++    struct UseColour { enum YesOrNo {
++        Auto,
++        Yes,
++        No
++    }; };
++    struct WaitForKeypress { enum When {
++        Never,
++        BeforeStart =3D 1,
++        BeforeExit =3D 2,
++        BeforeStartAndExit =3D BeforeStart | BeforeExit
++    }; };
++
++    class TestSpec;
++
++    struct IConfig : IShared {
++
++        virtual ~IConfig();
++
++        virtual bool allowThrows() const =3D 0;
++        virtual std::ostream& stream() const =3D 0;
++        virtual std::string name() const =3D 0;
++        virtual bool includeSuccessfulResults() const =3D 0;
++        virtual bool shouldDebugBreak() const =3D 0;
++        virtual bool warnAboutMissingAssertions() const =3D 0;
++        virtual int abortAfter() const =3D 0;
++        virtual bool showInvisibles() const =3D 0;
++        virtual ShowDurations::OrNot showDurations() const =3D 0;
++        virtual TestSpec const& testSpec() const =3D 0;
++        virtual RunTests::InWhatOrder runOrder() const =3D 0;
++        virtual unsigned int rngSeed() const =3D 0;
++        virtual UseColour::YesOrNo useColour() const =3D 0;
++        virtual std::vector<std::string> const& getSectionsToRun() const =
=3D 0;
++
++    };
++}
++
++// #included from: catch_stream.h
++#define TWOBLUECUBES_CATCH_STREAM_H_INCLUDED
++
++// #included from: catch_streambuf.h
++#define TWOBLUECUBES_CATCH_STREAMBUF_H_INCLUDED
++
++#include <streambuf>
++
++namespace Catch {
++
++    class StreamBufBase : public std::streambuf {
++    public:
++        virtual ~StreamBufBase() CATCH_NOEXCEPT;
++    };
++}
++
++#include <streambuf>
++#include <ostream>
++#include <fstream>
++#include <memory>
++
++namespace Catch {
++
++    std::ostream& cout();
++    std::ostream& cerr();
++    std::ostream& clog();
++
++    struct IStream {
++        virtual ~IStream() CATCH_NOEXCEPT;
++        virtual std::ostream& stream() const =3D 0;
++    };
++
++    class FileStream : public IStream {
++        mutable std::ofstream m_ofs;
++    public:
++        FileStream( std::string const& filename );
++        virtual ~FileStream() CATCH_NOEXCEPT;
++    public: // IStream
++        virtual std::ostream& stream() const CATCH_OVERRIDE;
++    };
++
++    class CoutStream : public IStream {
++        mutable std::ostream m_os;
++    public:
++        CoutStream();
++        virtual ~CoutStream() CATCH_NOEXCEPT;
++
++    public: // IStream
++        virtual std::ostream& stream() const CATCH_OVERRIDE;
++    };
++
++    class DebugOutStream : public IStream {
++        CATCH_AUTO_PTR( StreamBufBase ) m_streamBuf;
++        mutable std::ostream m_os;
++    public:
++        DebugOutStream();
++        virtual ~DebugOutStream() CATCH_NOEXCEPT;
++
++    public: // IStream
++        virtual std::ostream& stream() const CATCH_OVERRIDE;
++    };
++}
++
++#include <memory>
++#include <vector>
++#include <string>
++#include <stdexcept>
++
++#ifndef CATCH_CONFIG_CONSOLE_WIDTH
++#define CATCH_CONFIG_CONSOLE_WIDTH 80
++#endif
++
++namespace Catch {
++
++    struct ConfigData {
++
++        ConfigData()
++        :   listTests( false ),
++            listTags( false ),
++            listReporters( false ),
++            listTestNamesOnly( false ),
++            listExtraInfo( false ),
++            showSuccessfulTests( false ),
++            shouldDebugBreak( false ),
++            noThrow( false ),
++            showHelp( false ),
++            showInvisibles( false ),
++            filenamesAsTags( false ),
++            libIdentify( false ),
++            abortAfter( -1 ),
++            rngSeed( 0 ),
++            verbosity( Verbosity::Normal ),
++            warnings( WarnAbout::Nothing ),
++            showDurations( ShowDurations::DefaultForReporter ),
++            runOrder( RunTests::InDeclarationOrder ),
++            useColour( UseColour::Auto ),
++            waitForKeypress( WaitForKeypress::Never )
++        {}
++
++        bool listTests;
++        bool listTags;
++        bool listReporters;
++        bool listTestNamesOnly;
++        bool listExtraInfo;
++
++        bool showSuccessfulTests;
++        bool shouldDebugBreak;
++        bool noThrow;
++        bool showHelp;
++        bool showInvisibles;
++        bool filenamesAsTags;
++        bool libIdentify;
++
++        int abortAfter;
++        unsigned int rngSeed;
++
++        Verbosity::Level verbosity;
++        WarnAbout::What warnings;
++        ShowDurations::OrNot showDurations;
++        RunTests::InWhatOrder runOrder;
++        UseColour::YesOrNo useColour;
++        WaitForKeypress::When waitForKeypress;
++
++        std::string outputFilename;
++        std::string name;
++        std::string processName;
++
++        std::vector<std::string> reporterNames;
++        std::vector<std::string> testsOrTags;
++        std::vector<std::string> sectionsToRun;
++    };
++
++    class Config : public SharedImpl<IConfig> {
++    private:
++        Config( Config const& other );
++        Config& operator =3D ( Config const& other );
++        virtual void dummy();
++    public:
++
++        Config()
++        {}
++
++        Config( ConfigData const& data )
++        :   m_data( data ),
++            m_stream( openStream() )
++        {
++            if( !data.testsOrTags.empty() ) {
++                TestSpecParser parser( ITagAliasRegistry::get() );
++                for( std::size_t i =3D 0; i < data.testsOrTags.size(); ++=
i )
++                    parser.parse( data.testsOrTags[i] );
++                m_testSpec =3D parser.testSpec();
++            }
++        }
++
++        virtual ~Config() {}
++
++        std::string const& getFilename() const {
++            return m_data.outputFilename ;
++        }
++
++        bool listTests() const { return m_data.listTests; }
++        bool listTestNamesOnly() const { return m_data.listTestNamesOnly;=
 }
++        bool listTags() const { return m_data.listTags; }
++        bool listReporters() const { return m_data.listReporters; }
++        bool listExtraInfo() const { return m_data.listExtraInfo; }
++
++        std::string getProcessName() const { return m_data.processName; }
++
++        std::vector<std::string> const& getReporterNames() const { return=
 m_data.reporterNames; }
++        std::vector<std::string> const& getSectionsToRun() const CATCH_OV=
ERRIDE { return m_data.sectionsToRun; }
++
++        virtual TestSpec const& testSpec() const CATCH_OVERRIDE { return =
m_testSpec; }
++
++        bool showHelp() const { return m_data.showHelp; }
++
++        // IConfig interface
++        virtual bool allowThrows() const CATCH_OVERRIDE                 {=
 return !m_data.noThrow; }
++        virtual std::ostream& stream() const CATCH_OVERRIDE             {=
 return m_stream->stream(); }
++        virtual std::string name() const CATCH_OVERRIDE                 {=
 return m_data.name.empty() ? m_data.processName : m_data.name; }
++        virtual bool includeSuccessfulResults() const CATCH_OVERRIDE    {=
 return m_data.showSuccessfulTests; }
++        virtual bool warnAboutMissingAssertions() const CATCH_OVERRIDE  {=
 return m_data.warnings & WarnAbout::NoAssertions; }
++        virtual ShowDurations::OrNot showDurations() const CATCH_OVERRIDE=
 { return m_data.showDurations; }
++        virtual RunTests::InWhatOrder runOrder() const CATCH_OVERRIDE   {=
 return m_data.runOrder; }
++        virtual unsigned int rngSeed() const CATCH_OVERRIDE             {=
 return m_data.rngSeed; }
++        virtual UseColour::YesOrNo useColour() const CATCH_OVERRIDE     {=
 return m_data.useColour; }
++        virtual bool shouldDebugBreak() const CATCH_OVERRIDE { return m_d=
ata.shouldDebugBreak; }
++        virtual int abortAfter() const CATCH_OVERRIDE { return m_data.abo=
rtAfter; }
++        virtual bool showInvisibles() const CATCH_OVERRIDE { return m_dat=
a.showInvisibles; }
++
++    private:
++
++        IStream const* openStream() {
++            if( m_data.outputFilename.empty() )
++                return new CoutStream();
++            else if( m_data.outputFilename[0] =3D=3D '%' ) {
++                if( m_data.outputFilename =3D=3D "%debug" )
++                    return new DebugOutStream();
++                else
++                    throw std::domain_error( "Unrecognised stream: " + m_=
data.outputFilename );
++            }
++            else
++                return new FileStream( m_data.outputFilename );
++        }
++        ConfigData m_data;
++
++        CATCH_AUTO_PTR( IStream const ) m_stream;
++        TestSpec m_testSpec;
++    };
++
++} // end namespace Catch
++
++// #included from: catch_clara.h
++#define TWOBLUECUBES_CATCH_CLARA_H_INCLUDED
++
++// Use Catch's value for console width (store Clara's off to the side, if=
 present)
++#ifdef CLARA_CONFIG_CONSOLE_WIDTH
++#define CATCH_TEMP_CLARA_CONFIG_CONSOLE_WIDTH CLARA_CONFIG_CONSOLE_WIDTH
++#undef CLARA_CONFIG_CONSOLE_WIDTH
++#endif
++#define CLARA_CONFIG_CONSOLE_WIDTH CATCH_CONFIG_CONSOLE_WIDTH
++
++// Declare Clara inside the Catch namespace
++#define STITCH_CLARA_OPEN_NAMESPACE namespace Catch {
++// #included from: ../external/clara.h
++
++// Version 0.0.2.4
++
++// Only use header guard if we are not using an outer namespace
++#if !defined(TWOBLUECUBES_CLARA_H_INCLUDED) || defined(STITCH_CLARA_OPEN_=
NAMESPACE)
++
++#ifndef STITCH_CLARA_OPEN_NAMESPACE
++#define TWOBLUECUBES_CLARA_H_INCLUDED
++#define STITCH_CLARA_OPEN_NAMESPACE
++#define STITCH_CLARA_CLOSE_NAMESPACE
++#else
++#define STITCH_CLARA_CLOSE_NAMESPACE }
++#endif
++
++#define STITCH_TBC_TEXT_FORMAT_OPEN_NAMESPACE STITCH_CLARA_OPEN_NAMESPACE
++
++// ----------- #included from tbc_text_format.h -----------
++
++// Only use header guard if we are not using an outer namespace
++#if !defined(TBC_TEXT_FORMAT_H_INCLUDED) || defined(STITCH_TBC_TEXT_FORMA=
T_OUTER_NAMESPACE)
++#ifndef STITCH_TBC_TEXT_FORMAT_OUTER_NAMESPACE
++#define TBC_TEXT_FORMAT_H_INCLUDED
++#endif
++
++#include <string>
++#include <vector>
++#include <sstream>
++#include <algorithm>
++#include <cctype>
++
++// Use optional outer namespace
++#ifdef STITCH_TBC_TEXT_FORMAT_OUTER_NAMESPACE
++namespace STITCH_TBC_TEXT_FORMAT_OUTER_NAMESPACE {
++#endif
++
++namespace Tbc {
++
++#ifdef TBC_TEXT_FORMAT_CONSOLE_WIDTH
++    const unsigned int consoleWidth =3D TBC_TEXT_FORMAT_CONSOLE_WIDTH;
++#else
++    const unsigned int consoleWidth =3D 80;
++#endif
++
++    struct TextAttributes {
++        TextAttributes()
++        :   initialIndent( std::string::npos ),
++            indent( 0 ),
++            width( consoleWidth-1 ),
++            tabChar( '\t' )
++        {}
++
++        TextAttributes& setInitialIndent( std::size_t _value )  { initial=
Indent =3D _value; return *this; }
++        TextAttributes& setIndent( std::size_t _value )         { indent =
=3D _value; return *this; }
++        TextAttributes& setWidth( std::size_t _value )          { width =
=3D _value; return *this; }
++        TextAttributes& setTabChar( char _value )               { tabChar=
 =3D _value; return *this; }
++
++        std::size_t initialIndent;  // indent of first line, or npos
++        std::size_t indent;         // indent of subsequent lines, or all=
 if initialIndent is npos
++        std::size_t width;          // maximum width of text, including i=
ndent. Longer text will wrap
++        char tabChar;               // If this char is seen the indent is=
 changed to current pos
++    };
++
++    class Text {
++    public:
++        Text( std::string const& _str, TextAttributes const& _attr =3D Te=
xtAttributes() )
++        : attr( _attr )
++        {
++            std::string wrappableChars =3D " [({.,/|\\-";
++            std::size_t indent =3D _attr.initialIndent !=3D std::string::=
npos
++                ? _attr.initialIndent
++                : _attr.indent;
++            std::string remainder =3D _str;
++
++            while( !remainder.empty() ) {
++                if( lines.size() >=3D 1000 ) {
++                    lines.push_back( "... message truncated due to excess=
ive size" );
++                    return;
++                }
++                std::size_t tabPos =3D std::string::npos;
++                std::size_t width =3D (std::min)( remainder.size(), _attr=
.width - indent );
++                std::size_t pos =3D remainder.find_first_of( '\n' );
++                if( pos <=3D width ) {
++                    width =3D pos;
++                }
++                pos =3D remainder.find_last_of( _attr.tabChar, width );
++                if( pos !=3D std::string::npos ) {
++                    tabPos =3D pos;
++                    if( remainder[width] =3D=3D '\n' )
++                        width--;
++                    remainder =3D remainder.substr( 0, tabPos ) + remaind=
er.substr( tabPos+1 );
++                }
++
++                if( width =3D=3D remainder.size() ) {
++                    spliceLine( indent, remainder, width );
++                }
++                else if( remainder[width] =3D=3D '\n' ) {
++                    spliceLine( indent, remainder, width );
++                    if( width <=3D 1 || remainder.size() !=3D 1 )
++                        remainder =3D remainder.substr( 1 );
++                    indent =3D _attr.indent;
++                }
++                else {
++                    pos =3D remainder.find_last_of( wrappableChars, width=
 );
++                    if( pos !=3D std::string::npos && pos > 0 ) {
++                        spliceLine( indent, remainder, pos );
++                        if( remainder[0] =3D=3D ' ' )
++                            remainder =3D remainder.substr( 1 );
++                    }
++                    else {
++                        spliceLine( indent, remainder, width-1 );
++                        lines.back() +=3D "-";
++                    }
++                    if( lines.size() =3D=3D 1 )
++                        indent =3D _attr.indent;
++                    if( tabPos !=3D std::string::npos )
++                        indent +=3D tabPos;
++                }
++            }
++        }
++
++        void spliceLine( std::size_t _indent, std::string& _remainder, st=
d::size_t _pos ) {
++            lines.push_back( std::string( _indent, ' ' ) + _remainder.sub=
str( 0, _pos ) );
++            _remainder =3D _remainder.substr( _pos );
++        }
++
++        typedef std::vector<std::string>::const_iterator const_iterator;
++
++        const_iterator begin() const { return lines.begin(); }
++        const_iterator end() const { return lines.end(); }
++        std::string const& last() const { return lines.back(); }
++        std::size_t size() const { return lines.size(); }
++        std::string const& operator[]( std::size_t _index ) const { retur=
n lines[_index]; }
++        std::string toString() const {
++            std::ostringstream oss;
++            oss << *this;
++            return oss.str();
++        }
++
++        friend std::ostream& operator << ( std::ostream& _stream, Text co=
nst& _text ) {
++            for( Text::const_iterator it =3D _text.begin(), itEnd =3D _te=
xt.end();
++                it !=3D itEnd; ++it ) {
++                if( it !=3D _text.begin() )
++                    _stream << "\n";
++                _stream << *it;
++            }
++            return _stream;
++        }
++
++    private:
++        std::string str;
++        TextAttributes attr;
++        std::vector<std::string> lines;
++    };
++
++} // end namespace Tbc
++
++#ifdef STITCH_TBC_TEXT_FORMAT_OUTER_NAMESPACE
++} // end outer namespace
++#endif
++
++#endif // TBC_TEXT_FORMAT_H_INCLUDED
++
++// ----------- end of #include from tbc_text_format.h -----------
++// ........... back in clara.h
++
++#undef STITCH_TBC_TEXT_FORMAT_OPEN_NAMESPACE
++
++// ----------- #included from clara_compilers.h -----------
++
++#ifndef TWOBLUECUBES_CLARA_COMPILERS_H_INCLUDED
++#define TWOBLUECUBES_CLARA_COMPILERS_H_INCLUDED
++
++// Detect a number of compiler features - mostly C++11/14 conformance - b=
y compiler
++// The following features are defined:
++//
++// CLARA_CONFIG_CPP11_NULLPTR : is nullptr supported?
++// CLARA_CONFIG_CPP11_NOEXCEPT : is noexcept supported?
++// CLARA_CONFIG_CPP11_GENERATED_METHODS : The delete and default keywords=
 for compiler generated methods
++// CLARA_CONFIG_CPP11_OVERRIDE : is override supported?
++// CLARA_CONFIG_CPP11_UNIQUE_PTR : is unique_ptr supported (otherwise use=
 auto_ptr)
++
++// CLARA_CONFIG_CPP11_OR_GREATER : Is C++11 supported?
++
++// CLARA_CONFIG_VARIADIC_MACROS : are variadic macros supported?
++
++// In general each macro has a _NO_<feature name> form
++// (e.g. CLARA_CONFIG_CPP11_NO_NULLPTR) which disables the feature.
++// Many features, at point of detection, define an _INTERNAL_ macro, so t=
hey
++// can be combined, en-mass, with the _NO_ forms later.
++
++// All the C++11 features can be disabled with CLARA_CONFIG_NO_CPP11
++
++#ifdef __clang__
++
++#if __has_feature(cxx_nullptr)
++#define CLARA_INTERNAL_CONFIG_CPP11_NULLPTR
++#endif
++
++#if __has_feature(cxx_noexcept)
++#define CLARA_INTERNAL_CONFIG_CPP11_NOEXCEPT
++#endif
++
++#endif // __clang__
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// GCC
++#ifdef __GNUC__
++
++#if __GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 6 && defined(__GXX_EXPERIMEN=
TAL_CXX0X__)
++#define CLARA_INTERNAL_CONFIG_CPP11_NULLPTR
++#endif
++
++// - otherwise more recent versions define __cplusplus >=3D 201103L
++// and will get picked up below
++
++#endif // __GNUC__
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// Visual C++
++#ifdef _MSC_VER
++
++#if (_MSC_VER >=3D 1600)
++#define CLARA_INTERNAL_CONFIG_CPP11_NULLPTR
++#define CLARA_INTERNAL_CONFIG_CPP11_UNIQUE_PTR
++#endif
++
++#if (_MSC_VER >=3D 1900 ) // (VC++ 13 (VS2015))
++#define CLARA_INTERNAL_CONFIG_CPP11_NOEXCEPT
++#define CLARA_INTERNAL_CONFIG_CPP11_GENERATED_METHODS
++#endif
++
++#endif // _MSC_VER
++
++/////////////////////////////////////////////////////////////////////////=
///////
++// C++ language feature support
++
++// catch all support for C++11
++#if defined(__cplusplus) && __cplusplus >=3D 201103L
++
++#define CLARA_CPP11_OR_GREATER
++
++#if !defined(CLARA_INTERNAL_CONFIG_CPP11_NULLPTR)
++#define CLARA_INTERNAL_CONFIG_CPP11_NULLPTR
++#endif
++
++#ifndef CLARA_INTERNAL_CONFIG_CPP11_NOEXCEPT
++#define CLARA_INTERNAL_CONFIG_CPP11_NOEXCEPT
++#endif
++
++#ifndef CLARA_INTERNAL_CONFIG_CPP11_GENERATED_METHODS
++#define CLARA_INTERNAL_CONFIG_CPP11_GENERATED_METHODS
++#endif
++
++#if !defined(CLARA_INTERNAL_CONFIG_CPP11_OVERRIDE)
++#define CLARA_INTERNAL_CONFIG_CPP11_OVERRIDE
++#endif
++#if !defined(CLARA_INTERNAL_CONFIG_CPP11_UNIQUE_PTR)
++#define CLARA_INTERNAL_CONFIG_CPP11_UNIQUE_PTR
++#endif
++
++#endif // __cplusplus >=3D 201103L
++
++// Now set the actual defines based on the above + anything the user has =
configured
++#if defined(CLARA_INTERNAL_CONFIG_CPP11_NULLPTR) && !defined(CLARA_CONFIG=
_CPP11_NO_NULLPTR) && !defined(CLARA_CONFIG_CPP11_NULLPTR) && !defined(CLAR=
A_CONFIG_NO_CPP11)
++#define CLARA_CONFIG_CPP11_NULLPTR
++#endif
++#if defined(CLARA_INTERNAL_CONFIG_CPP11_NOEXCEPT) && !defined(CLARA_CONFI=
G_CPP11_NO_NOEXCEPT) && !defined(CLARA_CONFIG_CPP11_NOEXCEPT) && !defined(C=
LARA_CONFIG_NO_CPP11)
++#define CLARA_CONFIG_CPP11_NOEXCEPT
++#endif
++#if defined(CLARA_INTERNAL_CONFIG_CPP11_GENERATED_METHODS) && !defined(CL=
ARA_CONFIG_CPP11_NO_GENERATED_METHODS) && !defined(CLARA_CONFIG_CPP11_GENER=
ATED_METHODS) && !defined(CLARA_CONFIG_NO_CPP11)
++#define CLARA_CONFIG_CPP11_GENERATED_METHODS
++#endif
++#if defined(CLARA_INTERNAL_CONFIG_CPP11_OVERRIDE) && !defined(CLARA_CONFI=
G_NO_OVERRIDE) && !defined(CLARA_CONFIG_CPP11_OVERRIDE) && !defined(CLARA_C=
ONFIG_NO_CPP11)
++#define CLARA_CONFIG_CPP11_OVERRIDE
++#endif
++#if defined(CLARA_INTERNAL_CONFIG_CPP11_UNIQUE_PTR) && !defined(CLARA_CON=
FIG_NO_UNIQUE_PTR) && !defined(CLARA_CONFIG_CPP11_UNIQUE_PTR) && !defined(C=
LARA_CONFIG_NO_CPP11)
++#define CLARA_CONFIG_CPP11_UNIQUE_PTR
++#endif
++
++// noexcept support:
++#if defined(CLARA_CONFIG_CPP11_NOEXCEPT) && !defined(CLARA_NOEXCEPT)
++#define CLARA_NOEXCEPT noexcept
++#  define CLARA_NOEXCEPT_IS(x) noexcept(x)
++#else
++#define CLARA_NOEXCEPT throw()
++#  define CLARA_NOEXCEPT_IS(x)
++#endif
++
++// nullptr support
++#ifdef CLARA_CONFIG_CPP11_NULLPTR
++#define CLARA_NULL nullptr
++#else
++#define CLARA_NULL NULL
++#endif
++
++// override support
++#ifdef CLARA_CONFIG_CPP11_OVERRIDE
++#define CLARA_OVERRIDE override
++#else
++#define CLARA_OVERRIDE
++#endif
++
++// unique_ptr support
++#ifdef CLARA_CONFIG_CPP11_UNIQUE_PTR
++#   define CLARA_AUTO_PTR( T ) std::unique_ptr<T>
++#else
++#   define CLARA_AUTO_PTR( T ) std::auto_ptr<T>
++#endif
++
++#endif // TWOBLUECUBES_CLARA_COMPILERS_H_INCLUDED
++
++// ----------- end of #include from clara_compilers.h -----------
++// ........... back in clara.h
++
++#include <map>
++#include <stdexcept>
++#include <memory>
++
++#if defined(WIN32) || defined(__WIN32__) || defined(_WIN32) || defined(_M=
SC_VER)
++#define CLARA_PLATFORM_WINDOWS
++#endif
++
++// Use optional outer namespace
++#ifdef STITCH_CLARA_OPEN_NAMESPACE
++STITCH_CLARA_OPEN_NAMESPACE
++#endif
++
++namespace Clara {
++
++    struct UnpositionalTag {};
++
++    extern UnpositionalTag _;
++
++#ifdef CLARA_CONFIG_MAIN
++    UnpositionalTag _;
++#endif
++
++    namespace Detail {
++
++#ifdef CLARA_CONSOLE_WIDTH
++    const unsigned int consoleWidth =3D CLARA_CONFIG_CONSOLE_WIDTH;
++#else
++    const unsigned int consoleWidth =3D 80;
++#endif
++
++        using namespace Tbc;
++
++        inline bool startsWith( std::string const& str, std::string const=
& prefix ) {
++            return str.size() >=3D prefix.size() && str.substr( 0, prefix=
.size() ) =3D=3D prefix;
++        }
++
++        template<typename T> struct RemoveConstRef{ typedef T type; };
++        template<typename T> struct RemoveConstRef<T&>{ typedef T type; };
++        template<typename T> struct RemoveConstRef<T const&>{ typedef T t=
ype; };
++        template<typename T> struct RemoveConstRef<T const>{ typedef T ty=
pe; };
++
++        template<typename T>    struct IsBool       { static const bool v=
alue =3D false; };
++        template<>              struct IsBool<bool> { static const bool v=
alue =3D true; };
++
++        template<typename T>
++        void convertInto( std::string const& _source, T& _dest ) {
++            std::stringstream ss;
++            ss << _source;
++            ss >> _dest;
++            if( ss.fail() )
++                throw std::runtime_error( "Unable to convert " + _source =
+ " to destination type" );
++        }
++        inline void convertInto( std::string const& _source, std::string&=
 _dest ) {
++            _dest =3D _source;
++        }
++        char toLowerCh(char c) {
++            return static_cast<char>( std::tolower( c ) );
++        }
++        inline void convertInto( std::string const& _source, bool& _dest =
) {
++            std::string sourceLC =3D _source;
++            std::transform( sourceLC.begin(), sourceLC.end(), sourceLC.be=
gin(), toLowerCh );
++            if( sourceLC =3D=3D "y" || sourceLC =3D=3D "1" || sourceLC =
=3D=3D "true" || sourceLC =3D=3D "yes" || sourceLC =3D=3D "on" )
++                _dest =3D true;
++            else if( sourceLC =3D=3D "n" || sourceLC =3D=3D "0" || source=
LC =3D=3D "false" || sourceLC =3D=3D "no" || sourceLC =3D=3D "off" )
++                _dest =3D false;
++            else
++                throw std::runtime_error( "Expected a boolean value but d=
id not recognise:\n  '" + _source + "'" );
++        }
++
++        template<typename ConfigT>
++        struct IArgFunction {
++            virtual ~IArgFunction() {}
++#ifdef CLARA_CONFIG_CPP11_GENERATED_METHODS
++            IArgFunction()                      =3D default;
++            IArgFunction( IArgFunction const& ) =3D default;
++#endif
++            virtual void set( ConfigT& config, std::string const& value )=
 const =3D 0;
++            virtual bool takesArg() const =3D 0;
++            virtual IArgFunction* clone() const =3D 0;
++        };
++
++        template<typename ConfigT>
++        class BoundArgFunction {
++        public:
++            BoundArgFunction() : functionObj( CLARA_NULL ) {}
++            BoundArgFunction( IArgFunction<ConfigT>* _functionObj ) : fun=
ctionObj( _functionObj ) {}
++            BoundArgFunction( BoundArgFunction const& other ) : functionO=
bj( other.functionObj ? other.functionObj->clone() : CLARA_NULL ) {}
++            BoundArgFunction& operator =3D ( BoundArgFunction const& othe=
r ) {
++                IArgFunction<ConfigT>* newFunctionObj =3D other.functionO=
bj ? other.functionObj->clone() : CLARA_NULL;
++                delete functionObj;
++                functionObj =3D newFunctionObj;
++                return *this;
++            }
++            ~BoundArgFunction() { delete functionObj; }
++
++            void set( ConfigT& config, std::string const& value ) const {
++                functionObj->set( config, value );
++            }
++            bool takesArg() const { return functionObj->takesArg(); }
++
++            bool isSet() const {
++                return functionObj !=3D CLARA_NULL;
++            }
++        private:
++            IArgFunction<ConfigT>* functionObj;
++        };
++
++        template<typename C>
++        struct NullBinder : IArgFunction<C>{
++            virtual void set( C&, std::string const& ) const {}
++            virtual bool takesArg() const { return true; }
++            virtual IArgFunction<C>* clone() const { return new NullBinde=
r( *this ); }
++        };
++
++        template<typename C, typename M>
++        struct BoundDataMember : IArgFunction<C>{
++            BoundDataMember( M C::* _member ) : member( _member ) {}
++            virtual void set( C& p, std::string const& stringValue ) cons=
t {
++                convertInto( stringValue, p.*member );
++            }
++            virtual bool takesArg() const { return !IsBool<M>::value; }
++            virtual IArgFunction<C>* clone() const { return new BoundData=
Member( *this ); }
++            M C::* member;
++        };
++        template<typename C, typename M>
++        struct BoundUnaryMethod : IArgFunction<C>{
++            BoundUnaryMethod( void (C::*_member)( M ) ) : member( _member=
 ) {}
++            virtual void set( C& p, std::string const& stringValue ) cons=
t {
++                typename RemoveConstRef<M>::type value;
++                convertInto( stringValue, value );
++                (p.*member)( value );
++            }
++            virtual bool takesArg() const { return !IsBool<M>::value; }
++            virtual IArgFunction<C>* clone() const { return new BoundUnar=
yMethod( *this ); }
++            void (C::*member)( M );
++        };
++        template<typename C>
++        struct BoundNullaryMethod : IArgFunction<C>{
++            BoundNullaryMethod( void (C::*_member)() ) : member( _member =
) {}
++            virtual void set( C& p, std::string const& stringValue ) cons=
t {
++                bool value;
++                convertInto( stringValue, value );
++                if( value )
++                    (p.*member)();
++            }
++            virtual bool takesArg() const { return false; }
++            virtual IArgFunction<C>* clone() const { return new BoundNull=
aryMethod( *this ); }
++            void (C::*member)();
++        };
++
++        template<typename C>
++        struct BoundUnaryFunction : IArgFunction<C>{
++            BoundUnaryFunction( void (*_function)( C& ) ) : function( _fu=
nction ) {}
++            virtual void set( C& obj, std::string const& stringValue ) co=
nst {
++                bool value;
++                convertInto( stringValue, value );
++                if( value )
++                    function( obj );
++            }
++            virtual bool takesArg() const { return false; }
++            virtual IArgFunction<C>* clone() const { return new BoundUnar=
yFunction( *this ); }
++            void (*function)( C& );
++        };
++
++        template<typename C, typename T>
++        struct BoundBinaryFunction : IArgFunction<C>{
++            BoundBinaryFunction( void (*_function)( C&, T ) ) : function(=
 _function ) {}
++            virtual void set( C& obj, std::string const& stringValue ) co=
nst {
++                typename RemoveConstRef<T>::type value;
++                convertInto( stringValue, value );
++                function( obj, value );
++            }
++            virtual bool takesArg() const { return !IsBool<T>::value; }
++            virtual IArgFunction<C>* clone() const { return new BoundBina=
ryFunction( *this ); }
++            void (*function)( C&, T );
++        };
++
++    } // namespace Detail
++
++    inline std::vector<std::string> argsToVector( int argc, char const* c=
onst* const argv ) {
++        std::vector<std::string> args( static_cast<std::size_t>( argc ) );
++        for( std::size_t i =3D 0; i < static_cast<std::size_t>( argc ); +=
+i )
++            args[i] =3D argv[i];
++
++        return args;
++    }
++
++    class Parser {
++        enum Mode { None, MaybeShortOpt, SlashOpt, ShortOpt, LongOpt, Pos=
itional };
++        Mode mode;
++        std::size_t from;
++        bool inQuotes;
++    public:
++
++        struct Token {
++            enum Type { Positional, ShortOpt, LongOpt };
++            Token( Type _type, std::string const& _data ) : type( _type )=
, data( _data ) {}
++            Type type;
++            std::string data;
++        };
++
++        Parser() : mode( None ), from( 0 ), inQuotes( false ){}
++
++        void parseIntoTokens( std::vector<std::string> const& args, std::=
vector<Token>& tokens ) {
++            const std::string doubleDash =3D "--";
++            for( std::size_t i =3D 1; i < args.size() && args[i] !=3D dou=
bleDash; ++i )
++                parseIntoTokens( args[i], tokens);
++        }
++
++        void parseIntoTokens( std::string const& arg, std::vector<Token>&=
 tokens ) {
++            for( std::size_t i =3D 0; i < arg.size(); ++i ) {
++                char c =3D arg[i];
++                if( c =3D=3D '"' )
++                    inQuotes =3D !inQuotes;
++                mode =3D handleMode( i, c, arg, tokens );
++            }
++            mode =3D handleMode( arg.size(), '\0', arg, tokens );
++        }
++        Mode handleMode( std::size_t i, char c, std::string const& arg, s=
td::vector<Token>& tokens ) {
++            switch( mode ) {
++                case None: return handleNone( i, c );
++                case MaybeShortOpt: return handleMaybeShortOpt( i, c );
++                case ShortOpt:
++                case LongOpt:
++                case SlashOpt: return handleOpt( i, c, arg, tokens );
++                case Positional: return handlePositional( i, c, arg, toke=
ns );
++                default: throw std::logic_error( "Unknown mode" );
++            }
++        }
++
++        Mode handleNone( std::size_t i, char c ) {
++            if( inQuotes ) {
++                from =3D i;
++                return Positional;
++            }
++            switch( c ) {
++                case '-': return MaybeShortOpt;
++#ifdef CLARA_PLATFORM_WINDOWS
++                case '/': from =3D i+1; return SlashOpt;
++#endif
++                default: from =3D i; return Positional;
++            }
++        }
++        Mode handleMaybeShortOpt( std::size_t i, char c ) {
++            switch( c ) {
++                case '-': from =3D i+1; return LongOpt;
++                default: from =3D i; return ShortOpt;
++            }
++        }
++
++        Mode handleOpt( std::size_t i, char c, std::string const& arg, st=
d::vector<Token>& tokens ) {
++            if( std::string( ":=3D\0", 3 ).find( c ) =3D=3D std::string::=
npos )
++                return mode;
++
++            std::string optName =3D arg.substr( from, i-from );
++            if( mode =3D=3D ShortOpt )
++                for( std::size_t j =3D 0; j < optName.size(); ++j )
++                    tokens.push_back( Token( Token::ShortOpt, optName.sub=
str( j, 1 ) ) );
++            else if( mode =3D=3D SlashOpt && optName.size() =3D=3D 1 )
++                tokens.push_back( Token( Token::ShortOpt, optName ) );
++            else
++                tokens.push_back( Token( Token::LongOpt, optName ) );
++            return None;
++        }
++        Mode handlePositional( std::size_t i, char c, std::string const& =
arg, std::vector<Token>& tokens ) {
++            if( inQuotes || std::string( "\0", 1 ).find( c ) =3D=3D std::=
string::npos )
++                return mode;
++
++            std::string data =3D arg.substr( from, i-from );
++            tokens.push_back( Token( Token::Positional, data ) );
++            return None;
++        }
++    };
++
++    template<typename ConfigT>
++    struct CommonArgProperties {
++        CommonArgProperties() {}
++        CommonArgProperties( Detail::BoundArgFunction<ConfigT> const& _bo=
undField ) : boundField( _boundField ) {}
++
++        Detail::BoundArgFunction<ConfigT> boundField;
++        std::string description;
++        std::string detail;
++        std::string placeholder; // Only value if boundField takes an arg
++
++        bool takesArg() const {
++            return !placeholder.empty();
++        }
++        void validate() const {
++            if( !boundField.isSet() )
++                throw std::logic_error( "option not bound" );
++        }
++    };
++    struct OptionArgProperties {
++        std::vector<std::string> shortNames;
++        std::string longName;
++
++        bool hasShortName( std::string const& shortName ) const {
++            return std::find( shortNames.begin(), shortNames.end(), short=
Name ) !=3D shortNames.end();
++        }
++        bool hasLongName( std::string const& _longName ) const {
++            return _longName =3D=3D longName;
++        }
++    };
++    struct PositionalArgProperties {
++        PositionalArgProperties() : position( -1 ) {}
++        int position; // -1 means non-positional (floating)
++
++        bool isFixedPositional() const {
++            return position !=3D -1;
++        }
++    };
++
++    template<typename ConfigT>
++    class CommandLine {
++
++        struct Arg : CommonArgProperties<ConfigT>, OptionArgProperties, P=
ositionalArgProperties {
++            Arg() {}
++            Arg( Detail::BoundArgFunction<ConfigT> const& _boundField ) :=
 CommonArgProperties<ConfigT>( _boundField ) {}
++
++            using CommonArgProperties<ConfigT>::placeholder; // !TBD
++
++            std::string dbgName() const {
++                if( !longName.empty() )
++                    return "--" + longName;
++                if( !shortNames.empty() )
++                    return "-" + shortNames[0];
++                return "positional args";
++            }
++            std::string commands() const {
++                std::ostringstream oss;
++                bool first =3D true;
++                std::vector<std::string>::const_iterator it =3D shortName=
s.begin(), itEnd =3D shortNames.end();
++                for(; it !=3D itEnd; ++it ) {
++                    if( first )
++                        first =3D false;
++                    else
++                        oss << ", ";
++                    oss << "-" << *it;
++                }
++                if( !longName.empty() ) {
++                    if( !first )
++                        oss << ", ";
++                    oss << "--" << longName;
++                }
++                if( !placeholder.empty() )
++                    oss << " <" << placeholder << ">";
++                return oss.str();
++            }
++        };
++
++        typedef CLARA_AUTO_PTR( Arg ) ArgAutoPtr;
++
++        friend void addOptName( Arg& arg, std::string const& optName )
++        {
++            if( optName.empty() )
++                return;
++            if( Detail::startsWith( optName, "--" ) ) {
++                if( !arg.longName.empty() )
++                    throw std::logic_error( "Only one long opt may be spe=
cified. '"
++                        + arg.longName
++                        + "' already specified, now attempting to add '"
++                        + optName + "'" );
++                arg.longName =3D optName.substr( 2 );
++            }
++            else if( Detail::startsWith( optName, "-" ) )
++                arg.shortNames.push_back( optName.substr( 1 ) );
++            else
++                throw std::logic_error( "option must begin with - or --. =
Option was: '" + optName + "'" );
++        }
++        friend void setPositionalArg( Arg& arg, int position )
++        {
++            arg.position =3D position;
++        }
++
++        class ArgBuilder {
++        public:
++            ArgBuilder( Arg* arg ) : m_arg( arg ) {}
++
++            // Bind a non-boolean data member (requires placeholder strin=
g)
++            template<typename C, typename M>
++            void bind( M C::* field, std::string const& placeholder ) {
++                m_arg->boundField =3D new Detail::BoundDataMember<C,M>( f=
ield );
++                m_arg->placeholder =3D placeholder;
++            }
++            // Bind a boolean data member (no placeholder required)
++            template<typename C>
++            void bind( bool C::* field ) {
++                m_arg->boundField =3D new Detail::BoundDataMember<C,bool>=
( field );
++            }
++
++            // Bind a method taking a single, non-boolean argument (requi=
res a placeholder string)
++            template<typename C, typename M>
++            void bind( void (C::* unaryMethod)( M ), std::string const& p=
laceholder ) {
++                m_arg->boundField =3D new Detail::BoundUnaryMethod<C,M>( =
unaryMethod );
++                m_arg->placeholder =3D placeholder;
++            }
++
++            // Bind a method taking a single, boolean argument (no placeh=
older string required)
++            template<typename C>
++            void bind( void (C::* unaryMethod)( bool ) ) {
++                m_arg->boundField =3D new Detail::BoundUnaryMethod<C,bool=
>( unaryMethod );
++            }
++
++            // Bind a method that takes no arguments (will be called if o=
pt is present)
++            template<typename C>
++            void bind( void (C::* nullaryMethod)() ) {
++                m_arg->boundField =3D new Detail::BoundNullaryMethod<C>( =
nullaryMethod );
++            }
++
++            // Bind a free function taking a single argument - the object=
 to operate on (no placeholder string required)
++            template<typename C>
++            void bind( void (* unaryFunction)( C& ) ) {
++                m_arg->boundField =3D new Detail::BoundUnaryFunction<C>( =
unaryFunction );
++            }
++
++            // Bind a free function taking a single argument - the object=
 to operate on (requires a placeholder string)
++            template<typename C, typename T>
++            void bind( void (* binaryFunction)( C&, T ), std::string cons=
t& placeholder ) {
++                m_arg->boundField =3D new Detail::BoundBinaryFunction<C, =
T>( binaryFunction );
++                m_arg->placeholder =3D placeholder;
++            }
++
++            ArgBuilder& describe( std::string const& description ) {
++                m_arg->description =3D description;
++                return *this;
++            }
++            ArgBuilder& detail( std::string const& detail ) {
++                m_arg->detail =3D detail;
++                return *this;
++            }
++
++        protected:
++            Arg* m_arg;
++        };
++
++        class OptBuilder : public ArgBuilder {
++        public:
++            OptBuilder( Arg* arg ) : ArgBuilder( arg ) {}
++            OptBuilder( OptBuilder& other ) : ArgBuilder( other ) {}
++
++            OptBuilder& operator[]( std::string const& optName ) {
++                addOptName( *ArgBuilder::m_arg, optName );
++                return *this;
++            }
++        };
++
++    public:
++
++        CommandLine()
++        :   m_boundProcessName( new Detail::NullBinder<ConfigT>() ),
++            m_highestSpecifiedArgPosition( 0 ),
++            m_throwOnUnrecognisedTokens( false )
++        {}
++        CommandLine( CommandLine const& other )
++        :   m_boundProcessName( other.m_boundProcessName ),
++            m_options ( other.m_options ),
++            m_positionalArgs( other.m_positionalArgs ),
++            m_highestSpecifiedArgPosition( other.m_highestSpecifiedArgPos=
ition ),
++            m_throwOnUnrecognisedTokens( other.m_throwOnUnrecognisedToken=
s )
++        {
++            if( other.m_floatingArg.get() )
++                m_floatingArg.reset( new Arg( *other.m_floatingArg ) );
++        }
++
++        CommandLine& setThrowOnUnrecognisedTokens( bool shouldThrow =3D t=
rue ) {
++            m_throwOnUnrecognisedTokens =3D shouldThrow;
++            return *this;
++        }
++
++        OptBuilder operator[]( std::string const& optName ) {
++            m_options.push_back( Arg() );
++            addOptName( m_options.back(), optName );
++            OptBuilder builder( &m_options.back() );
++            return builder;
++        }
++
++        ArgBuilder operator[]( int position ) {
++            m_positionalArgs.insert( std::make_pair( position, Arg() ) );
++            if( position > m_highestSpecifiedArgPosition )
++                m_highestSpecifiedArgPosition =3D position;
++            setPositionalArg( m_positionalArgs[position], position );
++            ArgBuilder builder( &m_positionalArgs[position] );
++            return builder;
++        }
++
++        // Invoke this with the _ instance
++        ArgBuilder operator[]( UnpositionalTag ) {
++            if( m_floatingArg.get() )
++                throw std::logic_error( "Only one unpositional argument c=
an be added" );
++            m_floatingArg.reset( new Arg() );
++            ArgBuilder builder( m_floatingArg.get() );
++            return builder;
++        }
++
++        template<typename C, typename M>
++        void bindProcessName( M C::* field ) {
++            m_boundProcessName =3D new Detail::BoundDataMember<C,M>( fiel=
d );
++        }
++        template<typename C, typename M>
++        void bindProcessName( void (C::*_unaryMethod)( M ) ) {
++            m_boundProcessName =3D new Detail::BoundUnaryMethod<C,M>( _un=
aryMethod );
++        }
++
++        void optUsage( std::ostream& os, std::size_t indent =3D 0, std::s=
ize_t width =3D Detail::consoleWidth ) const {
++            typename std::vector<Arg>::const_iterator itBegin =3D m_optio=
ns.begin(), itEnd =3D m_options.end(), it;
++            std::size_t maxWidth =3D 0;
++            for( it =3D itBegin; it !=3D itEnd; ++it )
++                maxWidth =3D (std::max)( maxWidth, it->commands().size() =
);
++
++            for( it =3D itBegin; it !=3D itEnd; ++it ) {
++                Detail::Text usage( it->commands(), Detail::TextAttribute=
s()
++                                                        .setWidth( maxWid=
th+indent )
++                                                        .setIndent( inden=
t ) );
++                Detail::Text desc( it->description, Detail::TextAttribute=
s()
++                                                        .setWidth( width =
- maxWidth - 3 ) );
++
++                for( std::size_t i =3D 0; i < (std::max)( usage.size(), d=
esc.size() ); ++i ) {
++                    std::string usageCol =3D i < usage.size() ? usage[i] =
: "";
++                    os << usageCol;
++
++                    if( i < desc.size() && !desc[i].empty() )
++                        os  << std::string( indent + 2 + maxWidth - usage=
Col.size(), ' ' )
++                            << desc[i];
++                    os << "\n";
++                }
++            }
++        }
++        std::string optUsage() const {
++            std::ostringstream oss;
++            optUsage( oss );
++            return oss.str();
++        }
++
++        void argSynopsis( std::ostream& os ) const {
++            for( int i =3D 1; i <=3D m_highestSpecifiedArgPosition; ++i )=
 {
++                if( i > 1 )
++                    os << " ";
++                typename std::map<int, Arg>::const_iterator it =3D m_posi=
tionalArgs.find( i );
++                if( it !=3D m_positionalArgs.end() )
++                    os << "<" << it->second.placeholder << ">";
++                else if( m_floatingArg.get() )
++                    os << "<" << m_floatingArg->placeholder << ">";
++                else
++                    throw std::logic_error( "non consecutive positional a=
rguments with no floating args" );
++            }
++            // !TBD No indication of mandatory args
++            if( m_floatingArg.get() ) {
++                if( m_highestSpecifiedArgPosition > 1 )
++                    os << " ";
++                os << "[<" << m_floatingArg->placeholder << "> ...]";
++            }
++        }
++        std::string argSynopsis() const {
++            std::ostringstream oss;
++            argSynopsis( oss );
++            return oss.str();
++        }
++
++        void usage( std::ostream& os, std::string const& procName ) const=
 {
++            validate();
++            os << "usage:\n  " << procName << " ";
++            argSynopsis( os );
++            if( !m_options.empty() ) {
++                os << " [options]\n\nwhere options are: \n";
++                optUsage( os, 2 );
++            }
++            os << "\n";
++        }
++        std::string usage( std::string const& procName ) const {
++            std::ostringstream oss;
++            usage( oss, procName );
++            return oss.str();
++        }
++
++        ConfigT parse( std::vector<std::string> const& args ) const {
++            ConfigT config;
++            parseInto( args, config );
++            return config;
++        }
++
++        std::vector<Parser::Token> parseInto( std::vector<std::string> co=
nst& args, ConfigT& config ) const {
++            std::string processName =3D args.empty() ? std::string() : ar=
gs[0];
++            std::size_t lastSlash =3D processName.find_last_of( "/\\" );
++            if( lastSlash !=3D std::string::npos )
++                processName =3D processName.substr( lastSlash+1 );
++            m_boundProcessName.set( config, processName );
++            std::vector<Parser::Token> tokens;
++            Parser parser;
++            parser.parseIntoTokens( args, tokens );
++            return populate( tokens, config );
++        }
++
++        std::vector<Parser::Token> populate( std::vector<Parser::Token> c=
onst& tokens, ConfigT& config ) const {
++            validate();
++            std::vector<Parser::Token> unusedTokens =3D populateOptions( =
tokens, config );
++            unusedTokens =3D populateFixedArgs( unusedTokens, config );
++            unusedTokens =3D populateFloatingArgs( unusedTokens, config );
++            return unusedTokens;
++        }
++
++        std::vector<Parser::Token> populateOptions( std::vector<Parser::T=
oken> const& tokens, ConfigT& config ) const {
++            std::vector<Parser::Token> unusedTokens;
++            std::vector<std::string> errors;
++            for( std::size_t i =3D 0; i < tokens.size(); ++i ) {
++                Parser::Token const& token =3D tokens[i];
++                typename std::vector<Arg>::const_iterator it =3D m_option=
s.begin(), itEnd =3D m_options.end();
++                for(; it !=3D itEnd; ++it ) {
++                    Arg const& arg =3D *it;
++
++                    try {
++                        if( ( token.type =3D=3D Parser::Token::ShortOpt &=
& arg.hasShortName( token.data ) ) ||
++                            ( token.type =3D=3D Parser::Token::LongOpt &&=
 arg.hasLongName( token.data ) ) ) {
++                            if( arg.takesArg() ) {
++                                if( i =3D=3D tokens.size()-1 || tokens[i+=
1].type !=3D Parser::Token::Positional )
++                                    errors.push_back( "Expected argument =
to option: " + token.data );
++                                else
++                                    arg.boundField.set( config, tokens[++=
i].data );
++                            }
++                            else {
++                                arg.boundField.set( config, "true" );
++                            }
++                            break;
++                        }
++                    }
++                    catch( std::exception& ex ) {
++                        errors.push_back( std::string( ex.what() ) + "\n-=
 while parsing: (" + arg.commands() + ")" );
++                    }
++                }
++                if( it =3D=3D itEnd ) {
++                    if( token.type =3D=3D Parser::Token::Positional || !m=
_throwOnUnrecognisedTokens )
++                        unusedTokens.push_back( token );
++                    else if( errors.empty() && m_throwOnUnrecognisedToken=
s )
++                        errors.push_back( "unrecognised option: " + token=
.data );
++                }
++            }
++            if( !errors.empty() ) {
++                std::ostringstream oss;
++                for( std::vector<std::string>::const_iterator it =3D erro=
rs.begin(), itEnd =3D errors.end();
++                        it !=3D itEnd;
++                        ++it ) {
++                    if( it !=3D errors.begin() )
++                        oss << "\n";
++                    oss << *it;
++                }
++                throw std::runtime_error( oss.str() );
++            }
++            return unusedTokens;
++        }
++        std::vector<Parser::Token> populateFixedArgs( std::vector<Parser:=
:Token> const& tokens, ConfigT& config ) const {
++            std::vector<Parser::Token> unusedTokens;
++            int position =3D 1;
++            for( std::size_t i =3D 0; i < tokens.size(); ++i ) {
++                Parser::Token const& token =3D tokens[i];
++                typename std::map<int, Arg>::const_iterator it =3D m_posi=
tionalArgs.find( position );
++                if( it !=3D m_positionalArgs.end() )
++                    it->second.boundField.set( config, token.data );
++                else
++                    unusedTokens.push_back( token );
++                if( token.type =3D=3D Parser::Token::Positional )
++                    position++;
++            }
++            return unusedTokens;
++        }
++        std::vector<Parser::Token> populateFloatingArgs( std::vector<Pars=
er::Token> const& tokens, ConfigT& config ) const {
++            if( !m_floatingArg.get() )
++                return tokens;
++            std::vector<Parser::Token> unusedTokens;
++            for( std::size_t i =3D 0; i < tokens.size(); ++i ) {
++                Parser::Token const& token =3D tokens[i];
++                if( token.type =3D=3D Parser::Token::Positional )
++                    m_floatingArg->boundField.set( config, token.data );
++                else
++                    unusedTokens.push_back( token );
++            }
++            return unusedTokens;
++        }
++
++        void validate() const
++        {
++            if( m_options.empty() && m_positionalArgs.empty() && !m_float=
ingArg.get() )
++                throw std::logic_error( "No options or arguments specifie=
d" );
++
++            for( typename std::vector<Arg>::const_iterator  it =3D m_opti=
ons.begin(),
++                                                            itEnd =3D m_o=
ptions.end();
++                    it !=3D itEnd; ++it )
++                it->validate();
++        }
++
++    private:
++        Detail::BoundArgFunction<ConfigT> m_boundProcessName;
++        std::vector<Arg> m_options;
++        std::map<int, Arg> m_positionalArgs;
++        ArgAutoPtr m_floatingArg;
++        int m_highestSpecifiedArgPosition;
++        bool m_throwOnUnrecognisedTokens;
++    };
++
++} // end namespace Clara
++
++STITCH_CLARA_CLOSE_NAMESPACE
++#undef STITCH_CLARA_OPEN_NAMESPACE
++#undef STITCH_CLARA_CLOSE_NAMESPACE
++
++#endif // TWOBLUECUBES_CLARA_H_INCLUDED
++#undef STITCH_CLARA_OPEN_NAMESPACE
++
++// Restore Clara's value for console width, if present
++#ifdef CATCH_TEMP_CLARA_CONFIG_CONSOLE_WIDTH
++#define CLARA_CONFIG_CONSOLE_WIDTH CATCH_TEMP_CLARA_CONFIG_CONSOLE_WIDTH
++#undef CATCH_TEMP_CLARA_CONFIG_CONSOLE_WIDTH
++#endif
++
++#include <fstream>
++#include <ctime>
++
++namespace Catch {
++
++    inline void abortAfterFirst( ConfigData& config ) { config.abortAfter=
 =3D 1; }
++    inline void abortAfterX( ConfigData& config, int x ) {
++        if( x < 1 )
++            throw std::runtime_error( "Value after -x or --abortAfter mus=
t be greater than zero" );
++        config.abortAfter =3D x;
++    }
++    inline void addTestOrTags( ConfigData& config, std::string const& _te=
stSpec ) { config.testsOrTags.push_back( _testSpec ); }
++    inline void addSectionToRun( ConfigData& config, std::string const& s=
ectionName ) { config.sectionsToRun.push_back( sectionName ); }
++    inline void addReporterName( ConfigData& config, std::string const& _=
reporterName ) { config.reporterNames.push_back( _reporterName ); }
++
++    inline void addWarning( ConfigData& config, std::string const& _warni=
ng ) {
++        if( _warning =3D=3D "NoAssertions" )
++            config.warnings =3D static_cast<WarnAbout::What>( config.warn=
ings | WarnAbout::NoAssertions );
++        else
++            throw std::runtime_error( "Unrecognised warning: '" + _warnin=
g + '\'' );
++    }
++    inline void setOrder( ConfigData& config, std::string const& order ) {
++        if( startsWith( "declared", order ) )
++            config.runOrder =3D RunTests::InDeclarationOrder;
++        else if( startsWith( "lexical", order ) )
++            config.runOrder =3D RunTests::InLexicographicalOrder;
++        else if( startsWith( "random", order ) )
++            config.runOrder =3D RunTests::InRandomOrder;
++        else
++            throw std::runtime_error( "Unrecognised ordering: '" + order =
+ '\'' );
++    }
++    inline void setRngSeed( ConfigData& config, std::string const& seed )=
 {
++        if( seed =3D=3D "time" ) {
++            config.rngSeed =3D static_cast<unsigned int>( std::time(0) );
++        }
++        else {
++            std::stringstream ss;
++            ss << seed;
++            ss >> config.rngSeed;
++            if( ss.fail() )
++                throw std::runtime_error( "Argument to --rng-seed should =
be the word 'time' or a number" );
++        }
++    }
++    inline void setVerbosity( ConfigData& config, int level ) {
++        // !TBD: accept strings?
++        config.verbosity =3D static_cast<Verbosity::Level>( level );
++    }
++    inline void setShowDurations( ConfigData& config, bool _showDurations=
 ) {
++        config.showDurations =3D _showDurations
++            ? ShowDurations::Always
++            : ShowDurations::Never;
++    }
++    inline void setUseColour( ConfigData& config, std::string const& valu=
e ) {
++        std::string mode =3D toLower( value );
++
++        if( mode =3D=3D "yes" )
++            config.useColour =3D UseColour::Yes;
++        else if( mode =3D=3D "no" )
++            config.useColour =3D UseColour::No;
++        else if( mode =3D=3D "auto" )
++            config.useColour =3D UseColour::Auto;
++        else
++            throw std::runtime_error( "colour mode must be one of: auto, =
yes or no" );
++    }
++    inline void setWaitForKeypress( ConfigData& config, std::string const=
& keypress ) {
++        std::string keypressLc =3D toLower( keypress );
++        if( keypressLc =3D=3D "start" )
++            config.waitForKeypress =3D WaitForKeypress::BeforeStart;
++        else if( keypressLc =3D=3D "exit" )
++            config.waitForKeypress =3D WaitForKeypress::BeforeExit;
++        else if( keypressLc =3D=3D "both" )
++            config.waitForKeypress =3D WaitForKeypress::BeforeStartAndExi=
t;
++        else
++            throw std::runtime_error( "keypress argument must be one of: =
start, exit or both. '" + keypress + "' not recognised" );
++    };
++
++    inline void forceColour( ConfigData& config ) {
++        config.useColour =3D UseColour::Yes;
++    }
++    inline void loadTestNamesFromFile( ConfigData& config, std::string co=
nst& _filename ) {
++        std::ifstream f( _filename.c_str() );
++        if( !f.is_open() )
++            throw std::domain_error( "Unable to load input file: " + _fil=
ename );
++
++        std::string line;
++        while( std::getline( f, line ) ) {
++            line =3D trim(line);
++            if( !line.empty() && !startsWith( line, '#' ) ) {
++                if( !startsWith( line, '"' ) )
++                    line =3D '"' + line + '"';
++                addTestOrTags( config, line + ',' );
++            }
++        }
++    }
++
++    inline Clara::CommandLine<ConfigData> makeCommandLineParser() {
++
++        using namespace Clara;
++        CommandLine<ConfigData> cli;
++
++        cli.bindProcessName( &ConfigData::processName );
++
++        cli["-?"]["-h"]["--help"]
++            .describe( "display usage information" )
++            .bind( &ConfigData::showHelp );
++
++        cli["-l"]["--list-tests"]
++            .describe( "list all/matching test cases" )
++            .bind( &ConfigData::listTests );
++
++        cli["-t"]["--list-tags"]
++            .describe( "list all/matching tags" )
++            .bind( &ConfigData::listTags );
++
++        cli["-s"]["--success"]
++            .describe( "include successful tests in output" )
++            .bind( &ConfigData::showSuccessfulTests );
++
++        cli["-b"]["--break"]
++            .describe( "break into debugger on failure" )
++            .bind( &ConfigData::shouldDebugBreak );
++
++        cli["-e"]["--nothrow"]
++            .describe( "skip exception tests" )
++            .bind( &ConfigData::noThrow );
++
++        cli["-i"]["--invisibles"]
++            .describe( "show invisibles (tabs, newlines)" )
++            .bind( &ConfigData::showInvisibles );
++
++        cli["-o"]["--out"]
++            .describe( "output filename" )
++            .bind( &ConfigData::outputFilename, "filename" );
++
++        cli["-r"]["--reporter"]
++//            .placeholder( "name[:filename]" )
++            .describe( "reporter to use (defaults to console)" )
++            .bind( &addReporterName, "name" );
++
++        cli["-n"]["--name"]
++            .describe( "suite name" )
++            .bind( &ConfigData::name, "name" );
++
++        cli["-a"]["--abort"]
++            .describe( "abort at first failure" )
++            .bind( &abortAfterFirst );
++
++        cli["-x"]["--abortx"]
++            .describe( "abort after x failures" )
++            .bind( &abortAfterX, "no. failures" );
++
++        cli["-w"]["--warn"]
++            .describe( "enable warnings" )
++            .bind( &addWarning, "warning name" );
++
++// - needs updating if reinstated
++//        cli.into( &setVerbosity )
++//            .describe( "level of verbosity (0=3Dno output)" )
++//            .shortOpt( "v")
++//            .longOpt( "verbosity" )
++//            .placeholder( "level" );
++
++        cli[_]
++            .describe( "which test or tests to use" )
++            .bind( &addTestOrTags, "test name, pattern or tags" );
++
++        cli["-d"]["--durations"]
++            .describe( "show test durations" )
++            .bind( &setShowDurations, "yes|no" );
++
++        cli["-f"]["--input-file"]
++            .describe( "load test names to run from a file" )
++            .bind( &loadTestNamesFromFile, "filename" );
++
++        cli["-#"]["--filenames-as-tags"]
++            .describe( "adds a tag for the filename" )
++            .bind( &ConfigData::filenamesAsTags );
++
++        cli["-c"]["--section"]
++                .describe( "specify section to run" )
++                .bind( &addSectionToRun, "section name" );
++
++        // Less common commands which don't have a short form
++        cli["--list-test-names-only"]
++            .describe( "list all/matching test cases names only" )
++            .bind( &ConfigData::listTestNamesOnly );
++
++        cli["--list-extra-info"]
++            .describe( "list all/matching test cases with more info" )
++            .bind( &ConfigData::listExtraInfo );
++
++        cli["--list-reporters"]
++            .describe( "list all reporters" )
++            .bind( &ConfigData::listReporters );
++
++        cli["--order"]
++            .describe( "test case order (defaults to decl)" )
++            .bind( &setOrder, "decl|lex|rand" );
++
++        cli["--rng-seed"]
++            .describe( "set a specific seed for random numbers" )
++            .bind( &setRngSeed, "'time'|number" );
++
++        cli["--force-colour"]
++            .describe( "force colourised output (deprecated)" )
++            .bind( &forceColour );
++
++        cli["--use-colour"]
++            .describe( "should output be colourised" )
++            .bind( &setUseColour, "yes|no" );
++
++        cli["--libidentify"]
++            .describe( "report name and version according to libidentify =
standard" )
++            .bind( &ConfigData::libIdentify );
++
++        cli["--wait-for-keypress"]
++                .describe( "waits for a keypress before exiting" )
++                .bind( &setWaitForKeypress, "start|exit|both" );
++
++        return cli;
++    }
++
++} // end namespace Catch
++
++// #included from: internal/catch_list.hpp
++#define TWOBLUECUBES_CATCH_LIST_HPP_INCLUDED
++
++// #included from: catch_text.h
++#define TWOBLUECUBES_CATCH_TEXT_H_INCLUDED
++
++#define TBC_TEXT_FORMAT_CONSOLE_WIDTH CATCH_CONFIG_CONSOLE_WIDTH
++
++#define CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE Catch
++// #included from: ../external/tbc_text_format.h
++// Only use header guard if we are not using an outer namespace
++#ifndef CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE
++# ifdef TWOBLUECUBES_TEXT_FORMAT_H_INCLUDED
++#  ifndef TWOBLUECUBES_TEXT_FORMAT_H_ALREADY_INCLUDED
++#   define TWOBLUECUBES_TEXT_FORMAT_H_ALREADY_INCLUDED
++#  endif
++# else
++#  define TWOBLUECUBES_TEXT_FORMAT_H_INCLUDED
++# endif
++#endif
++#ifndef TWOBLUECUBES_TEXT_FORMAT_H_ALREADY_INCLUDED
++#include <string>
++#include <vector>
++#include <sstream>
++
++// Use optional outer namespace
++#ifdef CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE
++namespace CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE {
++#endif
++
++namespace Tbc {
++
++#ifdef TBC_TEXT_FORMAT_CONSOLE_WIDTH
++    const unsigned int consoleWidth =3D TBC_TEXT_FORMAT_CONSOLE_WIDTH;
++#else
++    const unsigned int consoleWidth =3D 80;
++#endif
++
++    struct TextAttributes {
++        TextAttributes()
++        :   initialIndent( std::string::npos ),
++            indent( 0 ),
++            width( consoleWidth-1 )
++        {}
++
++        TextAttributes& setInitialIndent( std::size_t _value )  { initial=
Indent =3D _value; return *this; }
++        TextAttributes& setIndent( std::size_t _value )         { indent =
=3D _value; return *this; }
++        TextAttributes& setWidth( std::size_t _value )          { width =
=3D _value; return *this; }
++
++        std::size_t initialIndent;  // indent of first line, or npos
++        std::size_t indent;         // indent of subsequent lines, or all=
 if initialIndent is npos
++        std::size_t width;          // maximum width of text, including i=
ndent. Longer text will wrap
++    };
++
++    class Text {
++    public:
++        Text( std::string const& _str, TextAttributes const& _attr =3D Te=
xtAttributes() )
++        : attr( _attr )
++        {
++            const std::string wrappableBeforeChars =3D "[({<\t";
++            const std::string wrappableAfterChars =3D "])}>-,./|\\";
++            const std::string wrappableInsteadOfChars =3D " \n\r";
++            std::string indent =3D _attr.initialIndent !=3D std::string::=
npos
++                ? std::string( _attr.initialIndent, ' ' )
++                : std::string( _attr.indent, ' ' );
++
++            typedef std::string::const_iterator iterator;
++            iterator it =3D _str.begin();
++            const iterator strEnd =3D _str.end();
++
++            while( it !=3D strEnd ) {
++
++                if( lines.size() >=3D 1000 ) {
++                    lines.push_back( "... message truncated due to excess=
ive size" );
++                    return;
++                }
++
++                std::string suffix;
++                std::size_t width =3D (std::min)( static_cast<size_t>( st=
rEnd-it ), _attr.width-static_cast<size_t>( indent.size() ) );
++                iterator itEnd =3D it+width;
++                iterator itNext =3D _str.end();
++
++                iterator itNewLine =3D std::find( it, itEnd, '\n' );
++                if( itNewLine !=3D itEnd )
++                    itEnd =3D itNewLine;
++
++                if( itEnd !=3D strEnd  ) {
++                    bool foundWrapPoint =3D false;
++                    iterator findIt =3D itEnd;
++                    do {
++                        if( wrappableAfterChars.find( *findIt ) !=3D std:=
:string::npos && findIt !=3D itEnd ) {
++                            itEnd =3D findIt+1;
++                            itNext =3D findIt+1;
++                            foundWrapPoint =3D true;
++                        }
++                        else if( findIt > it && wrappableBeforeChars.find=
( *findIt ) !=3D std::string::npos ) {
++                            itEnd =3D findIt;
++                            itNext =3D findIt;
++                            foundWrapPoint =3D true;
++                        }
++                        else if( wrappableInsteadOfChars.find( *findIt ) =
!=3D std::string::npos ) {
++                            itNext =3D findIt+1;
++                            itEnd =3D findIt;
++                            foundWrapPoint =3D true;
++                        }
++                        if( findIt =3D=3D it )
++                            break;
++                        else
++                            --findIt;
++                    }
++                    while( !foundWrapPoint );
++
++                    if( !foundWrapPoint ) {
++                        // No good wrap char, so we'll break mid word and=
 add a hyphen
++                        --itEnd;
++                        itNext =3D itEnd;
++                        suffix =3D "-";
++                    }
++                    else {
++                        while( itEnd > it && wrappableInsteadOfChars.find=
( *(itEnd-1) ) !=3D std::string::npos )
++                            --itEnd;
++                    }
++                }
++                lines.push_back( indent + std::string( it, itEnd ) + suff=
ix );
++
++                if( indent.size() !=3D _attr.indent )
++                    indent =3D std::string( _attr.indent, ' ' );
++                it =3D itNext;
++            }
++        }
++
++        typedef std::vector<std::string>::const_iterator const_iterator;
++
++        const_iterator begin() const { return lines.begin(); }
++        const_iterator end() const { return lines.end(); }
++        std::string const& last() const { return lines.back(); }
++        std::size_t size() const { return lines.size(); }
++        std::string const& operator[]( std::size_t _index ) const { retur=
n lines[_index]; }
++        std::string toString() const {
++            std::ostringstream oss;
++            oss << *this;
++            return oss.str();
++        }
++
++        inline friend std::ostream& operator << ( std::ostream& _stream, =
Text const& _text ) {
++            for( Text::const_iterator it =3D _text.begin(), itEnd =3D _te=
xt.end();
++                it !=3D itEnd; ++it ) {
++                if( it !=3D _text.begin() )
++                    _stream << "\n";
++                _stream << *it;
++            }
++            return _stream;
++        }
++
++    private:
++        std::string str;
++        TextAttributes attr;
++        std::vector<std::string> lines;
++    };
++
++} // end namespace Tbc
++
++#ifdef CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE
++} // end outer namespace
++#endif
++
++#endif // TWOBLUECUBES_TEXT_FORMAT_H_ALREADY_INCLUDED
++#undef CLICHE_TBC_TEXT_FORMAT_OUTER_NAMESPACE
++
++namespace Catch {
++    using Tbc::Text;
++    using Tbc::TextAttributes;
++}
++
++// #included from: catch_console_colour.hpp
++#define TWOBLUECUBES_CATCH_CONSOLE_COLOUR_HPP_INCLUDED
++
++namespace Catch {
++
++    struct Colour {
++        enum Code {
++            None =3D 0,
++
++            White,
++            Red,
++            Green,
++            Blue,
++            Cyan,
++            Yellow,
++            Grey,
++
++            Bright =3D 0x10,
++
++            BrightRed =3D Bright | Red,
++            BrightGreen =3D Bright | Green,
++            LightGrey =3D Bright | Grey,
++            BrightWhite =3D Bright | White,
++
++            // By intention
++            FileName =3D LightGrey,
++            Warning =3D Yellow,
++            ResultError =3D BrightRed,
++            ResultSuccess =3D BrightGreen,
++            ResultExpectedFailure =3D Warning,
++
++            Error =3D BrightRed,
++            Success =3D Green,
++
++            OriginalExpression =3D Cyan,
++            ReconstructedExpression =3D Yellow,
++
++            SecondaryText =3D LightGrey,
++            Headers =3D White
++        };
++
++        // Use constructed object for RAII guard
++        Colour( Code _colourCode );
++        Colour( Colour const& other );
++        ~Colour();
++
++        // Use static method for one-shot changes
++        static void use( Code _colourCode );
++
++    private:
++        bool m_moved;
++    };
++
++    inline std::ostream& operator << ( std::ostream& os, Colour const& ) =
{ return os; }
++
++} // end namespace Catch
++
++// #included from: catch_interfaces_reporter.h
++#define TWOBLUECUBES_CATCH_INTERFACES_REPORTER_H_INCLUDED
++
++#include <string>
++#include <ostream>
++#include <map>
++
++namespace Catch
++{
++    struct ReporterConfig {
++        explicit ReporterConfig( Ptr<IConfig const> const& _fullConfig )
++        :   m_stream( &_fullConfig->stream() ), m_fullConfig( _fullConfig=
 ) {}
++
++        ReporterConfig( Ptr<IConfig const> const& _fullConfig, std::ostre=
am& _stream )
++        :   m_stream( &_stream ), m_fullConfig( _fullConfig ) {}
++
++        std::ostream& stream() const    { return *m_stream; }
++        Ptr<IConfig const> fullConfig() const { return m_fullConfig; }
++
++    private:
++        std::ostream* m_stream;
++        Ptr<IConfig const> m_fullConfig;
++    };
++
++    struct ReporterPreferences {
++        ReporterPreferences()
++        : shouldRedirectStdOut( false )
++        {}
++
++        bool shouldRedirectStdOut;
++    };
++
++    template<typename T>
++    struct LazyStat : Option<T> {
++        LazyStat() : used( false ) {}
++        LazyStat& operator=3D( T const& _value ) {
++            Option<T>::operator=3D( _value );
++            used =3D false;
++            return *this;
++        }
++        void reset() {
++            Option<T>::reset();
++            used =3D false;
++        }
++        bool used;
++    };
++
++    struct TestRunInfo {
++        TestRunInfo( std::string const& _name ) : name( _name ) {}
++        std::string name;
++    };
++    struct GroupInfo {
++        GroupInfo(  std::string const& _name,
++                    std::size_t _groupIndex,
++                    std::size_t _groupsCount )
++        :   name( _name ),
++            groupIndex( _groupIndex ),
++            groupsCounts( _groupsCount )
++        {}
++
++        std::string name;
++        std::size_t groupIndex;
++        std::size_t groupsCounts;
++    };
++
++    struct AssertionStats {
++        AssertionStats( AssertionResult const& _assertionResult,
++                        std::vector<MessageInfo> const& _infoMessages,
++                        Totals const& _totals )
++        :   assertionResult( _assertionResult ),
++            infoMessages( _infoMessages ),
++            totals( _totals )
++        {
++            if( assertionResult.hasMessage() ) {
++                // Copy message into messages list.
++                // !TBD This should have been done earlier, somewhere
++                MessageBuilder builder( assertionResult.getTestMacroName(=
), assertionResult.getSourceInfo(), assertionResult.getResultType() );
++                builder << assertionResult.getMessage();
++                builder.m_info.message =3D builder.m_stream.str();
++
++                infoMessages.push_back( builder.m_info );
++            }
++        }
++        virtual ~AssertionStats();
++
++#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS
++        AssertionStats( AssertionStats const& )              =3D default;
++        AssertionStats( AssertionStats && )                  =3D default;
++        AssertionStats& operator =3D ( AssertionStats const& ) =3D defaul=
t;
++        AssertionStats& operator =3D ( AssertionStats && )     =3D defaul=
t;
++#  endif
++
++        AssertionResult assertionResult;
++        std::vector<MessageInfo> infoMessages;
++        Totals totals;
++    };
++
++    struct SectionStats {
++        SectionStats(   SectionInfo const& _sectionInfo,
++                        Counts const& _assertions,
++                        double _durationInSeconds,
++                        bool _missingAssertions )
++        :   sectionInfo( _sectionInfo ),
++            assertions( _assertions ),
++            durationInSeconds( _durationInSeconds ),
++            missingAssertions( _missingAssertions )
++        {}
++        virtual ~SectionStats();
++#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS
++        SectionStats( SectionStats const& )              =3D default;
++        SectionStats( SectionStats && )                  =3D default;
++        SectionStats& operator =3D ( SectionStats const& ) =3D default;
++        SectionStats& operator =3D ( SectionStats && )     =3D default;
++#  endif
++
++        SectionInfo sectionInfo;
++        Counts assertions;
++        double durationInSeconds;
++        bool missingAssertions;
++    };
++
++    struct TestCaseStats {
++        TestCaseStats(  TestCaseInfo const& _testInfo,
++                        Totals const& _totals,
++                        std::string const& _stdOut,
++                        std::string const& _stdErr,
++                        bool _aborting )
++        : testInfo( _testInfo ),
++            totals( _totals ),
++            stdOut( _stdOut ),
++            stdErr( _stdErr ),
++            aborting( _aborting )
++        {}
++        virtual ~TestCaseStats();
++
++#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS
++        TestCaseStats( TestCaseStats const& )              =3D default;
++        TestCaseStats( TestCaseStats && )                  =3D default;
++        TestCaseStats& operator =3D ( TestCaseStats const& ) =3D default;
++        TestCaseStats& operator =3D ( TestCaseStats && )     =3D default;
++#  endif
++
++        TestCaseInfo testInfo;
++        Totals totals;
++        std::string stdOut;
++        std::string stdErr;
++        bool aborting;
++    };
++
++    struct TestGroupStats {
++        TestGroupStats( GroupInfo const& _groupInfo,
++                        Totals const& _totals,
++                        bool _aborting )
++        :   groupInfo( _groupInfo ),
++            totals( _totals ),
++            aborting( _aborting )
++        {}
++        TestGroupStats( GroupInfo const& _groupInfo )
++        :   groupInfo( _groupInfo ),
++            aborting( false )
++        {}
++        virtual ~TestGroupStats();
++
++#  ifdef CATCH_CONFIG_CPP11_GENERATED_METHODS
++        TestGroupStats( TestGroupStats const& )              =3D default;
++        TestGroupStats( TestGroupStats && )                  =3D default;
++        TestGroupStats& operator =3D ( TestGroupStats const& ) =3D defaul=
t;
++        TestGroupStats& operator =3D ( TestGroupStats && )     =3D defaul=
t;
++#  endif
++
++        GroupInfo groupInfo;
++        Totals totals;
++        bool aborting;
++    };
++
++    struct TestRunStats {
++        TestRunStats(   TestRunInfo const& _runInfo,
++                        Totals const& _totals,
++                        bool _aborting )
++        :   runInfo( _runInfo ),
++            totals( _totals ),
++            aborting( _aborting )
++        {}
++        virtual ~TestRunStats();
++
++#  ifndef CATCH_CONFIG_CPP11_GENERATED_METHODS
++        TestRunStats( TestRunStats const& _other )
++        :   runInfo( _other.runInfo ),
++            totals( _other.totals ),
++            aborting( _other.aborting )
++        {}
++#  else
++        TestRunStats( TestRunStats const& )              =3D default;
++        TestRunStats( TestRunStats && )                  =3D default;
++        TestRunStats& operator =3D ( TestRunStats const& ) =3D default;
++        TestRunStats& operator =3D ( TestRunStats && )     =3D default;
++#  endif
++
++        TestRunInfo runInfo;
++        Totals totals;
++        bool aborting;
++    };
++
++    class MultipleReporters;
++
++    struct IStreamingReporter : IShared {
++        virtual ~IStreamingReporter();
++
++        // Implementing class must also provide the following static meth=
od:
++        // static std::string getDescription();
++
++        virtual ReporterPreferences getPreferences() const =3D 0;
++
++        virtual void noMatchingTestCases( std::string const& spec ) =3D 0;
++
++        virtual void testRunStarting( TestRunInfo const& testRunInfo ) =
=3D 0;
++        virtual void testGroupStarting( GroupInfo const& groupInfo ) =3D =
0;
++
++        virtual void testCaseStarting( TestCaseInfo const& testInfo ) =3D=
 0;
++        virtual void sectionStarting( SectionInfo const& sectionInfo ) =
=3D 0;
++
++        virtual void assertionStarting( AssertionInfo const& assertionInf=
o ) =3D 0;
++
++        // The return value indicates if the messages buffer should be cl=
eared:
++        virtual bool assertionEnded( AssertionStats const& assertionStats=
 ) =3D 0;
++
++        virtual void sectionEnded( SectionStats const& sectionStats ) =3D=
 0;
++        virtual void testCaseEnded( TestCaseStats const& testCaseStats ) =
=3D 0;
++        virtual void testGroupEnded( TestGroupStats const& testGroupStats=
 ) =3D 0;
++        virtual void testRunEnded( TestRunStats const& testRunStats ) =3D=
 0;
++
++        virtual void skipTest( TestCaseInfo const& testInfo ) =3D 0;
++
++        virtual MultipleReporters* tryAsMulti() { return CATCH_NULL; }
++    };
++
++    struct IReporterFactory : IShared {
++        virtual ~IReporterFactory();
++        virtual IStreamingReporter* create( ReporterConfig const& config =
) const =3D 0;
++        virtual std::string getDescription() const =3D 0;
++    };
++
++    struct IReporterRegistry {
++        typedef std::map<std::string, Ptr<IReporterFactory> > FactoryMap;
++        typedef std::vector<Ptr<IReporterFactory> > Listeners;
++
++        virtual ~IReporterRegistry();
++        virtual IStreamingReporter* create( std::string const& name, Ptr<=
IConfig const> const& config ) const =3D 0;
++        virtual FactoryMap const& getFactories() const =3D 0;
++        virtual Listeners const& getListeners() const =3D 0;
++    };
++
++    Ptr<IStreamingReporter> addReporter( Ptr<IStreamingReporter> const& e=
xistingReporter, Ptr<IStreamingReporter> const& additionalReporter );
++
++}
++
++#include <limits>
++#include <algorithm>
++
++namespace Catch {
++
++    inline std::size_t listTests( Config const& config ) {
++
++        TestSpec testSpec =3D config.testSpec();
++        if( config.testSpec().hasFilters() )
++            Catch::cout() << "Matching test cases:\n";
++        else {
++            Catch::cout() << "All available test cases:\n";
++            testSpec =3D TestSpecParser( ITagAliasRegistry::get() ).parse=
( "*" ).testSpec();
++        }
++
++        std::size_t matchedTests =3D 0;
++        TextAttributes nameAttr, descAttr, tagsAttr;
++        nameAttr.setInitialIndent( 2 ).setIndent( 4 );
++        descAttr.setIndent( 4 );
++        tagsAttr.setIndent( 6 );
++
++        std::vector<TestCase> matchedTestCases =3D filterTests( getAllTes=
tCasesSorted( config ), testSpec, config );
++        for( std::vector<TestCase>::const_iterator it =3D matchedTestCase=
s.begin(), itEnd =3D matchedTestCases.end();
++                it !=3D itEnd;
++                ++it ) {
++            matchedTests++;
++            TestCaseInfo const& testCaseInfo =3D it->getTestCaseInfo();
++            Colour::Code colour =3D testCaseInfo.isHidden()
++                ? Colour::SecondaryText
++                : Colour::None;
++            Colour colourGuard( colour );
++
++            Catch::cout() << Text( testCaseInfo.name, nameAttr ) << std::=
endl;
++            if( config.listExtraInfo() ) {
++                Catch::cout() << "    " << testCaseInfo.lineInfo << std::=
endl;
++                std::string description =3D testCaseInfo.description;
++                if( description.empty() )
++                    description =3D "(NO DESCRIPTION)";
++                Catch::cout() << Text( description, descAttr ) << std::en=
dl;
++            }
++            if( !testCaseInfo.tags.empty() )
++                Catch::cout() << Text( testCaseInfo.tagsAsString, tagsAtt=
r ) << std::endl;
++        }
++
++        if( !config.testSpec().hasFilters() )
++            Catch::cout() << pluralise( matchedTests, "test case" ) << '\=
n' << std::endl;
++        else
++            Catch::cout() << pluralise( matchedTests, "matching test case=
" ) << '\n' << std::endl;
++        return matchedTests;
++    }
++
++    inline std::size_t listTestsNamesOnly( Config const& config ) {
++        TestSpec testSpec =3D config.testSpec();
++        if( !config.testSpec().hasFilters() )
++            testSpec =3D TestSpecParser( ITagAliasRegistry::get() ).parse=
( "*" ).testSpec();
++        std::size_t matchedTests =3D 0;
++        std::vector<TestCase> matchedTestCases =3D filterTests( getAllTes=
tCasesSorted( config ), testSpec, config );
++        for( std::vector<TestCase>::const_iterator it =3D matchedTestCase=
s.begin(), itEnd =3D matchedTestCases.end();
++                it !=3D itEnd;
++                ++it ) {
++            matchedTests++;
++            TestCaseInfo const& testCaseInfo =3D it->getTestCaseInfo();
++            if( startsWith( testCaseInfo.name, '#' ) )
++               Catch::cout() << '"' << testCaseInfo.name << '"';
++            else
++               Catch::cout() << testCaseInfo.name;
++            if ( config.listExtraInfo() )
++                Catch::cout() << "\t@" << testCaseInfo.lineInfo;
++            Catch::cout() << std::endl;
++        }
++        return matchedTests;
++    }
++
++    struct TagInfo {
++        TagInfo() : count ( 0 ) {}
++        void add( std::string const& spelling ) {
++            ++count;
++            spellings.insert( spelling );
++        }
++        std::string all() const {
++            std::string out;
++            for( std::set<std::string>::const_iterator it =3D spellings.b=
egin(), itEnd =3D spellings.end();
++                        it !=3D itEnd;
++                        ++it )
++                out +=3D "[" + *it + "]";
++            return out;
++        }
++        std::set<std::string> spellings;
++        std::size_t count;
++    };
++
++    inline std::size_t listTags( Config const& config ) {
++        TestSpec testSpec =3D config.testSpec();
++        if( config.testSpec().hasFilters() )
++            Catch::cout() << "Tags for matching test cases:\n";
++        else {
++            Catch::cout() << "All available tags:\n";
++            testSpec =3D TestSpecParser( ITagAliasRegistry::get() ).parse=
( "*" ).testSpec();
++        }
++
++        std::map<std::string, TagInfo> tagCounts;
++
++        std::vector<TestCase> matchedTestCases =3D filterTests( getAllTes=
tCasesSorted( config ), testSpec, config );
++        for( std::vector<TestCase>::const_iterator it =3D matchedTestCase=
s.begin(), itEnd =3D matchedTestCases.end();
++                it !=3D itEnd;
++                ++it ) {
++            for( std::set<std::string>::const_iterator  tagIt =3D it->get=
TestCaseInfo().tags.begin(),
++                                                        tagItEnd =3D it->=
getTestCaseInfo().tags.end();
++                    tagIt !=3D tagItEnd;
++                    ++tagIt ) {
++                std::string tagName =3D *tagIt;
++                std::string lcaseTagName =3D toLower( tagName );
++                std::map<std::string, TagInfo>::iterator countIt =3D tagC=
ounts.find( lcaseTagName );
++                if( countIt =3D=3D tagCounts.end() )
++                    countIt =3D tagCounts.insert( std::make_pair( lcaseTa=
gName, TagInfo() ) ).first;
++                countIt->second.add( tagName );
++            }
++        }
++
++        for( std::map<std::string, TagInfo>::const_iterator countIt =3D t=
agCounts.begin(),
++                                                            countItEnd =
=3D tagCounts.end();
++                countIt !=3D countItEnd;
++                ++countIt ) {
++            std::ostringstream oss;
++            oss << "  " << std::setw(2) << countIt->second.count << "  ";
++            Text wrapper( countIt->second.all(), TextAttributes()
++                                                    .setInitialIndent( 0 )
++                                                    .setIndent( oss.str()=
.size() )
++                                                    .setWidth( CATCH_CONF=
IG_CONSOLE_WIDTH-10 ) );
++            Catch::cout() << oss.str() << wrapper << '\n';
++        }
++        Catch::cout() << pluralise( tagCounts.size(), "tag" ) << '\n' << =
std::endl;
++        return tagCounts.size();
++    }
++
++    inline std::size_t listReporters( Config const& /*config*/ ) {
++        Catch::cout() << "Available reporters:\n";
++        IReporterRegistry::FactoryMap const& factories =3D getRegistryHub=
().getReporterRegistry().getFactories();
++        IReporterRegistry::FactoryMap::const_iterator itBegin =3D factori=
es.begin(), itEnd =3D factories.end(), it;
++        std::size_t maxNameLen =3D 0;
++        for(it =3D itBegin; it !=3D itEnd; ++it )
++            maxNameLen =3D (std::max)( maxNameLen, it->first.size() );
++
++        for(it =3D itBegin; it !=3D itEnd; ++it ) {
++            Text wrapper( it->second->getDescription(), TextAttributes()
++                                                        .setInitialIndent=
( 0 )
++                                                        .setIndent( 7+max=
NameLen )
++                                                        .setWidth( CATCH_=
CONFIG_CONSOLE_WIDTH - maxNameLen-8 ) );
++            Catch::cout() << "  "
++                    << it->first
++                    << ':'
++                    << std::string( maxNameLen - it->first.size() + 2, ' =
' )
++                    << wrapper << '\n';
++        }
++        Catch::cout() << std::endl;
++        return factories.size();
++    }
++
++    inline Option<std::size_t> list( Config const& config ) {
++        Option<std::size_t> listedCount;
++        if( config.listTests() || ( config.listExtraInfo() && !config.lis=
tTestNamesOnly() ) )
++            listedCount =3D listedCount.valueOr(0) + listTests( config );
++        if( config.listTestNamesOnly() )
++            listedCount =3D listedCount.valueOr(0) + listTestsNamesOnly( =
config );
++        if( config.listTags() )
++            listedCount =3D listedCount.valueOr(0) + listTags( config );
++        if( config.listReporters() )
++            listedCount =3D listedCount.valueOr(0) + listReporters( confi=
g );
++        return listedCount;
++    }
++
++} // end namespace Catch
++
++// #included from: internal/catch_run_context.hpp
++#define TWOBLUECUBES_CATCH_RUNNER_IMPL_HPP_INCLUDED
++
++// #included from: catch_test_case_tracker.hpp
++#define TWOBLUECUBES_CATCH_TEST_CASE_TRACKER_HPP_INCLUDED
++
++#include <algorithm>
++#include <string>
++#include <assert.h>
++#include <vector>
++#include <stdexcept>
++
++CATCH_INTERNAL_SUPPRESS_ETD_WARNINGS
++
++namespace Catch {
++namespace TestCaseTracking {
++
++    struct NameAndLocation {
++        std::string name;
++        SourceLineInfo location;
++
++        NameAndLocation( std::string const& _name, SourceLineInfo const& =
_location )
++        :   name( _name ),
++            location( _location )
++        {}
++    };
++
++    struct ITracker : SharedImpl<> {
++        virtual ~ITracker();
++
++        // static queries
++        virtual NameAndLocation const& nameAndLocation() const =3D 0;
++
++        // dynamic queries
++        virtual bool isComplete() const =3D 0; // Successfully completed =
or failed
++        virtual bool isSuccessfullyCompleted() const =3D 0;
++        virtual bool isOpen() const =3D 0; // Started but not complete
++        virtual bool hasChildren() const =3D 0;
++
++        virtual ITracker& parent() =3D 0;
++
++        // actions
++        virtual void close() =3D 0; // Successfully complete
++        virtual void fail() =3D 0;
++        virtual void markAsNeedingAnotherRun() =3D 0;
++
++        virtual void addChild( Ptr<ITracker> const& child ) =3D 0;
++        virtual ITracker* findChild( NameAndLocation const& nameAndLocati=
on ) =3D 0;
++        virtual void openChild() =3D 0;
++
++        // Debug/ checking
++        virtual bool isSectionTracker() const =3D 0;
++        virtual bool isIndexTracker() const =3D 0;
++    };
++
++    class  TrackerContext {
++
++        enum RunState {
++            NotStarted,
++            Executing,
++            CompletedCycle
++        };
++
++        Ptr<ITracker> m_rootTracker;
++        ITracker* m_currentTracker;
++        RunState m_runState;
++
++    public:
++
++        static TrackerContext& instance() {
++            static TrackerContext s_instance;
++            return s_instance;
++        }
++
++        TrackerContext()
++        :   m_currentTracker( CATCH_NULL ),
++            m_runState( NotStarted )
++        {}
++
++        ITracker& startRun();
++
++        void endRun() {
++            m_rootTracker.reset();
++            m_currentTracker =3D CATCH_NULL;
++            m_runState =3D NotStarted;
++        }
++
++        void startCycle() {
++            m_currentTracker =3D m_rootTracker.get();
++            m_runState =3D Executing;
++        }
++        void completeCycle() {
++            m_runState =3D CompletedCycle;
++        }
++
++        bool completedCycle() const {
++            return m_runState =3D=3D CompletedCycle;
++        }
++        ITracker& currentTracker() {
++            return *m_currentTracker;
++        }
++        void setCurrentTracker( ITracker* tracker ) {
++            m_currentTracker =3D tracker;
++        }
++    };
++
++    class TrackerBase : public ITracker {
++    protected:
++        enum CycleState {
++            NotStarted,
++            Executing,
++            ExecutingChildren,
++            NeedsAnotherRun,
++            CompletedSuccessfully,
++            Failed
++        };
++        class TrackerHasName {
++            NameAndLocation m_nameAndLocation;
++        public:
++            TrackerHasName( NameAndLocation const& nameAndLocation ) : m_=
nameAndLocation( nameAndLocation ) {}
++            bool operator ()( Ptr<ITracker> const& tracker ) {
++                return
++                    tracker->nameAndLocation().name =3D=3D m_nameAndLocat=
ion.name &&
++                    tracker->nameAndLocation().location =3D=3D m_nameAndL=
ocation.location;
++            }
++        };
++        typedef std::vector<Ptr<ITracker> > Children;
++        NameAndLocation m_nameAndLocation;
++        TrackerContext& m_ctx;
++        ITracker* m_parent;
++        Children m_children;
++        CycleState m_runState;
++    public:
++        TrackerBase( NameAndLocation const& nameAndLocation, TrackerConte=
xt& ctx, ITracker* parent )
++        :   m_nameAndLocation( nameAndLocation ),
++            m_ctx( ctx ),
++            m_parent( parent ),
++            m_runState( NotStarted )
++        {}
++        virtual ~TrackerBase();
++
++        virtual NameAndLocation const& nameAndLocation() const CATCH_OVER=
RIDE {
++            return m_nameAndLocation;
++        }
++        virtual bool isComplete() const CATCH_OVERRIDE {
++            return m_runState =3D=3D CompletedSuccessfully || m_runState =
=3D=3D Failed;
++        }
++        virtual bool isSuccessfullyCompleted() const CATCH_OVERRIDE {
++            return m_runState =3D=3D CompletedSuccessfully;
++        }
++        virtual bool isOpen() const CATCH_OVERRIDE {
++            return m_runState !=3D NotStarted && !isComplete();
++        }
++        virtual bool hasChildren() const CATCH_OVERRIDE {
++            return !m_children.empty();
++        }
++
++        virtual void addChild( Ptr<ITracker> const& child ) CATCH_OVERRID=
E {
++            m_children.push_back( child );
++        }
++
++        virtual ITracker* findChild( NameAndLocation const& nameAndLocati=
on ) CATCH_OVERRIDE {
++            Children::const_iterator it =3D std::find_if( m_children.begi=
n(), m_children.end(), TrackerHasName( nameAndLocation ) );
++            return( it !=3D m_children.end() )
++                ? it->get()
++                : CATCH_NULL;
++        }
++        virtual ITracker& parent() CATCH_OVERRIDE {
++            assert( m_parent ); // Should always be non-null except for r=
oot
++            return *m_parent;
++        }
++
++        virtual void openChild() CATCH_OVERRIDE {
++            if( m_runState !=3D ExecutingChildren ) {
++                m_runState =3D ExecutingChildren;
++                if( m_parent )
++                    m_parent->openChild();
++            }
++        }
++
++        virtual bool isSectionTracker() const CATCH_OVERRIDE { return fal=
se; }
++        virtual bool isIndexTracker() const CATCH_OVERRIDE { return false=
; }
++
++        void open() {
++            m_runState =3D Executing;
++            moveToThis();
++            if( m_parent )
++                m_parent->openChild();
++        }
++
++        virtual void close() CATCH_OVERRIDE {
++
++            // Close any still open children (e.g. generators)
++            while( &m_ctx.currentTracker() !=3D this )
++                m_ctx.currentTracker().close();
++
++            switch( m_runState ) {
++                case NotStarted:
++                case CompletedSuccessfully:
++                case Failed:
++                    throw std::logic_error( "Illogical state" );
++
++                case NeedsAnotherRun:
++                    break;;
++
++                case Executing:
++                    m_runState =3D CompletedSuccessfully;
++                    break;
++                case ExecutingChildren:
++                    if( m_children.empty() || m_children.back()->isComple=
te() )
++                        m_runState =3D CompletedSuccessfully;
++                    break;
++
++                default:
++                    throw std::logic_error( "Unexpected state" );
++            }
++            moveToParent();
++            m_ctx.completeCycle();
++        }
++        virtual void fail() CATCH_OVERRIDE {
++            m_runState =3D Failed;
++            if( m_parent )
++                m_parent->markAsNeedingAnotherRun();
++            moveToParent();
++            m_ctx.completeCycle();
++        }
++        virtual void markAsNeedingAnotherRun() CATCH_OVERRIDE {
++            m_runState =3D NeedsAnotherRun;
++        }
++    private:
++        void moveToParent() {
++            assert( m_parent );
++            m_ctx.setCurrentTracker( m_parent );
++        }
++        void moveToThis() {
++            m_ctx.setCurrentTracker( this );
++        }
++    };
++
++    class SectionTracker : public TrackerBase {
++        std::vector<std::string> m_filters;
++    public:
++        SectionTracker( NameAndLocation const& nameAndLocation, TrackerCo=
ntext& ctx, ITracker* parent )
++        :   TrackerBase( nameAndLocation, ctx, parent )
++        {
++            if( parent ) {
++                while( !parent->isSectionTracker() )
++                    parent =3D &parent->parent();
++
++                SectionTracker& parentSection =3D static_cast<SectionTrac=
ker&>( *parent );
++                addNextFilters( parentSection.m_filters );
++            }
++        }
++        virtual ~SectionTracker();
++
++        virtual bool isSectionTracker() const CATCH_OVERRIDE { return tru=
e; }
++
++        static SectionTracker& acquire( TrackerContext& ctx, NameAndLocat=
ion const& nameAndLocation ) {
++            SectionTracker* section =3D CATCH_NULL;
++
++            ITracker& currentTracker =3D ctx.currentTracker();
++            if( ITracker* childTracker =3D currentTracker.findChild( name=
AndLocation ) ) {
++                assert( childTracker );
++                assert( childTracker->isSectionTracker() );
++                section =3D static_cast<SectionTracker*>( childTracker );
++            }
++            else {
++                section =3D new SectionTracker( nameAndLocation, ctx, &cu=
rrentTracker );
++                currentTracker.addChild( section );
++            }
++            if( !ctx.completedCycle() )
++                section->tryOpen();
++            return *section;
++        }
++
++        void tryOpen() {
++            if( !isComplete() && (m_filters.empty() || m_filters[0].empty=
() ||  m_filters[0] =3D=3D m_nameAndLocation.name ) )
++                open();
++        }
++
++        void addInitialFilters( std::vector<std::string> const& filters )=
 {
++            if( !filters.empty() ) {
++                m_filters.push_back(""); // Root - should never be consul=
ted
++                m_filters.push_back(""); // Test Case - not a section fil=
ter
++                m_filters.insert( m_filters.end(), filters.begin(), filte=
rs.end() );
++            }
++        }
++        void addNextFilters( std::vector<std::string> const& filters ) {
++            if( filters.size() > 1 )
++                m_filters.insert( m_filters.end(), ++filters.begin(), fil=
ters.end() );
++        }
++    };
++
++    class IndexTracker : public TrackerBase {
++        int m_size;
++        int m_index;
++    public:
++        IndexTracker( NameAndLocation const& nameAndLocation, TrackerCont=
ext& ctx, ITracker* parent, int size )
++        :   TrackerBase( nameAndLocation, ctx, parent ),
++            m_size( size ),
++            m_index( -1 )
++        {}
++        virtual ~IndexTracker();
++
++        virtual bool isIndexTracker() const CATCH_OVERRIDE { return true;=
 }
++
++        static IndexTracker& acquire( TrackerContext& ctx, NameAndLocatio=
n const& nameAndLocation, int size ) {
++            IndexTracker* tracker =3D CATCH_NULL;
++
++            ITracker& currentTracker =3D ctx.currentTracker();
++            if( ITracker* childTracker =3D currentTracker.findChild( name=
AndLocation ) ) {
++                assert( childTracker );
++                assert( childTracker->isIndexTracker() );
++                tracker =3D static_cast<IndexTracker*>( childTracker );
++            }
++            else {
++                tracker =3D new IndexTracker( nameAndLocation, ctx, &curr=
entTracker, size );
++                currentTracker.addChild( tracker );
++            }
++
++            if( !ctx.completedCycle() && !tracker->isComplete() ) {
++                if( tracker->m_runState !=3D ExecutingChildren && tracker=
->m_runState !=3D NeedsAnotherRun )
++                    tracker->moveNext();
++                tracker->open();
++            }
++
++            return *tracker;
++        }
++
++        int index() const { return m_index; }
++
++        void moveNext() {
++            m_index++;
++            m_children.clear();
++        }
++
++        virtual void close() CATCH_OVERRIDE {
++            TrackerBase::close();
++            if( m_runState =3D=3D CompletedSuccessfully && m_index < m_si=
ze-1 )
++                m_runState =3D Executing;
++        }
++    };
++
++    inline ITracker& TrackerContext::startRun() {
++        m_rootTracker =3D new SectionTracker( NameAndLocation( "{root}", =
CATCH_INTERNAL_LINEINFO ), *this, CATCH_NULL );
++        m_currentTracker =3D CATCH_NULL;
++        m_runState =3D Executing;
++        return *m_rootTracker;
++    }
++
++} // namespace TestCaseTracking
++
++using TestCaseTracking::ITracker;
++using TestCaseTracking::TrackerContext;
++using TestCaseTracking::SectionTracker;
++using TestCaseTracking::IndexTracker;
++
++} // namespace Catch
++
++CATCH_INTERNAL_UNSUPPRESS_ETD_WARNINGS
++
++// #included from: catch_fatal_condition.hpp
++#define TWOBLUECUBES_CATCH_FATAL_CONDITION_H_INCLUDED
++
++namespace Catch {
++
++    // Report the error condition
++    inline void reportFatal( std::string const& message ) {
++        IContext& context =3D Catch::getCurrentContext();
++        IResultCapture* resultCapture =3D context.getResultCapture();
++        resultCapture->handleFatalErrorCondition( message );
++    }
++
++} // namespace Catch
++
++#if defined ( CATCH_PLATFORM_WINDOWS ) //////////////////////////////////=
///////
++// #included from: catch_windows_h_proxy.h
++
++#define TWOBLUECUBES_CATCH_WINDOWS_H_PROXY_H_INCLUDED
++
++#ifdef CATCH_DEFINES_NOMINMAX
++#  define NOMINMAX
++#endif
++#ifdef CATCH_DEFINES_WIN32_LEAN_AND_MEAN
++#  define WIN32_LEAN_AND_MEAN
++#endif
++
++#ifdef __AFXDLL
++#include <AfxWin.h>
++#else
++#include <windows.h>
++#endif
++
++#ifdef CATCH_DEFINES_NOMINMAX
++#  undef NOMINMAX
++#endif
++#ifdef CATCH_DEFINES_WIN32_LEAN_AND_MEAN
++#  undef WIN32_LEAN_AND_MEAN
++#endif
++
++
++#  if !defined ( CATCH_CONFIG_WINDOWS_SEH )
++
++namespace Catch {
++    struct FatalConditionHandler {
++        void reset() {}
++    };
++}
++
++#  else // CATCH_CONFIG_WINDOWS_SEH is defined
++
++namespace Catch {
++
++    struct SignalDefs { DWORD id; const char* name; };
++    extern SignalDefs signalDefs[];
++    // There is no 1-1 mapping between signals and windows exceptions.
++    // Windows can easily distinguish between SO and SigSegV,
++    // but SigInt, SigTerm, etc are handled differently.
++    SignalDefs signalDefs[] =3D {
++        { EXCEPTION_ILLEGAL_INSTRUCTION,  "SIGILL - Illegal instruction s=
ignal" },
++        { EXCEPTION_STACK_OVERFLOW, "SIGSEGV - Stack overflow" },
++        { EXCEPTION_ACCESS_VIOLATION, "SIGSEGV - Segmentation violation s=
ignal" },
++        { EXCEPTION_INT_DIVIDE_BY_ZERO, "Divide by zero error" },
++    };
++
++    struct FatalConditionHandler {
++
++        static LONG CALLBACK handleVectoredException(PEXCEPTION_POINTERS =
ExceptionInfo) {
++            for (int i =3D 0; i < sizeof(signalDefs) / sizeof(SignalDefs)=
; ++i) {
++                if (ExceptionInfo->ExceptionRecord->ExceptionCode =3D=3D =
signalDefs[i].id) {
++                    reportFatal(signalDefs[i].name);
++                }
++            }
++            // If its not an exception we care about, pass it along.
++            // This stops us from eating debugger breaks etc.
++            return EXCEPTION_CONTINUE_SEARCH;
++        }
++
++        FatalConditionHandler() {
++            isSet =3D true;
++            // 32k seems enough for Catch to handle stack overflow,
++            // but the value was found experimentally, so there is no str=
ong guarantee
++            guaranteeSize =3D 32 * 1024;
++            exceptionHandlerHandle =3D CATCH_NULL;
++            // Register as first handler in current chain
++            exceptionHandlerHandle =3D AddVectoredExceptionHandler(1, han=
dleVectoredException);
++            // Pass in guarantee size to be filled
++            SetThreadStackGuarantee(&guaranteeSize);
++        }
++
++        static void reset() {
++            if (isSet) {
++                // Unregister handler and restore the old guarantee
++                RemoveVectoredExceptionHandler(exceptionHandlerHandle);
++                SetThreadStackGuarantee(&guaranteeSize);
++                exceptionHandlerHandle =3D CATCH_NULL;
++                isSet =3D false;
++            }
++        }
++
++        ~FatalConditionHandler() {
++            reset();
++        }
++    private:
++        static bool isSet;
++        static ULONG guaranteeSize;
++        static PVOID exceptionHandlerHandle;
++    };
++
++    bool FatalConditionHandler::isSet =3D false;
++    ULONG FatalConditionHandler::guaranteeSize =3D 0;
++    PVOID FatalConditionHandler::exceptionHandlerHandle =3D CATCH_NULL;
++
++} // namespace Catch
++
++#  endif // CATCH_CONFIG_WINDOWS_SEH
++
++#else // Not Windows - assumed to be POSIX compatible ///////////////////=
///////
++
++#  if !defined(CATCH_CONFIG_POSIX_SIGNALS)
++
++namespace Catch {
++    struct FatalConditionHandler {
++        void reset() {}
++    };
++}
++
++#  else // CATCH_CONFIG_POSIX_SIGNALS is defined
++
++#include <signal.h>
++
++namespace Catch {
++
++    struct SignalDefs {
++        int id;
++        const char* name;
++    };
++    extern SignalDefs signalDefs[];
++    SignalDefs signalDefs[] =3D {
++            { SIGINT,  "SIGINT - Terminal interrupt signal" },
++            { SIGILL,  "SIGILL - Illegal instruction signal" },
++            { SIGFPE,  "SIGFPE - Floating point error signal" },
++            { SIGSEGV, "SIGSEGV - Segmentation violation signal" },
++            { SIGTERM, "SIGTERM - Termination request signal" },
++            { SIGABRT, "SIGABRT - Abort (abnormal termination) signal" }
++    };
++
++    struct FatalConditionHandler {
++
++        static bool isSet;
++        static struct sigaction oldSigActions [sizeof(signalDefs)/sizeof(=
SignalDefs)];
++        static stack_t oldSigStack;
++        static char altStackMem[SIGSTKSZ];
++
++        static void handleSignal( int sig ) {
++            std::string name =3D "<unknown signal>";
++            for (std::size_t i =3D 0; i < sizeof(signalDefs) / sizeof(Sig=
nalDefs); ++i) {
++                SignalDefs &def =3D signalDefs[i];
++                if (sig =3D=3D def.id) {
++                    name =3D def.name;
++                    break;
++                }
++            }
++            reset();
++            reportFatal(name);
++            raise( sig );
++        }
++
++        FatalConditionHandler() {
++            isSet =3D true;
++            stack_t sigStack;
++            sigStack.ss_sp =3D altStackMem;
++            sigStack.ss_size =3D SIGSTKSZ;
++            sigStack.ss_flags =3D 0;
++            sigaltstack(&sigStack, &oldSigStack);
++            struct sigaction sa =3D { 0 };
++
++            sa.sa_handler =3D handleSignal;
++            sa.sa_flags =3D SA_ONSTACK;
++            for (std::size_t i =3D 0; i < sizeof(signalDefs)/sizeof(Signa=
lDefs); ++i) {
++                sigaction(signalDefs[i].id, &sa, &oldSigActions[i]);
++            }
++        }
++
++        ~FatalConditionHandler() {
++            reset();
++        }
++        static void reset() {
++            if( isSet ) {
++                // Set signals back to previous values -- hopefully nobod=
y overwrote them in the meantime
++                for( std::size_t i =3D 0; i < sizeof(signalDefs)/sizeof(S=
ignalDefs); ++i ) {
++                    sigaction(signalDefs[i].id, &oldSigActions[i], CATCH_=
NULL);
++                }
++                // Return the old stack
++                sigaltstack(&oldSigStack, CATCH_NULL);
++                isSet =3D false;
++            }
++        }
++    };
++
++    bool FatalConditionHandler::isSet =3D false;
++    struct sigaction FatalConditionHandler::oldSigActions[sizeof(signalDe=
fs)/sizeof(SignalDefs)] =3D {};
++    stack_t FatalConditionHandler::oldSigStack =3D {};
++    char FatalConditionHandler::altStackMem[SIGSTKSZ] =3D {};
++
++} // namespace Catch
++
++#  endif // CATCH_CONFIG_POSIX_SIGNALS
++
++#endif // not Windows
++
++#include <cassert>
++#include <set>
++#include <string>
++
++namespace Catch {
++
++    class StreamRedirect {
++
++    public:
++        StreamRedirect( std::ostream& stream, std::string& targetString )
++        :   m_stream( stream ),
++            m_prevBuf( stream.rdbuf() ),
++            m_targetString( targetString )
++        {
++            stream.rdbuf( m_oss.rdbuf() );
++        }
++
++        ~StreamRedirect() {
++            m_targetString +=3D m_oss.str();
++            m_stream.rdbuf( m_prevBuf );
++        }
++
++    private:
++        std::ostream& m_stream;
++        std::streambuf* m_prevBuf;
++        std::ostringstream m_oss;
++        std::string& m_targetString;
++    };
++
++    // StdErr has two constituent streams in C++, std::cerr and std::clog
++    // This means that we need to redirect 2 streams into 1 to keep proper
++    // order of writes and cannot use StreamRedirect on its own
++    class StdErrRedirect {
++    public:
++        StdErrRedirect(std::string& targetString)
++        :m_cerrBuf( cerr().rdbuf() ), m_clogBuf(clog().rdbuf()),
++        m_targetString(targetString){
++            cerr().rdbuf(m_oss.rdbuf());
++            clog().rdbuf(m_oss.rdbuf());
++        }
++        ~StdErrRedirect() {
++            m_targetString +=3D m_oss.str();
++            cerr().rdbuf(m_cerrBuf);
++            clog().rdbuf(m_clogBuf);
++        }
++    private:
++        std::streambuf* m_cerrBuf;
++        std::streambuf* m_clogBuf;
++        std::ostringstream m_oss;
++        std::string& m_targetString;
++    };
++
++    /////////////////////////////////////////////////////////////////////=
//////
++
++    class RunContext : public IResultCapture, public IRunner {
++
++        RunContext( RunContext const& );
++        void operator =3D( RunContext const& );
++
++    public:
++
++        explicit RunContext( Ptr<IConfig const> const& _config, Ptr<IStre=
amingReporter> const& reporter )
++        :   m_runInfo( _config->name() ),
++            m_context( getCurrentMutableContext() ),
++            m_activeTestCase( CATCH_NULL ),
++            m_config( _config ),
++            m_reporter( reporter ),
++            m_shouldReportUnexpected ( true )
++        {
++            m_context.setRunner( this );
++            m_context.setConfig( m_config );
++            m_context.setResultCapture( this );
++            m_reporter->testRunStarting( m_runInfo );
++        }
++
++        virtual ~RunContext() {
++            m_reporter->testRunEnded( TestRunStats( m_runInfo, m_totals, =
aborting() ) );
++        }
++
++        void testGroupStarting( std::string const& testSpec, std::size_t =
groupIndex, std::size_t groupsCount ) {
++            m_reporter->testGroupStarting( GroupInfo( testSpec, groupInde=
x, groupsCount ) );
++        }
++        void testGroupEnded( std::string const& testSpec, Totals const& t=
otals, std::size_t groupIndex, std::size_t groupsCount ) {
++            m_reporter->testGroupEnded( TestGroupStats( GroupInfo( testSp=
ec, groupIndex, groupsCount ), totals, aborting() ) );
++        }
++
++        Totals runTest( TestCase const& testCase ) {
++            Totals prevTotals =3D m_totals;
++
++            std::string redirectedCout;
++            std::string redirectedCerr;
++
++            TestCaseInfo testInfo =3D testCase.getTestCaseInfo();
++
++            m_reporter->testCaseStarting( testInfo );
++
++            m_activeTestCase =3D &testCase;
++
++            do {
++                ITracker& rootTracker =3D m_trackerContext.startRun();
++                assert( rootTracker.isSectionTracker() );
++                static_cast<SectionTracker&>( rootTracker ).addInitialFil=
ters( m_config->getSectionsToRun() );
++                do {
++                    m_trackerContext.startCycle();
++                    m_testCaseTracker =3D &SectionTracker::acquire( m_tra=
ckerContext, TestCaseTracking::NameAndLocation( testInfo.name, testInfo.lin=
eInfo ) );
++                    runCurrentTest( redirectedCout, redirectedCerr );
++                }
++                while( !m_testCaseTracker->isSuccessfullyCompleted() && !=
aborting() );
++            }
++            // !TBD: deprecated - this will be replaced by indexed tracke=
rs
++            while( getCurrentContext().advanceGeneratorsForCurrentTest() =
&& !aborting() );
++
++            Totals deltaTotals =3D m_totals.delta( prevTotals );
++            if( testInfo.expectedToFail() && deltaTotals.testCases.passed=
 > 0 ) {
++                deltaTotals.assertions.failed++;
++                deltaTotals.testCases.passed--;
++                deltaTotals.testCases.failed++;
++            }
++            m_totals.testCases +=3D deltaTotals.testCases;
++            m_reporter->testCaseEnded( TestCaseStats(   testInfo,
++                                                        deltaTotals,
++                                                        redirectedCout,
++                                                        redirectedCerr,
++                                                        aborting() ) );
++
++            m_activeTestCase =3D CATCH_NULL;
++            m_testCaseTracker =3D CATCH_NULL;
++
++            return deltaTotals;
++        }
++
++        Ptr<IConfig const> config() const {
++            return m_config;
++        }
++
++    private: // IResultCapture
++
++        virtual void assertionEnded( AssertionResult const& result ) {
++            if( result.getResultType() =3D=3D ResultWas::Ok ) {
++                m_totals.assertions.passed++;
++            }
++            else if( !result.isOk() ) {
++                if( m_activeTestCase->getTestCaseInfo().okToFail() )
++                    m_totals.assertions.failedButOk++;
++                else
++                    m_totals.assertions.failed++;
++            }
++
++            // We have no use for the return value (whether messages shou=
ld be cleared), because messages were made scoped
++            // and should be let to clear themselves out.
++            static_cast<void>(m_reporter->assertionEnded(AssertionStats(r=
esult, m_messages, m_totals)));
++
++            // Reset working state
++            m_lastAssertionInfo =3D AssertionInfo( "", m_lastAssertionInf=
o.lineInfo, "{Unknown expression after the reported line}" , m_lastAssertio=
nInfo.resultDisposition );
++            m_lastResult =3D result;
++        }
++
++        virtual bool lastAssertionPassed()
++        {
++            return m_totals.assertions.passed =3D=3D (m_prevPassed + 1);
++        }
++
++        virtual void assertionPassed()
++        {
++            m_totals.assertions.passed++;
++            m_lastAssertionInfo.capturedExpression =3D "{Unknown expressi=
on after the reported line}";
++            m_lastAssertionInfo.macroName =3D "";
++        }
++
++        virtual void assertionRun()
++        {
++            m_prevPassed =3D m_totals.assertions.passed;
++        }
++
++        virtual bool sectionStarted (
++            SectionInfo const& sectionInfo,
++            Counts& assertions
++        )
++        {
++            ITracker& sectionTracker =3D SectionTracker::acquire( m_track=
erContext, TestCaseTracking::NameAndLocation( sectionInfo.name, sectionInfo=
.lineInfo ) );
++            if( !sectionTracker.isOpen() )
++                return false;
++            m_activeSections.push_back( &sectionTracker );
++
++            m_lastAssertionInfo.lineInfo =3D sectionInfo.lineInfo;
++
++            m_reporter->sectionStarting( sectionInfo );
++
++            assertions =3D m_totals.assertions;
++
++            return true;
++        }
++        bool testForMissingAssertions( Counts& assertions ) {
++            if( assertions.total() !=3D 0 )
++                return false;
++            if( !m_config->warnAboutMissingAssertions() )
++                return false;
++            if( m_trackerContext.currentTracker().hasChildren() )
++                return false;
++            m_totals.assertions.failed++;
++            assertions.failed++;
++            return true;
++        }
++
++        virtual void sectionEnded( SectionEndInfo const& endInfo ) {
++            Counts assertions =3D m_totals.assertions - endInfo.prevAsser=
tions;
++            bool missingAssertions =3D testForMissingAssertions( assertio=
ns );
++
++            if( !m_activeSections.empty() ) {
++                m_activeSections.back()->close();
++                m_activeSections.pop_back();
++            }
++
++            m_reporter->sectionEnded( SectionStats( endInfo.sectionInfo, =
assertions, endInfo.durationInSeconds, missingAssertions ) );
++            m_messages.clear();
++        }
++
++        virtual void sectionEndedEarly( SectionEndInfo const& endInfo ) {
++            if( m_unfinishedSections.empty() )
++                m_activeSections.back()->fail();
++            else
++                m_activeSections.back()->close();
++            m_activeSections.pop_back();
++
++            m_unfinishedSections.push_back( endInfo );
++        }
++
++        virtual void pushScopedMessage( MessageInfo const& message ) {
++            m_messages.push_back( message );
++        }
++
++        virtual void popScopedMessage( MessageInfo const& message ) {
++            m_messages.erase( std::remove( m_messages.begin(), m_messages=
.end(), message ), m_messages.end() );
++        }
++
++        virtual std::string getCurrentTestName() const {
++            return m_activeTestCase
++                ? m_activeTestCase->getTestCaseInfo().name
++                : std::string();
++        }
++
++        virtual const AssertionResult* getLastResult() const {
++            return &m_lastResult;
++        }
++
++        virtual void exceptionEarlyReported() {
++            m_shouldReportUnexpected =3D false;
++        }
++
++        virtual void handleFatalErrorCondition( std::string const& messag=
e ) {
++            // Don't rebuild the result -- the stringification itself can=
 cause more fatal errors
++            // Instead, fake a result data.
++            AssertionResultData tempResult;
++            tempResult.resultType =3D ResultWas::FatalErrorCondition;
++            tempResult.message =3D message;
++            AssertionResult result(m_lastAssertionInfo, tempResult);
++
++            getResultCapture().assertionEnded(result);
++
++            handleUnfinishedSections();
++
++            // Recreate section for test case (as we will lose the one th=
at was in scope)
++            TestCaseInfo const& testCaseInfo =3D m_activeTestCase->getTes=
tCaseInfo();
++            SectionInfo testCaseSection( testCaseInfo.lineInfo, testCaseI=
nfo.name, testCaseInfo.description );
++
++            Counts assertions;
++            assertions.failed =3D 1;
++            SectionStats testCaseSectionStats( testCaseSection, assertion=
s, 0, false );
++            m_reporter->sectionEnded( testCaseSectionStats );
++
++            TestCaseInfo testInfo =3D m_activeTestCase->getTestCaseInfo();
++
++            Totals deltaTotals;
++            deltaTotals.testCases.failed =3D 1;
++            deltaTotals.assertions.failed =3D 1;
++            m_reporter->testCaseEnded( TestCaseStats(   testInfo,
++                                                        deltaTotals,
++                                                        std::string(),
++                                                        std::string(),
++                                                        false ) );
++            m_totals.testCases.failed++;
++            testGroupEnded( std::string(), m_totals, 1, 1 );
++            m_reporter->testRunEnded( TestRunStats( m_runInfo, m_totals, =
false ) );
++        }
++
++    public:
++        // !TBD We need to do this another way!
++        bool aborting() const {
++            return m_totals.assertions.failed =3D=3D static_cast<std::siz=
e_t>( m_config->abortAfter() );
++        }
++
++    private:
++
++        void runCurrentTest( std::string& redirectedCout, std::string& re=
directedCerr ) {
++            TestCaseInfo const& testCaseInfo =3D m_activeTestCase->getTes=
tCaseInfo();
++            SectionInfo testCaseSection( testCaseInfo.lineInfo, testCaseI=
nfo.name, testCaseInfo.description );
++            m_reporter->sectionStarting( testCaseSection );
++            Counts prevAssertions =3D m_totals.assertions;
++            double duration =3D 0;
++            m_shouldReportUnexpected =3D true;
++            try {
++                m_lastAssertionInfo =3D AssertionInfo( "TEST_CASE", testC=
aseInfo.lineInfo, "", ResultDisposition::Normal );
++
++                seedRng( *m_config );
++
++                Timer timer;
++                timer.start();
++                if( m_reporter->getPreferences().shouldRedirectStdOut ) {
++                    StreamRedirect coutRedir( Catch::cout(), redirectedCo=
ut );
++                    StdErrRedirect errRedir( redirectedCerr );
++                    invokeActiveTestCase();
++                }
++                else {
++                    invokeActiveTestCase();
++                }
++                duration =3D timer.getElapsedSeconds();
++            }
++            catch( TestFailureException& ) {
++                // This just means the test was aborted due to failure
++            }
++            catch(...) {
++                // Under CATCH_CONFIG_FAST_COMPILE, unexpected exceptions=
 under REQUIRE assertions
++                // are reported without translation at the point of origi=
n.
++                if (m_shouldReportUnexpected) {
++                    makeUnexpectedResultBuilder().useActiveException();
++                }
++            }
++            m_testCaseTracker->close();
++            handleUnfinishedSections();
++            m_messages.clear();
++
++            Counts assertions =3D m_totals.assertions - prevAssertions;
++            bool missingAssertions =3D testForMissingAssertions( assertio=
ns );
++
++            SectionStats testCaseSectionStats( testCaseSection, assertion=
s, duration, missingAssertions );
++            m_reporter->sectionEnded( testCaseSectionStats );
++        }
++
++        void invokeActiveTestCase() {
++            FatalConditionHandler fatalConditionHandler; // Handle signals
++            m_activeTestCase->invoke();
++            fatalConditionHandler.reset();
++        }
++
++    private:
++
++        ResultBuilder makeUnexpectedResultBuilder() const {
++            return ResultBuilder(   m_lastAssertionInfo.macroName,
++                                    m_lastAssertionInfo.lineInfo,
++                                    m_lastAssertionInfo.capturedExpressio=
n,
++                                    m_lastAssertionInfo.resultDisposition=
 );
++        }
++
++        void handleUnfinishedSections() {
++            // If sections ended prematurely due to an exception we store=
d their
++            // infos here so we can tear them down outside the unwind pro=
cess.
++            for( std::vector<SectionEndInfo>::const_reverse_iterator it =
=3D m_unfinishedSections.rbegin(),
++                        itEnd =3D m_unfinishedSections.rend();
++                    it !=3D itEnd;
++                    ++it )
++                sectionEnded( *it );
++            m_unfinishedSections.clear();
++        }
++
++        TestRunInfo m_runInfo;
++        IMutableContext& m_context;
++        TestCase const* m_activeTestCase;
++        ITracker* m_testCaseTracker;
++        ITracker* m_currentSectionTracker;
++        AssertionResult m_lastResult;
++
++        Ptr<IConfig const> m_config;
++        Totals m_totals;
++        Ptr<IStreamingReporter> m_reporter;
++        std::vector<MessageInfo> m_messages;
++        AssertionInfo m_lastAssertionInfo;
++        std::vector<SectionEndInfo> m_unfinishedSections;
++        std::vector<ITracker*> m_activeSections;
++        TrackerContext m_trackerContext;
++        size_t m_prevPassed;
++        bool m_shouldReportUnexpected;
++    };
++
++    IResultCapture& getResultCapture() {
++        if( IResultCapture* capture =3D getCurrentContext().getResultCapt=
ure() )
++            return *capture;
++        else
++            throw std::logic_error( "No result capture instance" );
++    }
++
++} // end namespace Catch
++
++// #included from: internal/catch_version.h
++#define TWOBLUECUBES_CATCH_VERSION_H_INCLUDED
++
++namespace Catch {
++
++    // Versioning information
++    struct Version {
++        Version(    unsigned int _majorVersion,
++                    unsigned int _minorVersion,
++                    unsigned int _patchNumber,
++                    char const * const _branchName,
++                    unsigned int _buildNumber );
++
++        unsigned int const majorVersion;
++        unsigned int const minorVersion;
++        unsigned int const patchNumber;
++
++        // buildNumber is only used if branchName is not null
++        char const * const branchName;
++        unsigned int const buildNumber;
++
++        friend std::ostream& operator << ( std::ostream& os, Version cons=
t& version );
++
++    private:
++        void operator=3D( Version const& );
++    };
++
++    inline Version libraryVersion();
++}
++
++#include <fstream>
++#include <stdlib.h>
++#include <limits>
++
++namespace Catch {
++
++    Ptr<IStreamingReporter> createReporter( std::string const& reporterNa=
me, Ptr<Config> const& config ) {
++        Ptr<IStreamingReporter> reporter =3D getRegistryHub().getReporter=
Registry().create( reporterName, config.get() );
++        if( !reporter ) {
++            std::ostringstream oss;
++            oss << "No reporter registered with name: '" << reporterName =
<< "'";
++            throw std::domain_error( oss.str() );
++        }
++        return reporter;
++    }
++
++#if !defined(CATCH_CONFIG_DEFAULT_REPORTER)
++#define CATCH_CONFIG_DEFAULT_REPORTER "console"
++#endif
++
++    Ptr<IStreamingReporter> makeReporter( Ptr<Config> const& config ) {
++        std::vector<std::string> reporters =3D config->getReporterNames();
++        if( reporters.empty() )
++            reporters.push_back( CATCH_CONFIG_DEFAULT_REPORTER );
++
++        Ptr<IStreamingReporter> reporter;
++        for( std::vector<std::string>::const_iterator it =3D reporters.be=
gin(), itEnd =3D reporters.end();
++                it !=3D itEnd;
++                ++it )
++            reporter =3D addReporter( reporter, createReporter( *it, conf=
ig ) );
++        return reporter;
++    }
++    Ptr<IStreamingReporter> addListeners( Ptr<IConfig const> const& confi=
g, Ptr<IStreamingReporter> reporters ) {
++        IReporterRegistry::Listeners listeners =3D getRegistryHub().getRe=
porterRegistry().getListeners();
++        for( IReporterRegistry::Listeners::const_iterator it =3D listener=
s.begin(), itEnd =3D listeners.end();
++                it !=3D itEnd;
++                ++it )
++            reporters =3D addReporter(reporters, (*it)->create( ReporterC=
onfig( config ) ) );
++        return reporters;
++    }
++
++    Totals runTests( Ptr<Config> const& config ) {
++
++        Ptr<IConfig const> iconfig =3D config.get();
++
++        Ptr<IStreamingReporter> reporter =3D makeReporter( config );
++        reporter =3D addListeners( iconfig, reporter );
++
++        RunContext context( iconfig, reporter );
++
++        Totals totals;
++
++        context.testGroupStarting( config->name(), 1, 1 );
++
++        TestSpec testSpec =3D config->testSpec();
++        if( !testSpec.hasFilters() )
++            testSpec =3D TestSpecParser( ITagAliasRegistry::get() ).parse=
( "~[.]" ).testSpec(); // All not hidden tests
++
++        std::vector<TestCase> const& allTestCases =3D getAllTestCasesSort=
ed( *iconfig );
++        for( std::vector<TestCase>::const_iterator it =3D allTestCases.be=
gin(), itEnd =3D allTestCases.end();
++                it !=3D itEnd;
++                ++it ) {
++            if( !context.aborting() && matchTest( *it, testSpec, *iconfig=
 ) )
++                totals +=3D context.runTest( *it );
++            else
++                reporter->skipTest( *it );
++        }
++
++        context.testGroupEnded( iconfig->name(), totals, 1, 1 );
++        return totals;
++    }
++
++    void applyFilenamesAsTags( IConfig const& config ) {
++        std::vector<TestCase> const& tests =3D getAllTestCasesSorted( con=
fig );
++        for(std::size_t i =3D 0; i < tests.size(); ++i ) {
++            TestCase& test =3D const_cast<TestCase&>( tests[i] );
++            std::set<std::string> tags =3D test.tags;
++
++            std::string filename =3D test.lineInfo.file;
++            std::string::size_type lastSlash =3D filename.find_last_of( "=
\\/" );
++            if( lastSlash !=3D std::string::npos )
++                filename =3D filename.substr( lastSlash+1 );
++
++            std::string::size_type lastDot =3D filename.find_last_of( '.'=
 );
++            if( lastDot !=3D std::string::npos )
++                filename =3D filename.substr( 0, lastDot );
++
++            tags.insert( '#' + filename );
++            setTags( test, tags );
++        }
++    }
++
++    class Session : NonCopyable {
++        static bool alreadyInstantiated;
++
++    public:
++
++        struct OnUnusedOptions { enum DoWhat { Ignore, Fail }; };
++
++        Session()
++        : m_cli( makeCommandLineParser() ) {
++            if( alreadyInstantiated ) {
++                std::string msg =3D "Only one instance of Catch::Session =
can ever be used";
++                Catch::cerr() << msg << std::endl;
++                throw std::logic_error( msg );
++            }
++            alreadyInstantiated =3D true;
++        }
++        ~Session() {
++            Catch::cleanUp();
++        }
++
++        void showHelp( std::string const& processName ) {
++            Catch::cout() << "\nCatch v" << libraryVersion() << "\n";
++
++            m_cli.usage( Catch::cout(), processName );
++            Catch::cout() << "For more detail usage please see the projec=
t docs\n" << std::endl;
++        }
++        void libIdentify() {
++            Catch::cout()
++                    << std::left << std::setw(16) << "description: " << "=
A Catch test executable\n"
++                    << std::left << std::setw(16) << "category: " << "tes=
tframework\n"
++                    << std::left << std::setw(16) << "framework: " << "Ca=
tch Test\n"
++                    << std::left << std::setw(16) << "version: " << libra=
ryVersion() << std::endl;
++        }
++
++        int applyCommandLine( int argc, char const* const* const argv, On=
UnusedOptions::DoWhat unusedOptionBehaviour =3D OnUnusedOptions::Fail ) {
++            try {
++                m_cli.setThrowOnUnrecognisedTokens( unusedOptionBehaviour=
 =3D=3D OnUnusedOptions::Fail );
++                m_unusedTokens =3D m_cli.parseInto( Clara::argsToVector( =
argc, argv ), m_configData );
++                if( m_configData.showHelp )
++                    showHelp( m_configData.processName );
++                if( m_configData.libIdentify )
++                    libIdentify();
++                m_config.reset();
++            }
++            catch( std::exception& ex ) {
++                {
++                    Colour colourGuard( Colour::Red );
++                    Catch::cerr()
++                        << "\nError(s) in input:\n"
++                        << Text( ex.what(), TextAttributes().setIndent(2)=
 )
++                        << "\n\n";
++                }
++                m_cli.usage( Catch::cout(), m_configData.processName );
++                return (std::numeric_limits<int>::max)();
++            }
++            return 0;
++        }
++
++        void useConfigData( ConfigData const& _configData ) {
++            m_configData =3D _configData;
++            m_config.reset();
++        }
++
++        int run( int argc, char const* const* const argv ) {
++
++            int returnCode =3D applyCommandLine( argc, argv );
++            if( returnCode =3D=3D 0 )
++                returnCode =3D run();
++            return returnCode;
++        }
++
++    #if defined(WIN32) && defined(UNICODE)
++        int run( int argc, wchar_t const* const* const argv ) {
++
++            char **utf8Argv =3D new char *[ argc ];
++
++            for ( int i =3D 0; i < argc; ++i ) {
++                int bufSize =3D WideCharToMultiByte( CP_UTF8, 0, argv[i],=
 -1, NULL, 0, NULL, NULL );
++
++                utf8Argv[ i ] =3D new char[ bufSize ];
++
++                WideCharToMultiByte( CP_UTF8, 0, argv[i], -1, utf8Argv[i]=
, bufSize, NULL, NULL );
++            }
++
++            int returnCode =3D applyCommandLine( argc, utf8Argv );
++            if( returnCode =3D=3D 0 )
++                returnCode =3D run();
++
++            for ( int i =3D 0; i < argc; ++i )
++                delete [] utf8Argv[ i ];
++
++            delete [] utf8Argv;
++
++            return returnCode;
++        }
++    #endif
++
++        int run() {
++            if( ( m_configData.waitForKeypress & WaitForKeypress::BeforeS=
tart ) !=3D 0 ) {
++                Catch::cout() << "...waiting for enter/ return before sta=
rting" << std::endl;
++                static_cast<void>(std::getchar());
++            }
++            int exitCode =3D runInternal();
++            if( ( m_configData.waitForKeypress & WaitForKeypress::BeforeE=
xit ) !=3D 0 ) {
++                Catch::cout() << "...waiting for enter/ return before exi=
ting, with code: " << exitCode << std::endl;
++                static_cast<void>(std::getchar());
++            }
++            return exitCode;
++        }
++
++        Clara::CommandLine<ConfigData> const& cli() const {
++            return m_cli;
++        }
++        std::vector<Clara::Parser::Token> const& unusedTokens() const {
++            return m_unusedTokens;
++        }
++        ConfigData& configData() {
++            return m_configData;
++        }
++        Config& config() {
++            if( !m_config )
++                m_config =3D new Config( m_configData );
++            return *m_config;
++        }
++    private:
++
++        int runInternal() {
++            if( m_configData.showHelp || m_configData.libIdentify )
++                return 0;
++
++            try
++            {
++                config(); // Force config to be constructed
++
++                seedRng( *m_config );
++
++                if( m_configData.filenamesAsTags )
++                    applyFilenamesAsTags( *m_config );
++
++                // Handle list request
++                if( Option<std::size_t> listed =3D list( config() ) )
++                    return static_cast<int>( *listed );
++
++                return static_cast<int>( runTests( m_config ).assertions.=
failed );
++            }
++            catch( std::exception& ex ) {
++                Catch::cerr() << ex.what() << std::endl;
++                return (std::numeric_limits<int>::max)();
++            }
++        }
++
++        Clara::CommandLine<ConfigData> m_cli;
++        std::vector<Clara::Parser::Token> m_unusedTokens;
++        ConfigData m_configData;
++        Ptr<Config> m_config;
++    };
++
++    bool Session::alreadyInstantiated =3D false;
++
++} // end namespace Catch
++
++// #included from: catch_registry_hub.hpp
++#define TWOBLUECUBES_CATCH_REGISTRY_HUB_HPP_INCLUDED
++
++// #included from: catch_test_case_registry_impl.hpp
++#define TWOBLUECUBES_CATCH_TEST_CASE_REGISTRY_IMPL_HPP_INCLUDED
++
++#include <vector>
++#include <set>
++#include <sstream>
++#include <algorithm>
++
++namespace Catch {
++
++    struct RandomNumberGenerator {
++        typedef unsigned int result_type;
++
++        result_type operator()( result_type n ) const { return std::rand(=
) % n; }
++
++#ifdef CATCH_CONFIG_CPP11_SHUFFLE
++        static constexpr result_type (min)() { return 0; }
++        static constexpr result_type (max)() { return 1000000; }
++        result_type operator()() const { return std::rand() % (max)(); }
++#endif
++        template<typename V>
++        static void shuffle( V& vector ) {
++            RandomNumberGenerator rng;
++#ifdef CATCH_CONFIG_CPP11_SHUFFLE
++            std::shuffle( vector.begin(), vector.end(), rng );
++#else
++            std::random_shuffle( vector.begin(), vector.end(), rng );
++#endif
++        }
++    };
++
++    inline std::vector<TestCase> sortTests( IConfig const& config, std::v=
ector<TestCase> const& unsortedTestCases ) {
++
++        std::vector<TestCase> sorted =3D unsortedTestCases;
++
++        switch( config.runOrder() ) {
++            case RunTests::InLexicographicalOrder:
++                std::sort( sorted.begin(), sorted.end() );
++                break;
++            case RunTests::InRandomOrder:
++                {
++                    seedRng( config );
++                    RandomNumberGenerator::shuffle( sorted );
++                }
++                break;
++            case RunTests::InDeclarationOrder:
++                // already in declaration order
++                break;
++        }
++        return sorted;
++    }
++    bool matchTest( TestCase const& testCase, TestSpec const& testSpec, I=
Config const& config ) {
++        return testSpec.matches( testCase ) && ( config.allowThrows() || =
!testCase.throws() );
++    }
++
++    void enforceNoDuplicateTestCases( std::vector<TestCase> const& functi=
ons ) {
++        std::set<TestCase> seenFunctions;
++        for( std::vector<TestCase>::const_iterator it =3D functions.begin=
(), itEnd =3D functions.end();
++            it !=3D itEnd;
++            ++it ) {
++            std::pair<std::set<TestCase>::const_iterator, bool> prev =3D =
seenFunctions.insert( *it );
++            if( !prev.second ) {
++                std::ostringstream ss;
++
++                ss  << Colour( Colour::Red )
++                    << "error: TEST_CASE( \"" << it->name << "\" ) alread=
y defined.\n"
++                    << "\tFirst seen at " << prev.first->getTestCaseInfo(=
).lineInfo << '\n'
++                    << "\tRedefined at " << it->getTestCaseInfo().lineInf=
o << std::endl;
++
++                throw std::runtime_error(ss.str());
++            }
++        }
++    }
++
++    std::vector<TestCase> filterTests( std::vector<TestCase> const& testC=
ases, TestSpec const& testSpec, IConfig const& config ) {
++        std::vector<TestCase> filtered;
++        filtered.reserve( testCases.size() );
++        for( std::vector<TestCase>::const_iterator it =3D testCases.begin=
(), itEnd =3D testCases.end();
++                it !=3D itEnd;
++                ++it )
++            if( matchTest( *it, testSpec, config ) )
++                filtered.push_back( *it );
++        return filtered;
++    }
++    std::vector<TestCase> const& getAllTestCasesSorted( IConfig const& co=
nfig ) {
++        return getRegistryHub().getTestCaseRegistry().getAllTestsSorted( =
config );
++    }
++
++    class TestRegistry : public ITestCaseRegistry {
++    public:
++        TestRegistry()
++        :   m_currentSortOrder( RunTests::InDeclarationOrder ),
++            m_unnamedCount( 0 )
++        {}
++        virtual ~TestRegistry();
++
++        virtual void registerTest( TestCase const& testCase ) {
++            std::string name =3D testCase.getTestCaseInfo().name;
++            if( name.empty() ) {
++                std::ostringstream oss;
++                oss << "Anonymous test case " << ++m_unnamedCount;
++                return registerTest( testCase.withName( oss.str() ) );
++            }
++            m_functions.push_back( testCase );
++        }
++
++        virtual std::vector<TestCase> const& getAllTests() const {
++            return m_functions;
++        }
++        virtual std::vector<TestCase> const& getAllTestsSorted( IConfig c=
onst& config ) const {
++            if( m_sortedFunctions.empty() )
++                enforceNoDuplicateTestCases( m_functions );
++
++            if(  m_currentSortOrder !=3D config.runOrder() || m_sortedFun=
ctions.empty() ) {
++                m_sortedFunctions =3D sortTests( config, m_functions );
++                m_currentSortOrder =3D config.runOrder();
++            }
++            return m_sortedFunctions;
++        }
++
++    private:
++        std::vector<TestCase> m_functions;
++        mutable RunTests::InWhatOrder m_currentSortOrder;
++        mutable std::vector<TestCase> m_sortedFunctions;
++        size_t m_unnamedCount;
++        std::ios_base::Init m_ostreamInit; // Forces cout/ cerr to be ini=
tialised
++    };
++
++    /////////////////////////////////////////////////////////////////////=
//////
++
++    class FreeFunctionTestCase : public SharedImpl<ITestCase> {
++    public:
++
++        FreeFunctionTestCase( TestFunction fun ) : m_fun( fun ) {}
++
++        virtual void invoke() const {
++            m_fun();
++        }
++
++    private:
++        virtual ~FreeFunctionTestCase();
++
++        TestFunction m_fun;
++    };
++
++    inline std::string extractClassName( std::string const& classOrQualif=
iedMethodName ) {
++        std::string className =3D classOrQualifiedMethodName;
++        if( startsWith( className, '&' ) )
++        {
++            std::size_t lastColons =3D className.rfind( "::" );
++            std::size_t penultimateColons =3D className.rfind( "::", last=
Colons-1 );
++            if( penultimateColons =3D=3D std::string::npos )
++                penultimateColons =3D 1;
++            className =3D className.substr( penultimateColons, lastColons=
-penultimateColons );
++        }
++        return className;
++    }
++
++    void registerTestCase
++        (   ITestCase* testCase,
++            char const* classOrQualifiedMethodName,
++            NameAndDesc const& nameAndDesc,
++            SourceLineInfo const& lineInfo ) {
++
++        getMutableRegistryHub().registerTest
++            ( makeTestCase
++                (   testCase,
++                    extractClassName( classOrQualifiedMethodName ),
++                    nameAndDesc.name,
++                    nameAndDesc.description,
++                    lineInfo ) );
++    }
++    void registerTestCaseFunction
++        (   TestFunction function,
++            SourceLineInfo const& lineInfo,
++            NameAndDesc const& nameAndDesc ) {
++        registerTestCase( new FreeFunctionTestCase( function ), "", nameA=
ndDesc, lineInfo );
++    }
++
++    /////////////////////////////////////////////////////////////////////=
//////
++
++    AutoReg::AutoReg
++        (   TestFunction function,
++            SourceLineInfo const& lineInfo,
++            NameAndDesc const& nameAndDesc ) {
++        registerTestCaseFunction( function, lineInfo, nameAndDesc );
++    }
++
++    AutoReg::~AutoReg() {}
++
++} // end namespace Catch
++
++// #included from: catch_reporter_registry.hpp
++#define TWOBLUECUBES_CATCH_REPORTER_REGISTRY_HPP_INCLUDED
++
++#include <map>
++
++namespace Catch {
++
++    class ReporterRegistry : public IReporterRegistry {
++
++    public:
++
++        virtual ~ReporterRegistry() CATCH_OVERRIDE {}
++
++        virtual IStreamingReporter* create( std::string const& name, Ptr<=
IConfig const> const& config ) const CATCH_OVERRIDE {
++            FactoryMap::const_iterator it =3D  m_factories.find( name );
++            if( it =3D=3D m_factories.end() )
++                return CATCH_NULL;
++            return it->second->create( ReporterConfig( config ) );
++        }
++
++        void registerReporter( std::string const& name, Ptr<IReporterFact=
ory> const& factory ) {
++            m_factories.insert( std::make_pair( name, factory ) );
++        }
++        void registerListener( Ptr<IReporterFactory> const& factory ) {
++            m_listeners.push_back( factory );
++        }
++
++        virtual FactoryMap const& getFactories() const CATCH_OVERRIDE {
++            return m_factories;
++        }
++        virtual Listeners const& getListeners() const CATCH_OVERRIDE {
++            return m_listeners;
++        }
++
++    private:
++        FactoryMap m_factories;
++        Listeners m_listeners;
++    };
++}
++
++// #included from: catch_exception_translator_registry.hpp
++#define TWOBLUECUBES_CATCH_EXCEPTION_TRANSLATOR_REGISTRY_HPP_INCLUDED
++
++#ifdef __OBJC__
++#import "Foundation/Foundation.h"
++#endif
++
++namespace Catch {
++
++    class ExceptionTranslatorRegistry : public IExceptionTranslatorRegist=
ry {
++    public:
++        ~ExceptionTranslatorRegistry() {
++            deleteAll( m_translators );
++        }
++
++        virtual void registerTranslator( const IExceptionTranslator* tran=
slator ) {
++            m_translators.push_back( translator );
++        }
++
++        virtual std::string translateActiveException() const {
++            try {
++#ifdef __OBJC__
++                // In Objective-C try objective-c exceptions first
++                @try {
++                    return tryTranslators();
++                }
++                @catch (NSException *exception) {
++                    return Catch::toString( [exception description] );
++                }
++#else
++                return tryTranslators();
++#endif
++            }
++            catch( TestFailureException& ) {
++                throw;
++            }
++            catch( std::exception& ex ) {
++                return ex.what();
++            }
++            catch( std::string& msg ) {
++                return msg;
++            }
++            catch( const char* msg ) {
++                return msg;
++            }
++            catch(...) {
++                return "Unknown exception";
++            }
++        }
++
++        std::string tryTranslators() const {
++            if( m_translators.empty() )
++                throw;
++            else
++                return m_translators[0]->translate( m_translators.begin()=
+1, m_translators.end() );
++        }
++
++    private:
++        std::vector<const IExceptionTranslator*> m_translators;
++    };
++}
++
++// #included from: catch_tag_alias_registry.h
++#define TWOBLUECUBES_CATCH_TAG_ALIAS_REGISTRY_H_INCLUDED
++
++#include <map>
++
++namespace Catch {
++
++    class TagAliasRegistry : public ITagAliasRegistry {
++    public:
++        virtual ~TagAliasRegistry();
++        virtual Option<TagAlias> find( std::string const& alias ) const;
++        virtual std::string expandAliases( std::string const& unexpandedT=
estSpec ) const;
++        void add( std::string const& alias, std::string const& tag, Sourc=
eLineInfo const& lineInfo );
++
++    private:
++        std::map<std::string, TagAlias> m_registry;
++    };
++
++} // end namespace Catch
++
++namespace Catch {
++
++    namespace {
++
++        class RegistryHub : public IRegistryHub, public IMutableRegistryH=
ub {
++
++            RegistryHub( RegistryHub const& );
++            void operator=3D( RegistryHub const& );
++
++        public: // IRegistryHub
++            RegistryHub() {
++            }
++            virtual IReporterRegistry const& getReporterRegistry() const =
CATCH_OVERRIDE {
++                return m_reporterRegistry;
++            }
++            virtual ITestCaseRegistry const& getTestCaseRegistry() const =
CATCH_OVERRIDE {
++                return m_testCaseRegistry;
++            }
++            virtual IExceptionTranslatorRegistry& getExceptionTranslatorR=
egistry() CATCH_OVERRIDE {
++                return m_exceptionTranslatorRegistry;
++            }
++            virtual ITagAliasRegistry const& getTagAliasRegistry() const =
CATCH_OVERRIDE {
++                return m_tagAliasRegistry;
++            }
++
++        public: // IMutableRegistryHub
++            virtual void registerReporter( std::string const& name, Ptr<I=
ReporterFactory> const& factory ) CATCH_OVERRIDE {
++                m_reporterRegistry.registerReporter( name, factory );
++            }
++            virtual void registerListener( Ptr<IReporterFactory> const& f=
actory ) CATCH_OVERRIDE {
++                m_reporterRegistry.registerListener( factory );
++            }
++            virtual void registerTest( TestCase const& testInfo ) CATCH_O=
VERRIDE {
++                m_testCaseRegistry.registerTest( testInfo );
++            }
++            virtual void registerTranslator( const IExceptionTranslator* =
translator ) CATCH_OVERRIDE {
++                m_exceptionTranslatorRegistry.registerTranslator( transla=
tor );
++            }
++            virtual void registerTagAlias( std::string const& alias, std:=
:string const& tag, SourceLineInfo const& lineInfo ) CATCH_OVERRIDE {
++                m_tagAliasRegistry.add( alias, tag, lineInfo );
++            }
++
++        private:
++            TestRegistry m_testCaseRegistry;
++            ReporterRegistry m_reporterRegistry;
++            ExceptionTranslatorRegistry m_exceptionTranslatorRegistry;
++            TagAliasRegistry m_tagAliasRegistry;
++        };
++
++        // Single, global, instance
++        inline RegistryHub*& getTheRegistryHub() {
++            static RegistryHub* theRegistryHub =3D CATCH_NULL;
++            if( !theRegistryHub )
++                theRegistryHub =3D new RegistryHub();
++            return theRegistryHub;
++        }
++    }
++
++    IRegistryHub& getRegistryHub() {
++        return *getTheRegistryHub();
++    }
++    IMutableRegistryHub& getMutableRegistryHub() {
++        return *getTheRegistryHub();
++    }
++    void cleanUp() {
++        delete getTheRegistryHub();
++        getTheRegistryHub() =3D CATCH_NULL;
++        cleanUpContext();
++    }
++    std::string translateActiveException() {
++        return getRegistryHub().getExceptionTranslatorRegistry().translat=
eActiveException();
++    }
++
++} // end namespace Catch
++
++// #included from: catch_notimplemented_exception.hpp
++#define TWOBLUECUBES_CATCH_NOTIMPLEMENTED_EXCEPTION_HPP_INCLUDED
++
++#include <sstream>
++
++namespace Catch {
++
++    NotImplementedException::NotImplementedException( SourceLineInfo cons=
t& lineInfo )
++    :   m_lineInfo( lineInfo ) {
++        std::ostringstream oss;
++        oss << lineInfo << ": function ";
++        oss << "not implemented";
++        m_what =3D oss.str();
++    }
++
++    const char* NotImplementedException::what() const CATCH_NOEXCEPT {
++        return m_what.c_str();
++    }
++
++} // end namespace Catch
++
++// #included from: catch_context_impl.hpp
++#define TWOBLUECUBES_CATCH_CONTEXT_IMPL_HPP_INCLUDED
++
++// #included from: catch_stream.hpp
++#define TWOBLUECUBES_CATCH_STREAM_HPP_INCLUDED
++
++#include <stdexcept>
++#include <cstdio>
++#include <iostream>
++
++namespace Catch {
++
++    template<typename WriterF, size_t bufferSize=3D256>
++    class StreamBufImpl : public StreamBufBase {
++        char data[bufferSize];
++        WriterF m_writer;
++
++    public:
++        StreamBufImpl() {
++            setp( data, data + sizeof(data) );
++        }
++
++        ~StreamBufImpl() CATCH_NOEXCEPT {
++            sync();
++        }
++
++    private:
++        int overflow( int c ) {
++            sync();
++
++            if( c !=3D EOF ) {
++                if( pbase() =3D=3D epptr() )
++                    m_writer( std::string( 1, static_cast<char>( c ) ) );
++                else
++                    sputc( static_cast<char>( c ) );
++            }
++            return 0;
++        }
++
++        int sync() {
++            if( pbase() !=3D pptr() ) {
++                m_writer( std::string( pbase(), static_cast<std::string::=
size_type>( pptr() - pbase() ) ) );
++                setp( pbase(), epptr() );
++            }
++            return 0;
++        }
++    };
++
++    /////////////////////////////////////////////////////////////////////=
//////
++
++    FileStream::FileStream( std::string const& filename ) {
++        m_ofs.open( filename.c_str() );
++        if( m_ofs.fail() ) {
++            std::ostringstream oss;
++            oss << "Unable to open file: '" << filename << '\'';
++            throw std::domain_error( oss.str() );
++        }
++    }
++
++    std::ostream& FileStream::stream() const {
++        return m_ofs;
++    }
++
++    struct OutputDebugWriter {
++
++        void operator()( std::string const&str ) {
++            writeToDebugConsole( str );
++        }
++    };
++
++    DebugOutStream::DebugOutStream()
++    :   m_streamBuf( new StreamBufImpl<OutputDebugWriter>() ),
++        m_os( m_streamBuf.get() )
++    {}
++
++    std::ostream& DebugOutStream::stream() const {
++        return m_os;
++    }
++
++    // Store the streambuf from cout up-front because
++    // cout may get redirected when running tests
++    CoutStream::CoutStream()
++    :   m_os( Catch::cout().rdbuf() )
++    {}
++
++    std::ostream& CoutStream::stream() const {
++        return m_os;
++    }
++
++#ifndef CATCH_CONFIG_NOSTDOUT // If you #define this you must implement t=
hese functions
++    std::ostream& cout() {
++        return std::cout;
++    }
++    std::ostream& cerr() {
++        return std::cerr;
++    }
++    std::ostream& clog() {
++        return std::clog;
++    }
++#endif
++}
++
++namespace Catch {
++
++    class Context : public IMutableContext {
++
++        Context() : m_config( CATCH_NULL ), m_runner( CATCH_NULL ), m_res=
ultCapture( CATCH_NULL ) {}
++        Context( Context const& );
++        void operator=3D( Context const& );
++
++    public:
++        virtual ~Context() {
++            deleteAllValues( m_generatorsByTestName );
++        }
++
++    public: // IContext
++        virtual IResultCapture* getResultCapture() {
++            return m_resultCapture;
++        }
++        virtual IRunner* getRunner() {
++            return m_runner;
++        }
++        virtual size_t getGeneratorIndex( std::string const& fileInfo, si=
ze_t totalSize ) {
++            return getGeneratorsForCurrentTest()
++            .getGeneratorInfo( fileInfo, totalSize )
++            .getCurrentIndex();
++        }
++        virtual bool advanceGeneratorsForCurrentTest() {
++            IGeneratorsForTest* generators =3D findGeneratorsForCurrentTe=
st();
++            return generators && generators->moveNext();
++        }
++
++        virtual Ptr<IConfig const> getConfig() const {
++            return m_config;
++        }
++
++    public: // IMutableContext
++        virtual void setResultCapture( IResultCapture* resultCapture ) {
++            m_resultCapture =3D resultCapture;
++        }
++        virtual void setRunner( IRunner* runner ) {
++            m_runner =3D runner;
++        }
++        virtual void setConfig( Ptr<IConfig const> const& config ) {
++            m_config =3D config;
++        }
++
++        friend IMutableContext& getCurrentMutableContext();
++
++    private:
++        IGeneratorsForTest* findGeneratorsForCurrentTest() {
++            std::string testName =3D getResultCapture()->getCurrentTestNa=
me();
++
++            std::map<std::string, IGeneratorsForTest*>::const_iterator it=
 =3D
++                m_generatorsByTestName.find( testName );
++            return it !=3D m_generatorsByTestName.end()
++                ? it->second
++                : CATCH_NULL;
++        }
++
++        IGeneratorsForTest& getGeneratorsForCurrentTest() {
++            IGeneratorsForTest* generators =3D findGeneratorsForCurrentTe=
st();
++            if( !generators ) {
++                std::string testName =3D getResultCapture()->getCurrentTe=
stName();
++                generators =3D createGeneratorsForTest();
++                m_generatorsByTestName.insert( std::make_pair( testName, =
generators ) );
++            }
++            return *generators;
++        }
++
++    private:
++        Ptr<IConfig const> m_config;
++        IRunner* m_runner;
++        IResultCapture* m_resultCapture;
++        std::map<std::string, IGeneratorsForTest*> m_generatorsByTestName;
++    };
++
++    namespace {
++        Context* currentContext =3D CATCH_NULL;
++    }
++    IMutableContext& getCurrentMutableContext() {
++        if( !currentContext )
++            currentContext =3D new Context();
++        return *currentContext;
++    }
++    IContext& getCurrentContext() {
++        return getCurrentMutableContext();
++    }
++
++    void cleanUpContext() {
++        delete currentContext;
++        currentContext =3D CATCH_NULL;
++    }
++}
++
++// #included from: catch_console_colour_impl.hpp
++#define TWOBLUECUBES_CATCH_CONSOLE_COLOUR_IMPL_HPP_INCLUDED
++
++// #included from: catch_errno_guard.hpp
++#define TWOBLUECUBES_CATCH_ERRNO_GUARD_HPP_INCLUDED
++
++#include <cerrno>
++
++namespace Catch {
++
++    class ErrnoGuard {
++    public:
++        ErrnoGuard():m_oldErrno(errno){}
++        ~ErrnoGuard() { errno =3D m_oldErrno; }
++    private:
++        int m_oldErrno;
++    };
++
++}
++
++namespace Catch {
++    namespace {
++
++        struct IColourImpl {
++            virtual ~IColourImpl() {}
++            virtual void use( Colour::Code _colourCode ) =3D 0;
++        };
++
++        struct NoColourImpl : IColourImpl {
++            void use( Colour::Code ) {}
++
++            static IColourImpl* instance() {
++                static NoColourImpl s_instance;
++                return &s_instance;
++            }
++        };
++
++    } // anon namespace
++} // namespace Catch
++
++#if !defined( CATCH_CONFIG_COLOUR_NONE ) && !defined( CATCH_CONFIG_COLOUR=
_WINDOWS ) && !defined( CATCH_CONFIG_COLOUR_ANSI )
++#   ifdef CATCH_PLATFORM_WINDOWS
++#       define CATCH_CONFIG_COLOUR_WINDOWS
++#   else
++#       define CATCH_CONFIG_COLOUR_ANSI
++#   endif
++#endif
++
++#if defined ( CATCH_CONFIG_COLOUR_WINDOWS ) /////////////////////////////=
////////////
++
++namespace Catch {
++namespace {
++
++    class Win32ColourImpl : public IColourImpl {
++    public:
++        Win32ColourImpl() : stdoutHandle( GetStdHandle(STD_OUTPUT_HANDLE)=
 )
++        {
++            CONSOLE_SCREEN_BUFFER_INFO csbiInfo;
++            GetConsoleScreenBufferInfo( stdoutHandle, &csbiInfo );
++            originalForegroundAttributes =3D csbiInfo.wAttributes & ~( BA=
CKGROUND_GREEN | BACKGROUND_RED | BACKGROUND_BLUE | BACKGROUND_INTENSITY );
++            originalBackgroundAttributes =3D csbiInfo.wAttributes & ~( FO=
REGROUND_GREEN | FOREGROUND_RED | FOREGROUND_BLUE | FOREGROUND_INTENSITY );
++        }
++
++        virtual void use( Colour::Code _colourCode ) {
++            switch( _colourCode ) {
++                case Colour::None:      return setTextAttribute( original=
ForegroundAttributes );
++                case Colour::White:     return setTextAttribute( FOREGROU=
ND_GREEN | FOREGROUND_RED | FOREGROUND_BLUE );
++                case Colour::Red:       return setTextAttribute( FOREGROU=
ND_RED );
++                case Colour::Green:     return setTextAttribute( FOREGROU=
ND_GREEN );
++                case Colour::Blue:      return setTextAttribute( FOREGROU=
ND_BLUE );
++                case Colour::Cyan:      return setTextAttribute( FOREGROU=
ND_BLUE | FOREGROUND_GREEN );
++                case Colour::Yellow:    return setTextAttribute( FOREGROU=
ND_RED | FOREGROUND_GREEN );
++                case Colour::Grey:      return setTextAttribute( 0 );
++
++                case Colour::LightGrey:     return setTextAttribute( FORE=
GROUND_INTENSITY );
++                case Colour::BrightRed:     return setTextAttribute( FORE=
GROUND_INTENSITY | FOREGROUND_RED );
++                case Colour::BrightGreen:   return setTextAttribute( FORE=
GROUND_INTENSITY | FOREGROUND_GREEN );
++                case Colour::BrightWhite:   return setTextAttribute( FORE=
GROUND_INTENSITY | FOREGROUND_GREEN | FOREGROUND_RED | FOREGROUND_BLUE );
++
++                case Colour::Bright: throw std::logic_error( "not a colou=
r" );
++            }
++        }
++
++    private:
++        void setTextAttribute( WORD _textAttribute ) {
++            SetConsoleTextAttribute( stdoutHandle, _textAttribute | origi=
nalBackgroundAttributes );
++        }
++        HANDLE stdoutHandle;
++        WORD originalForegroundAttributes;
++        WORD originalBackgroundAttributes;
++    };
++
++    IColourImpl* platformColourInstance() {
++        static Win32ColourImpl s_instance;
++
++        Ptr<IConfig const> config =3D getCurrentContext().getConfig();
++        UseColour::YesOrNo colourMode =3D config
++            ? config->useColour()
++            : UseColour::Auto;
++        if( colourMode =3D=3D UseColour::Auto )
++            colourMode =3D !isDebuggerActive()
++                ? UseColour::Yes
++                : UseColour::No;
++        return colourMode =3D=3D UseColour::Yes
++            ? &s_instance
++            : NoColourImpl::instance();
++    }
++
++} // end anon namespace
++} // end namespace Catch
++
++#elif defined( CATCH_CONFIG_COLOUR_ANSI ) ///////////////////////////////=
///////
++
++#include <unistd.h>
++
++namespace Catch {
++namespace {
++
++    // use POSIX/ ANSI console terminal codes
++    // Thanks to Adam Strzelecki for original contribution
++    // (http://github.com/nanoant)
++    // https://github.com/philsquared/Catch/pull/131
++    class PosixColourImpl : public IColourImpl {
++    public:
++        virtual void use( Colour::Code _colourCode ) {
++            switch( _colourCode ) {
++                case Colour::None:
++                case Colour::White:     return setColour( "[0m" );
++                case Colour::Red:       return setColour( "[0;31m" );
++                case Colour::Green:     return setColour( "[0;32m" );
++                case Colour::Blue:      return setColour( "[0;34m" );
++                case Colour::Cyan:      return setColour( "[0;36m" );
++                case Colour::Yellow:    return setColour( "[0;33m" );
++                case Colour::Grey:      return setColour( "[1;30m" );
++
++                case Colour::LightGrey:     return setColour( "[0;37m" );
++                case Colour::BrightRed:     return setColour( "[1;31m" );
++                case Colour::BrightGreen:   return setColour( "[1;32m" );
++                case Colour::BrightWhite:   return setColour( "[1;37m" );
++
++                case Colour::Bright: throw std::logic_error( "not a colou=
r" );
++            }
++        }
++        static IColourImpl* instance() {
++            static PosixColourImpl s_instance;
++            return &s_instance;
++        }
++
++    private:
++        void setColour( const char* _escapeCode ) {
++            Catch::cout() << '\033' << _escapeCode;
++        }
++    };
++
++    IColourImpl* platformColourInstance() {
++        ErrnoGuard guard;
++        Ptr<IConfig const> config =3D getCurrentContext().getConfig();
++        UseColour::YesOrNo colourMode =3D config
++            ? config->useColour()
++            : UseColour::Auto;
++        if( colourMode =3D=3D UseColour::Auto )
++            colourMode =3D (!isDebuggerActive() && isatty(STDOUT_FILENO) )
++                ? UseColour::Yes
++                : UseColour::No;
++        return colourMode =3D=3D UseColour::Yes
++            ? PosixColourImpl::instance()
++            : NoColourImpl::instance();
++    }
++
++} // end anon namespace
++} // end namespace Catch
++
++#else  // not Windows or ANSI ///////////////////////////////////////////=
////
++
++namespace Catch {
++
++    static IColourImpl* platformColourInstance() { return NoColourImpl::i=
nstance(); }
++
++} // end namespace Catch
++
++#endif // Windows/ ANSI/ None
++
++namespace Catch {
++
++    Colour::Colour( Code _colourCode ) : m_moved( false ) { use( _colourC=
ode ); }
++    Colour::Colour( Colour const& _other ) : m_moved( false ) { const_cas=
t<Colour&>( _other ).m_moved =3D true; }
++    Colour::~Colour(){ if( !m_moved ) use( None ); }
++
++    void Colour::use( Code _colourCode ) {
++        static IColourImpl* impl =3D platformColourInstance();
++        impl->use( _colourCode );
++    }
++
++} // end namespace Catch
++
++// #included from: catch_generators_impl.hpp
++#define TWOBLUECUBES_CATCH_GENERATORS_IMPL_HPP_INCLUDED
++
++#include <vector>
++#include <string>
++#include <map>
++
++namespace Catch {
++
++    struct GeneratorInfo : IGeneratorInfo {
++
++        GeneratorInfo( std::size_t size )
++        :   m_size( size ),
++            m_currentIndex( 0 )
++        {}
++
++        bool moveNext() {
++            if( ++m_currentIndex =3D=3D m_size ) {
++                m_currentIndex =3D 0;
++                return false;
++            }
++            return true;
++        }
++
++        std::size_t getCurrentIndex() const {
++            return m_currentIndex;
++        }
++
++        std::size_t m_size;
++        std::size_t m_currentIndex;
++    };
++
++    /////////////////////////////////////////////////////////////////////=
//////
++
++    class GeneratorsForTest : public IGeneratorsForTest {
++
++    public:
++        ~GeneratorsForTest() {
++            deleteAll( m_generatorsInOrder );
++        }
++
++        IGeneratorInfo& getGeneratorInfo( std::string const& fileInfo, st=
d::size_t size ) {
++            std::map<std::string, IGeneratorInfo*>::const_iterator it =3D=
 m_generatorsByName.find( fileInfo );
++            if( it =3D=3D m_generatorsByName.end() ) {
++                IGeneratorInfo* info =3D new GeneratorInfo( size );
++                m_generatorsByName.insert( std::make_pair( fileInfo, info=
 ) );
++                m_generatorsInOrder.push_back( info );
++                return *info;
++            }
++            return *it->second;
++        }
++
++        bool moveNext() {
++            std::vector<IGeneratorInfo*>::const_iterator it =3D m_generat=
orsInOrder.begin();
++            std::vector<IGeneratorInfo*>::const_iterator itEnd =3D m_gene=
ratorsInOrder.end();
++            for(; it !=3D itEnd; ++it ) {
++                if( (*it)->moveNext() )
++                    return true;
++            }
++            return false;
++        }
++
++    private:
++        std::map<std::string, IGeneratorInfo*> m_generatorsByName;
++        std::vector<IGeneratorInfo*> m_generatorsInOrder;
++    };
++
++    IGeneratorsForTest* createGeneratorsForTest()
++    {
++        return new GeneratorsForTest();
++    }
++
++} // end namespace Catch
++
++// #included from: catch_assertionresult.hpp
++#define TWOBLUECUBES_CATCH_ASSERTIONRESULT_HPP_INCLUDED
++
++namespace Catch {
++
++    AssertionInfo::AssertionInfo():macroName(""), capturedExpression(""),=
 resultDisposition(ResultDisposition::Normal), secondArg(""){}
++
++    AssertionInfo::AssertionInfo(   char const * _macroName,
++                                    SourceLineInfo const& _lineInfo,
++                                    char const * _capturedExpression,
++                                    ResultDisposition::Flags _resultDispo=
sition,
++                                    char const * _secondArg)
++    :   macroName( _macroName ),
++        lineInfo( _lineInfo ),
++        capturedExpression( _capturedExpression ),
++        resultDisposition( _resultDisposition ),
++        secondArg( _secondArg )
++    {}
++
++    AssertionResult::AssertionResult() {}
++
++    AssertionResult::AssertionResult( AssertionInfo const& info, Assertio=
nResultData const& data )
++    :   m_info( info ),
++        m_resultData( data )
++    {}
++
++    AssertionResult::~AssertionResult() {}
++
++    // Result was a success
++    bool AssertionResult::succeeded() const {
++        return Catch::isOk( m_resultData.resultType );
++    }
++
++    // Result was a success, or failure is suppressed
++    bool AssertionResult::isOk() const {
++        return Catch::isOk( m_resultData.resultType ) || shouldSuppressFa=
ilure( m_info.resultDisposition );
++    }
++
++    ResultWas::OfType AssertionResult::getResultType() const {
++        return m_resultData.resultType;
++    }
++
++    bool AssertionResult::hasExpression() const {
++        return m_info.capturedExpression[0] !=3D 0;
++    }
++
++    bool AssertionResult::hasMessage() const {
++        return !m_resultData.message.empty();
++    }
++
++    std::string capturedExpressionWithSecondArgument( char const * captur=
edExpression, char const * secondArg ) {
++        return (secondArg[0] =3D=3D 0 || secondArg[0] =3D=3D '"' && secon=
dArg[1] =3D=3D '"')
++            ? capturedExpression
++            : std::string(capturedExpression) + ", " + secondArg;
++    }
++
++    std::string AssertionResult::getExpression() const {
++        if( isFalseTest( m_info.resultDisposition ) )
++            return "!(" + capturedExpressionWithSecondArgument(m_info.cap=
turedExpression, m_info.secondArg) + ")";
++        else
++            return capturedExpressionWithSecondArgument(m_info.capturedEx=
pression, m_info.secondArg);
++    }
++    std::string AssertionResult::getExpressionInMacro() const {
++        if( m_info.macroName[0] =3D=3D 0 )
++            return capturedExpressionWithSecondArgument(m_info.capturedEx=
pression, m_info.secondArg);
++        else
++            return std::string(m_info.macroName) + "( " + capturedExpress=
ionWithSecondArgument(m_info.capturedExpression, m_info.secondArg) + " )";
++    }
++
++    bool AssertionResult::hasExpandedExpression() const {
++        return hasExpression() && getExpandedExpression() !=3D getExpress=
ion();
++    }
++
++    std::string AssertionResult::getExpandedExpression() const {
++        return m_resultData.reconstructExpression();
++    }
++
++    std::string AssertionResult::getMessage() const {
++        return m_resultData.message;
++    }
++    SourceLineInfo AssertionResult::getSourceInfo() const {
++        return m_info.lineInfo;
++    }
++
++    std::string AssertionResult::getTestMacroName() const {
++        return m_info.macroName;
++    }
++
++    void AssertionResult::discardDecomposedExpression() const {
++        m_resultData.decomposedExpression =3D CATCH_NULL;
++    }
++
++    void AssertionResult::expandDecomposedExpression() const {
++        m_resultData.reconstructExpression();
++    }
++
++} // end namespace Catch
++
++// #included from: catch_test_case_info.hpp
++#define TWOBLUECUBES_CATCH_TEST_CASE_INFO_HPP_INCLUDED
++
++#include <cctype>
++
++namespace Catch {
++
++    inline TestCaseInfo::SpecialProperties parseSpecialTag( std::string c=
onst& tag ) {
++        if( startsWith( tag, '.' ) ||
++            tag =3D=3D "hide" ||
++            tag =3D=3D "!hide" )
++            return TestCaseInfo::IsHidden;
++        else if( tag =3D=3D "!throws" )
++            return TestCaseInfo::Throws;
++        else if( tag =3D=3D "!shouldfail" )
++            return TestCaseInfo::ShouldFail;
++        else if( tag =3D=3D "!mayfail" )
++            return TestCaseInfo::MayFail;
++        else if( tag =3D=3D "!nonportable" )
++            return TestCaseInfo::NonPortable;
++        else
++            return TestCaseInfo::None;
++    }
++    inline bool isReservedTag( std::string const& tag ) {
++        return parseSpecialTag( tag ) =3D=3D TestCaseInfo::None && tag.si=
ze() > 0 && !std::isalnum( tag[0] );
++    }
++    inline void enforceNotReservedTag( std::string const& tag, SourceLine=
Info const& _lineInfo ) {
++        if( isReservedTag( tag ) ) {
++            std::ostringstream ss;
++            ss << Colour(Colour::Red)
++               << "Tag name [" << tag << "] not allowed.\n"
++               << "Tag names starting with non alpha-numeric characters a=
re reserved\n"
++               << Colour(Colour::FileName)
++               << _lineInfo << '\n';
++            throw std::runtime_error(ss.str());
++        }
++    }
++
++    TestCase makeTestCase(  ITestCase* _testCase,
++                            std::string const& _className,
++                            std::string const& _name,
++                            std::string const& _descOrTags,
++                            SourceLineInfo const& _lineInfo )
++    {
++        bool isHidden( startsWith( _name, "./" ) ); // Legacy support
++
++        // Parse out tags
++        std::set<std::string> tags;
++        std::string desc, tag;
++        bool inTag =3D false;
++        for( std::size_t i =3D 0; i < _descOrTags.size(); ++i ) {
++            char c =3D _descOrTags[i];
++            if( !inTag ) {
++                if( c =3D=3D '[' )
++                    inTag =3D true;
++                else
++                    desc +=3D c;
++            }
++            else {
++                if( c =3D=3D ']' ) {
++                    TestCaseInfo::SpecialProperties prop =3D parseSpecial=
Tag( tag );
++                    if( prop =3D=3D TestCaseInfo::IsHidden )
++                        isHidden =3D true;
++                    else if( prop =3D=3D TestCaseInfo::None )
++                        enforceNotReservedTag( tag, _lineInfo );
++
++                    tags.insert( tag );
++                    tag.clear();
++                    inTag =3D false;
++                }
++                else
++                    tag +=3D c;
++            }
++        }
++        if( isHidden ) {
++            tags.insert( "hide" );
++            tags.insert( "." );
++        }
++
++        TestCaseInfo info( _name, _className, desc, tags, _lineInfo );
++        return TestCase( _testCase, info );
++    }
++
++    void setTags( TestCaseInfo& testCaseInfo, std::set<std::string> const=
& tags )
++    {
++        testCaseInfo.tags =3D tags;
++        testCaseInfo.lcaseTags.clear();
++
++        std::ostringstream oss;
++        for( std::set<std::string>::const_iterator it =3D tags.begin(), i=
tEnd =3D tags.end(); it !=3D itEnd; ++it ) {
++            oss << '[' << *it << ']';
++            std::string lcaseTag =3D toLower( *it );
++            testCaseInfo.properties =3D static_cast<TestCaseInfo::Special=
Properties>( testCaseInfo.properties | parseSpecialTag( lcaseTag ) );
++            testCaseInfo.lcaseTags.insert( lcaseTag );
++        }
++        testCaseInfo.tagsAsString =3D oss.str();
++    }
++
++    TestCaseInfo::TestCaseInfo( std::string const& _name,
++                                std::string const& _className,
++                                std::string const& _description,
++                                std::set<std::string> const& _tags,
++                                SourceLineInfo const& _lineInfo )
++    :   name( _name ),
++        className( _className ),
++        description( _description ),
++        lineInfo( _lineInfo ),
++        properties( None )
++    {
++        setTags( *this, _tags );
++    }
++
++    TestCaseInfo::TestCaseInfo( TestCaseInfo const& other )
++    :   name( other.name ),
++        className( other.className ),
++        description( other.description ),
++        tags( other.tags ),
++        lcaseTags( other.lcaseTags ),
++        tagsAsString( other.tagsAsString ),
++        lineInfo( other.lineInfo ),
++        properties( other.properties )
++    {}
++
++    bool TestCaseInfo::isHidden() const {
++        return ( properties & IsHidden ) !=3D 0;
++    }
++    bool TestCaseInfo::throws() const {
++        return ( properties & Throws ) !=3D 0;
++    }
++    bool TestCaseInfo::okToFail() const {
++        return ( properties & (ShouldFail | MayFail ) ) !=3D 0;
++    }
++    bool TestCaseInfo::expectedToFail() const {
++        return ( properties & (ShouldFail ) ) !=3D 0;
++    }
++
++    TestCase::TestCase( ITestCase* testCase, TestCaseInfo const& info ) :=
 TestCaseInfo( info ), test( testCase ) {}
++
++    TestCase::TestCase( TestCase const& other )
++    :   TestCaseInfo( other ),
++        test( other.test )
++    {}
++
++    TestCase TestCase::withName( std::string const& _newName ) const {
++        TestCase other( *this );
++        other.name =3D _newName;
++        return other;
++    }
++
++    void TestCase::swap( TestCase& other ) {
++        test.swap( other.test );
++        name.swap( other.name );
++        className.swap( other.className );
++        description.swap( other.description );
++        tags.swap( other.tags );
++        lcaseTags.swap( other.lcaseTags );
++        tagsAsString.swap( other.tagsAsString );
++        std::swap( TestCaseInfo::properties, static_cast<TestCaseInfo&>( =
other ).properties );
++        std::swap( lineInfo, other.lineInfo );
++    }
++
++    void TestCase::invoke() const {
++        test->invoke();
++    }
++
++    bool TestCase::operator =3D=3D ( TestCase const& other ) const {
++        return  test.get() =3D=3D other.test.get() &&
++                name =3D=3D other.name &&
++                className =3D=3D other.className;
++    }
++
++    bool TestCase::operator < ( TestCase const& other ) const {
++        return name < other.name;
++    }
++    TestCase& TestCase::operator =3D ( TestCase const& other ) {
++        TestCase temp( other );
++        swap( temp );
++        return *this;
++    }
++
++    TestCaseInfo const& TestCase::getTestCaseInfo() const
++    {
++        return *this;
++    }
++
++} // end namespace Catch
++
++// #included from: catch_version.hpp
++#define TWOBLUECUBES_CATCH_VERSION_HPP_INCLUDED
++
++namespace Catch {
++
++    Version::Version
++        (   unsigned int _majorVersion,
++            unsigned int _minorVersion,
++            unsigned int _patchNumber,
++            char const * const _branchName,
++            unsigned int _buildNumber )
++    :   majorVersion( _majorVersion ),
++        minorVersion( _minorVersion ),
++        patchNumber( _patchNumber ),
++        branchName( _branchName ),
++        buildNumber( _buildNumber )
++    {}
++
++    std::ostream& operator << ( std::ostream& os, Version const& version =
) {
++        os  << version.majorVersion << '.'
++            << version.minorVersion << '.'
++            << version.patchNumber;
++        // branchName is never null -> 0th char is \0 if it is empty
++        if (version.branchName[0]) {
++            os << '-' << version.branchName
++               << '.' << version.buildNumber;
++        }
++        return os;
++    }
++
++    inline Version libraryVersion() {
++        static Version version( 1, 12, 2, "", 0 );
++        return version;
++    }
++
++}
++
++// #included from: catch_message.hpp
++#define TWOBLUECUBES_CATCH_MESSAGE_HPP_INCLUDED
++
++namespace Catch {
++
++    MessageInfo::MessageInfo(   std::string const& _macroName,
++                                SourceLineInfo const& _lineInfo,
++                                ResultWas::OfType _type )
++    :   macroName( _macroName ),
++        lineInfo( _lineInfo ),
++        type( _type ),
++        sequence( ++globalCount )
++    {}
++
++    // This may need protecting if threading support is added
++    unsigned int MessageInfo::globalCount =3D 0;
++
++    /////////////////////////////////////////////////////////////////////=
///////
++
++    ScopedMessage::ScopedMessage( MessageBuilder const& builder )
++    : m_info( builder.m_info )
++    {
++        m_info.message =3D builder.m_stream.str();
++        getResultCapture().pushScopedMessage( m_info );
++    }
++    ScopedMessage::ScopedMessage( ScopedMessage const& other )
++    : m_info( other.m_info )
++    {}
++
++#if defined(_MSC_VER)
++#pragma warning(push)
++#pragma warning(disable:4996) // std::uncaught_exception is deprecated in=
 C++17
++#endif
++    ScopedMessage::~ScopedMessage() {
++        if ( !std::uncaught_exception() ){
++            getResultCapture().popScopedMessage(m_info);
++        }
++    }
++#if defined(_MSC_VER)
++#pragma warning(pop)
++#endif
++
++} // end namespace Catch
++
++// #included from: catch_legacy_reporter_adapter.hpp
++#define TWOBLUECUBES_CATCH_LEGACY_REPORTER_ADAPTER_HPP_INCLUDED
++
++// #included from: catch_legacy_reporter_adapter.h
++#define TWOBLUECUBES_CATCH_LEGACY_REPORTER_ADAPTER_H_INCLUDED
++
++namespace Catch
++{
++    // Deprecated
++    struct IReporter : IShared {
++        virtual ~IReporter();
++
++        virtual bool shouldRedirectStdout() const =3D 0;
++
++        virtual void StartTesting() =3D 0;
++        virtual void EndTesting( Totals const& totals ) =3D 0;
++        virtual void StartGroup( std::string const& groupName ) =3D 0;
++        virtual void EndGroup( std::string const& groupName, Totals const=
& totals ) =3D 0;
++        virtual void StartTestCase( TestCaseInfo const& testInfo ) =3D 0;
++        virtual void EndTestCase( TestCaseInfo const& testInfo, Totals co=
nst& totals, std::string const& stdOut, std::string const& stdErr ) =3D 0;
++        virtual void StartSection( std::string const& sectionName, std::s=
tring const& description ) =3D 0;
++        virtual void EndSection( std::string const& sectionName, Counts c=
onst& assertions ) =3D 0;
++        virtual void NoAssertionsInSection( std::string const& sectionNam=
e ) =3D 0;
++        virtual void NoAssertionsInTestCase( std::string const& testName =
) =3D 0;
++        virtual void Aborted() =3D 0;
++        virtual void Result( AssertionResult const& result ) =3D 0;
++    };
++
++    class LegacyReporterAdapter : public SharedImpl<IStreamingReporter>
++    {
++    public:
++        LegacyReporterAdapter( Ptr<IReporter> const& legacyReporter );
++        virtual ~LegacyReporterAdapter();
++
++        virtual ReporterPreferences getPreferences() const;
++        virtual void noMatchingTestCases( std::string const& );
++        virtual void testRunStarting( TestRunInfo const& );
++        virtual void testGroupStarting( GroupInfo const& groupInfo );
++        virtual void testCaseStarting( TestCaseInfo const& testInfo );
++        virtual void sectionStarting( SectionInfo const& sectionInfo );
++        virtual void assertionStarting( AssertionInfo const& );
++        virtual bool assertionEnded( AssertionStats const& assertionStats=
 );
++        virtual void sectionEnded( SectionStats const& sectionStats );
++        virtual void testCaseEnded( TestCaseStats const& testCaseStats );
++        virtual void testGroupEnded( TestGroupStats const& testGroupStats=
 );
++        virtual void testRunEnded( TestRunStats const& testRunStats );
++        virtual void skipTest( TestCaseInfo const& );
++
++    private:
++        Ptr<IReporter> m_legacyReporter;
++    };
++}
++
++namespace Catch
++{
++    LegacyReporterAdapter::LegacyReporterAdapter( Ptr<IReporter> const& l=
egacyReporter )
++    :   m_legacyReporter( legacyReporter )
++    {}
++    LegacyReporterAdapter::~LegacyReporterAdapter() {}
++
++    ReporterPreferences LegacyReporterAdapter::getPreferences() const {
++        ReporterPreferences prefs;
++        prefs.shouldRedirectStdOut =3D m_legacyReporter->shouldRedirectSt=
dout();
++        return prefs;
++    }
++
++    void LegacyReporterAdapter::noMatchingTestCases( std::string const& )=
 {}
++    void LegacyReporterAdapter::testRunStarting( TestRunInfo const& ) {
++        m_legacyReporter->StartTesting();
++    }
++    void LegacyReporterAdapter::testGroupStarting( GroupInfo const& group=
Info ) {
++        m_legacyReporter->StartGroup( groupInfo.name );
++    }
++    void LegacyReporterAdapter::testCaseStarting( TestCaseInfo const& tes=
tInfo ) {
++        m_legacyReporter->StartTestCase( testInfo );
++    }
++    void LegacyReporterAdapter::sectionStarting( SectionInfo const& secti=
onInfo ) {
++        m_legacyReporter->StartSection( sectionInfo.name, sectionInfo.des=
cription );
++    }
++    void LegacyReporterAdapter::assertionStarting( AssertionInfo const& )=
 {
++        // Not on legacy interface
++    }
++
++    bool LegacyReporterAdapter::assertionEnded( AssertionStats const& ass=
ertionStats ) {
++        if( assertionStats.assertionResult.getResultType() !=3D ResultWas=
::Ok ) {
++            for( std::vector<MessageInfo>::const_iterator it =3D assertio=
nStats.infoMessages.begin(), itEnd =3D assertionStats.infoMessages.end();
++                    it !=3D itEnd;
++                    ++it ) {
++                if( it->type =3D=3D ResultWas::Info ) {
++                    ResultBuilder rb( it->macroName.c_str(), it->lineInfo=
, "", ResultDisposition::Normal );
++                    rb << it->message;
++                    rb.setResultType( ResultWas::Info );
++                    AssertionResult result =3D rb.build();
++                    m_legacyReporter->Result( result );
++                }
++            }
++        }
++        m_legacyReporter->Result( assertionStats.assertionResult );
++        return true;
++    }
++    void LegacyReporterAdapter::sectionEnded( SectionStats const& section=
Stats ) {
++        if( sectionStats.missingAssertions )
++            m_legacyReporter->NoAssertionsInSection( sectionStats.section=
Info.name );
++        m_legacyReporter->EndSection( sectionStats.sectionInfo.name, sect=
ionStats.assertions );
++    }
++    void LegacyReporterAdapter::testCaseEnded( TestCaseStats const& testC=
aseStats ) {
++        m_legacyReporter->EndTestCase
++            (   testCaseStats.testInfo,
++                testCaseStats.totals,
++                testCaseStats.stdOut,
++                testCaseStats.stdErr );
++    }
++    void LegacyReporterAdapter::testGroupEnded( TestGroupStats const& tes=
tGroupStats ) {
++        if( testGroupStats.aborting )
++            m_legacyReporter->Aborted();
++        m_legacyReporter->EndGroup( testGroupStats.groupInfo.name, testGr=
oupStats.totals );
++    }
++    void LegacyReporterAdapter::testRunEnded( TestRunStats const& testRun=
Stats ) {
++        m_legacyReporter->EndTesting( testRunStats.totals );
++    }
++    void LegacyReporterAdapter::skipTest( TestCaseInfo const& ) {
++    }
++}
++
++// #included from: catch_timer.hpp
++
++#ifdef __clang__
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wc++11-long-long"
++#endif
++
++#ifdef CATCH_PLATFORM_WINDOWS
++
++#else
++
++#include <sys/time.h>
++
++#endif
++
++namespace Catch {
++
++    namespace {
++#ifdef CATCH_PLATFORM_WINDOWS
++        UInt64 getCurrentTicks() {
++            static UInt64 hz=3D0, hzo=3D0;
++            if (!hz) {
++                QueryPerformanceFrequency( reinterpret_cast<LARGE_INTEGER=
*>( &hz ) );
++                QueryPerformanceCounter( reinterpret_cast<LARGE_INTEGER*>=
( &hzo ) );
++            }
++            UInt64 t;
++            QueryPerformanceCounter( reinterpret_cast<LARGE_INTEGER*>( &t=
 ) );
++            return ((t-hzo)*1000000)/hz;
++        }
++#else
++        UInt64 getCurrentTicks() {
++            timeval t;
++            gettimeofday(&t,CATCH_NULL);
++            return static_cast<UInt64>( t.tv_sec ) * 1000000ull + static_=
cast<UInt64>( t.tv_usec );
++        }
++#endif
++    }
++
++    void Timer::start() {
++        m_ticks =3D getCurrentTicks();
++    }
++    unsigned int Timer::getElapsedMicroseconds() const {
++        return static_cast<unsigned int>(getCurrentTicks() - m_ticks);
++    }
++    unsigned int Timer::getElapsedMilliseconds() const {
++        return static_cast<unsigned int>(getElapsedMicroseconds()/1000);
++    }
++    double Timer::getElapsedSeconds() const {
++        return getElapsedMicroseconds()/1000000.0;
++    }
++
++} // namespace Catch
++
++#ifdef __clang__
++#pragma clang diagnostic pop
++#endif
++// #included from: catch_common.hpp
++#define TWOBLUECUBES_CATCH_COMMON_HPP_INCLUDED
++
++#include <cstring>
++#include <cctype>
++
++namespace Catch {
++
++    bool startsWith( std::string const& s, std::string const& prefix ) {
++        return s.size() >=3D prefix.size() && std::equal(prefix.begin(), =
prefix.end(), s.begin());
++    }
++    bool startsWith( std::string const& s, char prefix ) {
++        return !s.empty() && s[0] =3D=3D prefix;
++    }
++    bool endsWith( std::string const& s, std::string const& suffix ) {
++        return s.size() >=3D suffix.size() && std::equal(suffix.rbegin(),=
 suffix.rend(), s.rbegin());
++    }
++    bool endsWith( std::string const& s, char suffix ) {
++        return !s.empty() && s[s.size()-1] =3D=3D suffix;
++    }
++    bool contains( std::string const& s, std::string const& infix ) {
++        return s.find( infix ) !=3D std::string::npos;
++    }
++    char toLowerCh(char c) {
++        return static_cast<char>( std::tolower( c ) );
++    }
++    void toLowerInPlace( std::string& s ) {
++        std::transform( s.begin(), s.end(), s.begin(), toLowerCh );
++    }
++    std::string toLower( std::string const& s ) {
++        std::string lc =3D s;
++        toLowerInPlace( lc );
++        return lc;
++    }
++    std::string trim( std::string const& str ) {
++        static char const* whitespaceChars =3D "\n\r\t ";
++        std::string::size_type start =3D str.find_first_not_of( whitespac=
eChars );
++        std::string::size_type end =3D str.find_last_not_of( whitespaceCh=
ars );
++
++        return start !=3D std::string::npos ? str.substr( start, 1+end-st=
art ) : std::string();
++    }
++
++    bool replaceInPlace( std::string& str, std::string const& replaceThis=
, std::string const& withThis ) {
++        bool replaced =3D false;
++        std::size_t i =3D str.find( replaceThis );
++        while( i !=3D std::string::npos ) {
++            replaced =3D true;
++            str =3D str.substr( 0, i ) + withThis + str.substr( i+replace=
This.size() );
++            if( i < str.size()-withThis.size() )
++                i =3D str.find( replaceThis, i+withThis.size() );
++            else
++                i =3D std::string::npos;
++        }
++        return replaced;
++    }
++
++    pluralise::pluralise( std::size_t count, std::string const& label )
++    :   m_count( count ),
++        m_label( label )
++    {}
++
++    std::ostream& operator << ( std::ostream& os, pluralise const& plural=
iser ) {
++        os << pluraliser.m_count << ' ' << pluraliser.m_label;
++        if( pluraliser.m_count !=3D 1 )
++            os << 's';
++        return os;
++    }
++
++    SourceLineInfo::SourceLineInfo() : file(""), line( 0 ){}
++    SourceLineInfo::SourceLineInfo( char const* _file, std::size_t _line )
++    :   file( _file ),
++        line( _line )
++    {}
++    bool SourceLineInfo::empty() const {
++        return file[0] =3D=3D '\0';
++    }
++    bool SourceLineInfo::operator =3D=3D ( SourceLineInfo const& other ) =
const {
++        return line =3D=3D other.line && (file =3D=3D other.file || std::=
strcmp(file, other.file) =3D=3D 0);
++    }
++    bool SourceLineInfo::operator < ( SourceLineInfo const& other ) const=
 {
++        return line < other.line || ( line =3D=3D other.line && (std::str=
cmp(file, other.file) < 0));
++    }
++
++    void seedRng( IConfig const& config ) {
++        if( config.rngSeed() !=3D 0 )
++            std::srand( config.rngSeed() );
++    }
++    unsigned int rngSeed() {
++        return getCurrentContext().getConfig()->rngSeed();
++    }
++
++    std::ostream& operator << ( std::ostream& os, SourceLineInfo const& i=
nfo ) {
++#ifndef __GNUG__
++        os << info.file << '(' << info.line << ')';
++#else
++        os << info.file << ':' << info.line;
++#endif
++        return os;
++    }
++
++    void throwLogicError( std::string const& message, SourceLineInfo cons=
t& locationInfo ) {
++        std::ostringstream oss;
++        oss << locationInfo << ": Internal Catch error: '" << message << =
'\'';
++        if( alwaysTrue() )
++            throw std::logic_error( oss.str() );
++    }
++}
++
++// #included from: catch_section.hpp
++#define TWOBLUECUBES_CATCH_SECTION_HPP_INCLUDED
++
++namespace Catch {
++
++    SectionInfo::SectionInfo
++        (   SourceLineInfo const& _lineInfo,
++            std::string const& _name,
++            std::string const& _description )
++    :   name( _name ),
++        description( _description ),
++        lineInfo( _lineInfo )
++    {}
++
++    Section::Section( SectionInfo const& info )
++    :   m_info( info ),
++        m_sectionIncluded( getResultCapture().sectionStarted( m_info, m_a=
ssertions ) )
++    {
++        m_timer.start();
++    }
++
++#if defined(_MSC_VER)
++#pragma warning(push)
++#pragma warning(disable:4996) // std::uncaught_exception is deprecated in=
 C++17
++#endif
++    Section::~Section() {
++        if( m_sectionIncluded ) {
++            SectionEndInfo endInfo( m_info, m_assertions, m_timer.getElap=
sedSeconds() );
++            if( std::uncaught_exception() )
++                getResultCapture().sectionEndedEarly( endInfo );
++            else
++                getResultCapture().sectionEnded( endInfo );
++        }
++    }
++#if defined(_MSC_VER)
++#pragma warning(pop)
++#endif
++
++    // This indicates whether the section should be executed or not
++    Section::operator bool() const {
++        return m_sectionIncluded;
++    }
++
++} // end namespace Catch
++
++// #included from: catch_debugger.hpp
++#define TWOBLUECUBES_CATCH_DEBUGGER_HPP_INCLUDED
++
++#ifdef CATCH_PLATFORM_MAC
++
++    #include <assert.h>
++    #include <stdbool.h>
++    #include <sys/types.h>
++    #include <unistd.h>
++    #include <sys/sysctl.h>
++
++    namespace Catch{
++
++        // The following function is taken directly from the following te=
chnical note:
++        // http://developer.apple.com/library/mac/#qa/qa2004/qa1361.html
++
++        // Returns true if the current process is being debugged (either
++        // running under the debugger or has a debugger attached post fac=
to).
++        bool isDebuggerActive(){
++
++            int                 mib[4];
++            struct kinfo_proc   info;
++            size_t              size;
++
++            // Initialize the flags so that, if sysctl fails for some biz=
arre
++            // reason, we get a predictable result.
++
++            info.kp_proc.p_flag =3D 0;
++
++            // Initialize mib, which tells sysctl the info we want, in th=
is case
++            // we're looking for information about a specific process ID.
++
++            mib[0] =3D CTL_KERN;
++            mib[1] =3D KERN_PROC;
++            mib[2] =3D KERN_PROC_PID;
++            mib[3] =3D getpid();
++
++            // Call sysctl.
++
++            size =3D sizeof(info);
++            if( sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, CAT=
CH_NULL, 0) !=3D 0 ) {
++                Catch::cerr() << "\n** Call to sysctl failed - unable to =
determine if debugger is active **\n" << std::endl;
++                return false;
++            }
++
++            // We're being debugged if the P_TRACED flag is set.
++
++            return ( (info.kp_proc.p_flag & P_TRACED) !=3D 0 );
++        }
++    } // namespace Catch
++
++#elif defined(CATCH_PLATFORM_LINUX)
++    #include <fstream>
++    #include <string>
++
++    namespace Catch{
++        // The standard POSIX way of detecting a debugger is to attempt to
++        // ptrace() the process, but this needs to be done from a child a=
nd not
++        // this process itself to still allow attaching to this process l=
ater
++        // if wanted, so is rather heavy. Under Linux we have the PID of =
the
++        // "debugger" (which doesn't need to be gdb, of course, it could =
also
++        // be strace, for example) in /proc/$PID/status, so just get it f=
rom
++        // there instead.
++        bool isDebuggerActive(){
++            // Libstdc++ has a bug, where std::ifstream sets errno to 0
++            // This way our users can properly assert over errno values
++            ErrnoGuard guard;
++            std::ifstream in("/proc/self/status");
++            for( std::string line; std::getline(in, line); ) {
++                static const int PREFIX_LEN =3D 11;
++                if( line.compare(0, PREFIX_LEN, "TracerPid:\t") =3D=3D 0 =
) {
++                    // We're traced if the PID is not 0 and no other PID =
starts
++                    // with 0 digit, so it's enough to check for just a s=
ingle
++                    // character.
++                    return line.length() > PREFIX_LEN && line[PREFIX_LEN]=
 !=3D '0';
++                }
++            }
++
++            return false;
++        }
++    } // namespace Catch
++#elif defined(_MSC_VER)
++    extern "C" __declspec(dllimport) int __stdcall IsDebuggerPresent();
++    namespace Catch {
++        bool isDebuggerActive() {
++            return IsDebuggerPresent() !=3D 0;
++        }
++    }
++#elif defined(__MINGW32__)
++    extern "C" __declspec(dllimport) int __stdcall IsDebuggerPresent();
++    namespace Catch {
++        bool isDebuggerActive() {
++            return IsDebuggerPresent() !=3D 0;
++        }
++    }
++#else
++    namespace Catch {
++       inline bool isDebuggerActive() { return false; }
++    }
++#endif // Platform
++
++#ifdef CATCH_PLATFORM_WINDOWS
++
++    namespace Catch {
++        void writeToDebugConsole( std::string const& text ) {
++            ::OutputDebugStringA( text.c_str() );
++        }
++    }
++#else
++    namespace Catch {
++        void writeToDebugConsole( std::string const& text ) {
++            // !TBD: Need a version for Mac/ XCode and other IDEs
++            Catch::cout() << text;
++        }
++    }
++#endif // Platform
++
++// #included from: catch_tostring.hpp
++#define TWOBLUECUBES_CATCH_TOSTRING_HPP_INCLUDED
++
++namespace Catch {
++
++namespace Detail {
++
++    const std::string unprintableString =3D "{?}";
++
++    namespace {
++        const int hexThreshold =3D 255;
++
++        struct Endianness {
++            enum Arch { Big, Little };
++
++            static Arch which() {
++                union _{
++                    int asInt;
++                    char asChar[sizeof (int)];
++                } u;
++
++                u.asInt =3D 1;
++                return ( u.asChar[sizeof(int)-1] =3D=3D 1 ) ? Big : Littl=
e;
++            }
++        };
++    }
++
++    std::string rawMemoryToString( const void *object, std::size_t size )
++    {
++        // Reverse order for little endian architectures
++        int i =3D 0, end =3D static_cast<int>( size ), inc =3D 1;
++        if( Endianness::which() =3D=3D Endianness::Little ) {
++            i =3D end-1;
++            end =3D inc =3D -1;
++        }
++
++        unsigned char const *bytes =3D static_cast<unsigned char const *>=
(object);
++        std::ostringstream os;
++        os << "0x" << std::setfill('0') << std::hex;
++        for( ; i !=3D end; i +=3D inc )
++             os << std::setw(2) << static_cast<unsigned>(bytes[i]);
++       return os.str();
++    }
++}
++
++std::string toString( std::string const& value ) {
++    std::string s =3D value;
++    if( getCurrentContext().getConfig()->showInvisibles() ) {
++        for(size_t i =3D 0; i < s.size(); ++i ) {
++            std::string subs;
++            switch( s[i] ) {
++            case '\n': subs =3D "\\n"; break;
++            case '\t': subs =3D "\\t"; break;
++            default: break;
++            }
++            if( !subs.empty() ) {
++                s =3D s.substr( 0, i ) + subs + s.substr( i+1 );
++                ++i;
++            }
++        }
++    }
++    return '"' + s + '"';
++}
++std::string toString( std::wstring const& value ) {
++
++    std::string s;
++    s.reserve( value.size() );
++    for(size_t i =3D 0; i < value.size(); ++i )
++        s +=3D value[i] <=3D 0xff ? static_cast<char>( value[i] ) : '?';
++    return Catch::toString( s );
++}
++
++std::string toString( const char* const value ) {
++    return value ? Catch::toString( std::string( value ) ) : std::string(=
 "{null string}" );
++}
++
++std::string toString( char* const value ) {
++    return Catch::toString( static_cast<const char*>( value ) );
++}
++
++std::string toString( const wchar_t* const value )
++{
++    return value ? Catch::toString( std::wstring(value) ) : std::string( =
"{null string}" );
++}
++
++std::string toString( wchar_t* const value )
++{
++    return Catch::toString( static_cast<const wchar_t*>( value ) );
++}
++
++std::string toString( int value ) {
++    std::ostringstream oss;
++    oss << value;
++    if( value > Detail::hexThreshold )
++        oss << " (0x" << std::hex << value << ')';
++    return oss.str();
++}
++
++std::string toString( unsigned long value ) {
++    std::ostringstream oss;
++    oss << value;
++    if( value > Detail::hexThreshold )
++        oss << " (0x" << std::hex << value << ')';
++    return oss.str();
++}
++
++std::string toString( unsigned int value ) {
++    return Catch::toString( static_cast<unsigned long>( value ) );
++}
++
++template<typename T>
++std::string fpToString( T value, int precision ) {
++    std::ostringstream oss;
++    oss << std::setprecision( precision )
++        << std::fixed
++        << value;
++    std::string d =3D oss.str();
++    std::size_t i =3D d.find_last_not_of( '0' );
++    if( i !=3D std::string::npos && i !=3D d.size()-1 ) {
++        if( d[i] =3D=3D '.' )
++            i++;
++        d =3D d.substr( 0, i+1 );
++    }
++    return d;
++}
++
++std::string toString( const double value ) {
++    return fpToString( value, 10 );
++}
++std::string toString( const float value ) {
++    return fpToString( value, 5 ) + 'f';
++}
++
++std::string toString( bool value ) {
++    return value ? "true" : "false";
++}
++
++std::string toString( char value ) {
++    if ( value =3D=3D '\r' )
++        return "'\\r'";
++    if ( value =3D=3D '\f' )
++        return "'\\f'";
++    if ( value =3D=3D '\n' )
++        return "'\\n'";
++    if ( value =3D=3D '\t' )
++        return "'\\t'";
++    if ( '\0' <=3D value && value < ' ' )
++        return toString( static_cast<unsigned int>( value ) );
++    char chstr[] =3D "' '";
++    chstr[1] =3D value;
++    return chstr;
++}
++
++std::string toString( signed char value ) {
++    return toString( static_cast<char>( value ) );
++}
++
++std::string toString( unsigned char value ) {
++    return toString( static_cast<char>( value ) );
++}
++
++#ifdef CATCH_CONFIG_CPP11_LONG_LONG
++std::string toString( long long value ) {
++    std::ostringstream oss;
++    oss << value;
++    if( value > Detail::hexThreshold )
++        oss << " (0x" << std::hex << value << ')';
++    return oss.str();
++}
++std::string toString( unsigned long long value ) {
++    std::ostringstream oss;
++    oss << value;
++    if( value > Detail::hexThreshold )
++        oss << " (0x" << std::hex << value << ')';
++    return oss.str();
++}
++#endif
++
++#ifdef CATCH_CONFIG_CPP11_NULLPTR
++std::string toString( std::nullptr_t ) {
++    return "nullptr";
++}
++#endif
++
++#ifdef __OBJC__
++    std::string toString( NSString const * const& nsstring ) {
++        if( !nsstring )
++            return "nil";
++        return "@" + toString([nsstring UTF8String]);
++    }
++    std::string toString( NSString * CATCH_ARC_STRONG & nsstring ) {
++        if( !nsstring )
++            return "nil";
++        return "@" + toString([nsstring UTF8String]);
++    }
++    std::string toString( NSObject* const& nsObject ) {
++        return toString( [nsObject description] );
++    }
++#endif
++
++} // end namespace Catch
++
++// #included from: catch_result_builder.hpp
++#define TWOBLUECUBES_CATCH_RESULT_BUILDER_HPP_INCLUDED
++
++#include <cassert>
++
++namespace Catch {
++
++    ResultBuilder::ResultBuilder(   char const* macroName,
++                                    SourceLineInfo const& lineInfo,
++                                    char const* capturedExpression,
++                                    ResultDisposition::Flags resultDispos=
ition,
++                                    char const* secondArg )
++    :   m_assertionInfo( macroName, lineInfo, capturedExpression, resultD=
isposition, secondArg ),
++        m_shouldDebugBreak( false ),
++        m_shouldThrow( false ),
++        m_guardException( false ),
++        m_usedStream( false )
++    {}
++
++    ResultBuilder::~ResultBuilder() {
++#if defined(CATCH_CONFIG_FAST_COMPILE)
++        if ( m_guardException ) {
++            stream().oss << "Exception translation was disabled by CATCH_=
CONFIG_FAST_COMPILE";
++            captureResult( ResultWas::ThrewException );
++            getCurrentContext().getResultCapture()->exceptionEarlyReporte=
d();
++        }
++#endif
++    }
++
++    ResultBuilder& ResultBuilder::setResultType( ResultWas::OfType result=
 ) {
++        m_data.resultType =3D result;
++        return *this;
++    }
++    ResultBuilder& ResultBuilder::setResultType( bool result ) {
++        m_data.resultType =3D result ? ResultWas::Ok : ResultWas::Express=
ionFailed;
++        return *this;
++    }
++
++    void ResultBuilder::endExpression( DecomposedExpression const& expr )=
 {
++        // Flip bool results if FalseTest flag is set
++        if( isFalseTest( m_assertionInfo.resultDisposition ) ) {
++            m_data.negate( expr.isBinaryExpression() );
++        }
++
++        getResultCapture().assertionRun();
++
++        if(getCurrentContext().getConfig()->includeSuccessfulResults() ||=
 m_data.resultType !=3D ResultWas::Ok)
++        {
++            AssertionResult result =3D build( expr );
++            handleResult( result );
++        }
++        else
++            getResultCapture().assertionPassed();
++    }
++
++    void ResultBuilder::useActiveException( ResultDisposition::Flags resu=
ltDisposition ) {
++        m_assertionInfo.resultDisposition =3D resultDisposition;
++        stream().oss << Catch::translateActiveException();
++        captureResult( ResultWas::ThrewException );
++    }
++
++    void ResultBuilder::captureResult( ResultWas::OfType resultType ) {
++        setResultType( resultType );
++        captureExpression();
++    }
++
++    void ResultBuilder::captureExpectedException( std::string const& expe=
ctedMessage ) {
++        if( expectedMessage.empty() )
++            captureExpectedException( Matchers::Impl::MatchAllOf<std::str=
ing>() );
++        else
++            captureExpectedException( Matchers::Equals( expectedMessage )=
 );
++    }
++
++    void ResultBuilder::captureExpectedException( Matchers::Impl::Matcher=
Base<std::string> const& matcher ) {
++
++        assert( !isFalseTest( m_assertionInfo.resultDisposition ) );
++        AssertionResultData data =3D m_data;
++        data.resultType =3D ResultWas::Ok;
++        data.reconstructedExpression =3D capturedExpressionWithSecondArgu=
ment(m_assertionInfo.capturedExpression, m_assertionInfo.secondArg);
++
++        std::string actualMessage =3D Catch::translateActiveException();
++        if( !matcher.match( actualMessage ) ) {
++            data.resultType =3D ResultWas::ExpressionFailed;
++            data.reconstructedExpression =3D actualMessage;
++        }
++        AssertionResult result( m_assertionInfo, data );
++        handleResult( result );
++    }
++
++    void ResultBuilder::captureExpression() {
++        AssertionResult result =3D build();
++        handleResult( result );
++    }
++
++    void ResultBuilder::handleResult( AssertionResult const& result )
++    {
++        getResultCapture().assertionEnded( result );
++
++        if( !result.isOk() ) {
++            if( getCurrentContext().getConfig()->shouldDebugBreak() )
++                m_shouldDebugBreak =3D true;
++            if( getCurrentContext().getRunner()->aborting() || (m_asserti=
onInfo.resultDisposition & ResultDisposition::Normal) )
++                m_shouldThrow =3D true;
++        }
++    }
++
++    void ResultBuilder::react() {
++#if defined(CATCH_CONFIG_FAST_COMPILE)
++        if (m_shouldDebugBreak) {
++            /////////////////////////////////////////////////////////////=
//////
++            // To inspect the state during test, you need to go one level=
 up the callstack
++            // To go back to the test and change execution, jump over the=
 throw statement
++            /////////////////////////////////////////////////////////////=
//////
++            CATCH_BREAK_INTO_DEBUGGER();
++        }
++#endif
++        if( m_shouldThrow )
++            throw Catch::TestFailureException();
++    }
++
++    bool ResultBuilder::shouldDebugBreak() const { return m_shouldDebugBr=
eak; }
++    bool ResultBuilder::allowThrows() const { return getCurrentContext().=
getConfig()->allowThrows(); }
++
++    AssertionResult ResultBuilder::build() const
++    {
++        return build( *this );
++    }
++
++    // CAVEAT: The returned AssertionResult stores a pointer to the argum=
ent expr,
++    //         a temporary DecomposedExpression, which in turn holds refe=
rences to
++    //         operands, possibly temporary as well.
++    //         It should immediately be passed to handleResult; if the ex=
pression
++    //         needs to be reported, its string expansion must be compose=
d before
++    //         the temporaries are destroyed.
++    AssertionResult ResultBuilder::build( DecomposedExpression const& exp=
r ) const
++    {
++        assert( m_data.resultType !=3D ResultWas::Unknown );
++        AssertionResultData data =3D m_data;
++
++        if(m_usedStream)
++            data.message =3D m_stream().oss.str();
++        data.decomposedExpression =3D &expr; // for lazy reconstruction
++        return AssertionResult( m_assertionInfo, data );
++    }
++
++    void ResultBuilder::reconstructExpression( std::string& dest ) const {
++        dest =3D capturedExpressionWithSecondArgument(m_assertionInfo.cap=
turedExpression, m_assertionInfo.secondArg);
++    }
++
++    void ResultBuilder::setExceptionGuard() {
++        m_guardException =3D true;
++    }
++    void ResultBuilder::unsetExceptionGuard() {
++        m_guardException =3D false;
++    }
++
++} // end namespace Catch
++
++// #included from: catch_tag_alias_registry.hpp
++#define TWOBLUECUBES_CATCH_TAG_ALIAS_REGISTRY_HPP_INCLUDED
++
++namespace Catch {
++
++    TagAliasRegistry::~TagAliasRegistry() {}
++
++    Option<TagAlias> TagAliasRegistry::find( std::string const& alias ) c=
onst {
++        std::map<std::string, TagAlias>::const_iterator it =3D m_registry=
.find( alias );
++        if( it !=3D m_registry.end() )
++            return it->second;
++        else
++            return Option<TagAlias>();
++    }
++
++    std::string TagAliasRegistry::expandAliases( std::string const& unexp=
andedTestSpec ) const {
++        std::string expandedTestSpec =3D unexpandedTestSpec;
++        for( std::map<std::string, TagAlias>::const_iterator it =3D m_reg=
istry.begin(), itEnd =3D m_registry.end();
++                it !=3D itEnd;
++                ++it ) {
++            std::size_t pos =3D expandedTestSpec.find( it->first );
++            if( pos !=3D std::string::npos ) {
++                expandedTestSpec =3D  expandedTestSpec.substr( 0, pos ) +
++                                    it->second.tag +
++                                    expandedTestSpec.substr( pos + it->fi=
rst.size() );
++            }
++        }
++        return expandedTestSpec;
++    }
++
++    void TagAliasRegistry::add( std::string const& alias, std::string con=
st& tag, SourceLineInfo const& lineInfo ) {
++
++        if( !startsWith( alias, "[@" ) || !endsWith( alias, ']' ) ) {
++            std::ostringstream oss;
++            oss << Colour( Colour::Red )
++                << "error: tag alias, \"" << alias << "\" is not of the f=
orm [@alias name].\n"
++                << Colour( Colour::FileName )
++                << lineInfo << '\n';
++            throw std::domain_error( oss.str().c_str() );
++        }
++        if( !m_registry.insert( std::make_pair( alias, TagAlias( tag, lin=
eInfo ) ) ).second ) {
++            std::ostringstream oss;
++            oss << Colour( Colour::Red )
++                << "error: tag alias, \"" << alias << "\" already registe=
red.\n"
++                << "\tFirst seen at "
++                << Colour( Colour::Red ) << find(alias)->lineInfo << '\n'
++                << Colour( Colour::Red ) << "\tRedefined at "
++                << Colour( Colour::FileName) << lineInfo << '\n';
++            throw std::domain_error( oss.str().c_str() );
++        }
++    }
++
++    ITagAliasRegistry::~ITagAliasRegistry() {}
++
++    ITagAliasRegistry const& ITagAliasRegistry::get() {
++        return getRegistryHub().getTagAliasRegistry();
++    }
++
++    RegistrarForTagAliases::RegistrarForTagAliases( char const* alias, ch=
ar const* tag, SourceLineInfo const& lineInfo ) {
++        getMutableRegistryHub().registerTagAlias( alias, tag, lineInfo );
++    }
++
++} // end namespace Catch
++
++// #included from: catch_matchers_string.hpp
++
++namespace Catch {
++namespace Matchers {
++
++    namespace StdString {
++
++        CasedString::CasedString( std::string const& str, CaseSensitive::=
Choice caseSensitivity )
++        :   m_caseSensitivity( caseSensitivity ),
++            m_str( adjustString( str ) )
++        {}
++        std::string CasedString::adjustString( std::string const& str ) c=
onst {
++            return m_caseSensitivity =3D=3D CaseSensitive::No
++                   ? toLower( str )
++                   : str;
++        }
++        std::string CasedString::caseSensitivitySuffix() const {
++            return m_caseSensitivity =3D=3D CaseSensitive::No
++                   ? " (case insensitive)"
++                   : std::string();
++        }
++
++        StringMatcherBase::StringMatcherBase( std::string const& operatio=
n, CasedString const& comparator )
++        : m_comparator( comparator ),
++          m_operation( operation ) {
++        }
++
++        std::string StringMatcherBase::describe() const {
++            std::string description;
++            description.reserve(5 + m_operation.size() + m_comparator.m_s=
tr.size() +
++                                        m_comparator.caseSensitivitySuffi=
x().size());
++            description +=3D m_operation;
++            description +=3D ": \"";
++            description +=3D m_comparator.m_str;
++            description +=3D "\"";
++            description +=3D m_comparator.caseSensitivitySuffix();
++            return description;
++        }
++
++        EqualsMatcher::EqualsMatcher( CasedString const& comparator ) : S=
tringMatcherBase( "equals", comparator ) {}
++
++        bool EqualsMatcher::match( std::string const& source ) const {
++            return m_comparator.adjustString( source ) =3D=3D m_comparato=
r.m_str;
++        }
++
++        ContainsMatcher::ContainsMatcher( CasedString const& comparator )=
 : StringMatcherBase( "contains", comparator ) {}
++
++        bool ContainsMatcher::match( std::string const& source ) const {
++            return contains( m_comparator.adjustString( source ), m_compa=
rator.m_str );
++        }
++
++        StartsWithMatcher::StartsWithMatcher( CasedString const& comparat=
or ) : StringMatcherBase( "starts with", comparator ) {}
++
++        bool StartsWithMatcher::match( std::string const& source ) const {
++            return startsWith( m_comparator.adjustString( source ), m_com=
parator.m_str );
++        }
++
++        EndsWithMatcher::EndsWithMatcher( CasedString const& comparator )=
 : StringMatcherBase( "ends with", comparator ) {}
++
++        bool EndsWithMatcher::match( std::string const& source ) const {
++            return endsWith( m_comparator.adjustString( source ), m_compa=
rator.m_str );
++        }
++
++    } // namespace StdString
++
++    StdString::EqualsMatcher Equals( std::string const& str, CaseSensitiv=
e::Choice caseSensitivity ) {
++        return StdString::EqualsMatcher( StdString::CasedString( str, cas=
eSensitivity) );
++    }
++    StdString::ContainsMatcher Contains( std::string const& str, CaseSens=
itive::Choice caseSensitivity ) {
++        return StdString::ContainsMatcher( StdString::CasedString( str, c=
aseSensitivity) );
++    }
++    StdString::EndsWithMatcher EndsWith( std::string const& str, CaseSens=
itive::Choice caseSensitivity ) {
++        return StdString::EndsWithMatcher( StdString::CasedString( str, c=
aseSensitivity) );
++    }
++    StdString::StartsWithMatcher StartsWith( std::string const& str, Case=
Sensitive::Choice caseSensitivity ) {
++        return StdString::StartsWithMatcher( StdString::CasedString( str,=
 caseSensitivity) );
++    }
++
++} // namespace Matchers
++} // namespace Catch
++// #included from: ../reporters/catch_reporter_multi.hpp
++#define TWOBLUECUBES_CATCH_REPORTER_MULTI_HPP_INCLUDED
++
++namespace Catch {
++
++class MultipleReporters : public SharedImpl<IStreamingReporter> {
++    typedef std::vector<Ptr<IStreamingReporter> > Reporters;
++    Reporters m_reporters;
++
++public:
++    void add( Ptr<IStreamingReporter> const& reporter ) {
++        m_reporters.push_back( reporter );
++    }
++
++public: // IStreamingReporter
++
++    virtual ReporterPreferences getPreferences() const CATCH_OVERRIDE {
++        return m_reporters[0]->getPreferences();
++    }
++
++    virtual void noMatchingTestCases( std::string const& spec ) CATCH_OVE=
RRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->noMatchingTestCases( spec );
++    }
++
++    virtual void testRunStarting( TestRunInfo const& testRunInfo ) CATCH_=
OVERRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->testRunStarting( testRunInfo );
++    }
++
++    virtual void testGroupStarting( GroupInfo const& groupInfo ) CATCH_OV=
ERRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->testGroupStarting( groupInfo );
++    }
++
++    virtual void testCaseStarting( TestCaseInfo const& testInfo ) CATCH_O=
VERRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->testCaseStarting( testInfo );
++    }
++
++    virtual void sectionStarting( SectionInfo const& sectionInfo ) CATCH_=
OVERRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->sectionStarting( sectionInfo );
++    }
++
++    virtual void assertionStarting( AssertionInfo const& assertionInfo ) =
CATCH_OVERRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->assertionStarting( assertionInfo );
++    }
++
++    // The return value indicates if the messages buffer should be cleare=
d:
++    virtual bool assertionEnded( AssertionStats const& assertionStats ) C=
ATCH_OVERRIDE {
++        bool clearBuffer =3D false;
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            clearBuffer |=3D (*it)->assertionEnded( assertionStats );
++        return clearBuffer;
++    }
++
++    virtual void sectionEnded( SectionStats const& sectionStats ) CATCH_O=
VERRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->sectionEnded( sectionStats );
++    }
++
++    virtual void testCaseEnded( TestCaseStats const& testCaseStats ) CATC=
H_OVERRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->testCaseEnded( testCaseStats );
++    }
++
++    virtual void testGroupEnded( TestGroupStats const& testGroupStats ) C=
ATCH_OVERRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->testGroupEnded( testGroupStats );
++    }
++
++    virtual void testRunEnded( TestRunStats const& testRunStats ) CATCH_O=
VERRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->testRunEnded( testRunStats );
++    }
++
++    virtual void skipTest( TestCaseInfo const& testInfo ) CATCH_OVERRIDE {
++        for( Reporters::const_iterator it =3D m_reporters.begin(), itEnd =
=3D m_reporters.end();
++                it !=3D itEnd;
++                ++it )
++            (*it)->skipTest( testInfo );
++    }
++
++    virtual MultipleReporters* tryAsMulti() CATCH_OVERRIDE {
++        return this;
++    }
++
++};
++
++Ptr<IStreamingReporter> addReporter( Ptr<IStreamingReporter> const& exist=
ingReporter, Ptr<IStreamingReporter> const& additionalReporter ) {
++    Ptr<IStreamingReporter> resultingReporter;
++
++    if( existingReporter ) {
++        MultipleReporters* multi =3D existingReporter->tryAsMulti();
++        if( !multi ) {
++            multi =3D new MultipleReporters;
++            resultingReporter =3D Ptr<IStreamingReporter>( multi );
++            if( existingReporter )
++                multi->add( existingReporter );
++        }
++        else
++            resultingReporter =3D existingReporter;
++        multi->add( additionalReporter );
++    }
++    else
++        resultingReporter =3D additionalReporter;
++
++    return resultingReporter;
++}
++
++} // end namespace Catch
++
++// #included from: ../reporters/catch_reporter_xml.hpp
++#define TWOBLUECUBES_CATCH_REPORTER_XML_HPP_INCLUDED
++
++// #included from: catch_reporter_bases.hpp
++#define TWOBLUECUBES_CATCH_REPORTER_BASES_HPP_INCLUDED
++
++#include <cstring>
++#include <cfloat>
++#include <cstdio>
++#include <assert.h>
++
++namespace Catch {
++
++    namespace {
++        // Because formatting using c++ streams is stateful, drop down to=
 C is required
++        // Alternatively we could use stringstream, but its performance i=
s... not good.
++        std::string getFormattedDuration( double duration ) {
++            // Max exponent + 1 is required to represent the whole part
++            // + 1 for decimal point
++            // + 3 for the 3 decimal places
++            // + 1 for null terminator
++            const size_t maxDoubleSize =3D DBL_MAX_10_EXP + 1 + 1 + 3 + 1;
++            char buffer[maxDoubleSize];
++
++            // Save previous errno, to prevent sprintf from overwriting it
++            ErrnoGuard guard;
++#ifdef _MSC_VER
++            sprintf_s(buffer, "%.3f", duration);
++#else
++            sprintf(buffer, "%.3f", duration);
++#endif
++            return std::string(buffer);
++        }
++    }
++
++    struct StreamingReporterBase : SharedImpl<IStreamingReporter> {
++
++        StreamingReporterBase( ReporterConfig const& _config )
++        :   m_config( _config.fullConfig() ),
++            stream( _config.stream() )
++        {
++            m_reporterPrefs.shouldRedirectStdOut =3D false;
++        }
++
++        virtual ReporterPreferences getPreferences() const CATCH_OVERRIDE=
 {
++            return m_reporterPrefs;
++        }
++
++        virtual ~StreamingReporterBase() CATCH_OVERRIDE;
++
++        virtual void noMatchingTestCases( std::string const& ) CATCH_OVER=
RIDE {}
++
++        virtual void testRunStarting( TestRunInfo const& _testRunInfo ) C=
ATCH_OVERRIDE {
++            currentTestRunInfo =3D _testRunInfo;
++        }
++        virtual void testGroupStarting( GroupInfo const& _groupInfo ) CAT=
CH_OVERRIDE {
++            currentGroupInfo =3D _groupInfo;
++        }
++
++        virtual void testCaseStarting( TestCaseInfo const& _testInfo ) CA=
TCH_OVERRIDE {
++            currentTestCaseInfo =3D _testInfo;
++        }
++        virtual void sectionStarting( SectionInfo const& _sectionInfo ) C=
ATCH_OVERRIDE {
++            m_sectionStack.push_back( _sectionInfo );
++        }
++
++        virtual void sectionEnded( SectionStats const& /* _sectionStats *=
/ ) CATCH_OVERRIDE {
++            m_sectionStack.pop_back();
++        }
++        virtual void testCaseEnded( TestCaseStats const& /* _testCaseStat=
s */ ) CATCH_OVERRIDE {
++            currentTestCaseInfo.reset();
++        }
++        virtual void testGroupEnded( TestGroupStats const& /* _testGroupS=
tats */ ) CATCH_OVERRIDE {
++            currentGroupInfo.reset();
++        }
++        virtual void testRunEnded( TestRunStats const& /* _testRunStats *=
/ ) CATCH_OVERRIDE {
++            currentTestCaseInfo.reset();
++            currentGroupInfo.reset();
++            currentTestRunInfo.reset();
++        }
++
++        virtual void skipTest( TestCaseInfo const& ) CATCH_OVERRIDE {
++            // Don't do anything with this by default.
++            // It can optionally be overridden in the derived class.
++        }
++
++        Ptr<IConfig const> m_config;
++        std::ostream& stream;
++
++        LazyStat<TestRunInfo> currentTestRunInfo;
++        LazyStat<GroupInfo> currentGroupInfo;
++        LazyStat<TestCaseInfo> currentTestCaseInfo;
++
++        std::vector<SectionInfo> m_sectionStack;
++        ReporterPreferences m_reporterPrefs;
++    };
++
++    struct CumulativeReporterBase : SharedImpl<IStreamingReporter> {
++        template<typename T, typename ChildNodeT>
++        struct Node : SharedImpl<> {
++            explicit Node( T const& _value ) : value( _value ) {}
++            virtual ~Node() {}
++
++            typedef std::vector<Ptr<ChildNodeT> > ChildNodes;
++            T value;
++            ChildNodes children;
++        };
++        struct SectionNode : SharedImpl<> {
++            explicit SectionNode( SectionStats const& _stats ) : stats( _=
stats ) {}
++            virtual ~SectionNode();
++
++            bool operator =3D=3D ( SectionNode const& other ) const {
++                return stats.sectionInfo.lineInfo =3D=3D other.stats.sect=
ionInfo.lineInfo;
++            }
++            bool operator =3D=3D ( Ptr<SectionNode> const& other ) const {
++                return operator=3D=3D( *other );
++            }
++
++            SectionStats stats;
++            typedef std::vector<Ptr<SectionNode> > ChildSections;
++            typedef std::vector<AssertionStats> Assertions;
++            ChildSections childSections;
++            Assertions assertions;
++            std::string stdOut;
++            std::string stdErr;
++        };
++
++        struct BySectionInfo {
++            BySectionInfo( SectionInfo const& other ) : m_other( other ) =
{}
++            BySectionInfo( BySectionInfo const& other ) : m_other( other.=
m_other ) {}
++            bool operator() ( Ptr<SectionNode> const& node ) const {
++                return ((node->stats.sectionInfo.name =3D=3D m_other.name=
) &&
++                        (node->stats.sectionInfo.lineInfo =3D=3D m_other.=
lineInfo));
++            }
++        private:
++            void operator=3D( BySectionInfo const& );
++            SectionInfo const& m_other;
++        };
++
++        typedef Node<TestCaseStats, SectionNode> TestCaseNode;
++        typedef Node<TestGroupStats, TestCaseNode> TestGroupNode;
++        typedef Node<TestRunStats, TestGroupNode> TestRunNode;
++
++        CumulativeReporterBase( ReporterConfig const& _config )
++        :   m_config( _config.fullConfig() ),
++            stream( _config.stream() )
++        {
++            m_reporterPrefs.shouldRedirectStdOut =3D false;
++        }
++        ~CumulativeReporterBase();
++
++        virtual ReporterPreferences getPreferences() const CATCH_OVERRIDE=
 {
++            return m_reporterPrefs;
++        }
++
++        virtual void testRunStarting( TestRunInfo const& ) CATCH_OVERRIDE=
 {}
++        virtual void testGroupStarting( GroupInfo const& ) CATCH_OVERRIDE=
 {}
++
++        virtual void testCaseStarting( TestCaseInfo const& ) CATCH_OVERRI=
DE {}
++
++        virtual void sectionStarting( SectionInfo const& sectionInfo ) CA=
TCH_OVERRIDE {
++            SectionStats incompleteStats( sectionInfo, Counts(), 0, false=
 );
++            Ptr<SectionNode> node;
++            if( m_sectionStack.empty() ) {
++                if( !m_rootSection )
++                    m_rootSection =3D new SectionNode( incompleteStats );
++                node =3D m_rootSection;
++            }
++            else {
++                SectionNode& parentNode =3D *m_sectionStack.back();
++                SectionNode::ChildSections::const_iterator it =3D
++                    std::find_if(   parentNode.childSections.begin(),
++                                    parentNode.childSections.end(),
++                                    BySectionInfo( sectionInfo ) );
++                if( it =3D=3D parentNode.childSections.end() ) {
++                    node =3D new SectionNode( incompleteStats );
++                    parentNode.childSections.push_back( node );
++                }
++                else
++                    node =3D *it;
++            }
++            m_sectionStack.push_back( node );
++            m_deepestSection =3D node;
++        }
++
++        virtual void assertionStarting( AssertionInfo const& ) CATCH_OVER=
RIDE {}
++
++        virtual bool assertionEnded( AssertionStats const& assertionStats=
 ) CATCH_OVERRIDE {
++            assert( !m_sectionStack.empty() );
++            SectionNode& sectionNode =3D *m_sectionStack.back();
++            sectionNode.assertions.push_back( assertionStats );
++            // AssertionResult holds a pointer to a temporary DecomposedE=
xpression,
++            // which getExpandedExpression() calls to build the expressio=
n string.
++            // Our section stack copy of the assertionResult will likely =
outlive the
++            // temporary, so it must be expanded or discarded now to avoi=
d calling
++            // a destroyed object later.
++            prepareExpandedExpression( sectionNode.assertions.back().asse=
rtionResult );
++            return true;
++        }
++        virtual void sectionEnded( SectionStats const& sectionStats ) CAT=
CH_OVERRIDE {
++            assert( !m_sectionStack.empty() );
++            SectionNode& node =3D *m_sectionStack.back();
++            node.stats =3D sectionStats;
++            m_sectionStack.pop_back();
++        }
++        virtual void testCaseEnded( TestCaseStats const& testCaseStats ) =
CATCH_OVERRIDE {
++            Ptr<TestCaseNode> node =3D new TestCaseNode( testCaseStats );
++            assert( m_sectionStack.size() =3D=3D 0 );
++            node->children.push_back( m_rootSection );
++            m_testCases.push_back( node );
++            m_rootSection.reset();
++
++            assert( m_deepestSection );
++            m_deepestSection->stdOut =3D testCaseStats.stdOut;
++            m_deepestSection->stdErr =3D testCaseStats.stdErr;
++        }
++        virtual void testGroupEnded( TestGroupStats const& testGroupStats=
 ) CATCH_OVERRIDE {
++            Ptr<TestGroupNode> node =3D new TestGroupNode( testGroupStats=
 );
++            node->children.swap( m_testCases );
++            m_testGroups.push_back( node );
++        }
++        virtual void testRunEnded( TestRunStats const& testRunStats ) CAT=
CH_OVERRIDE {
++            Ptr<TestRunNode> node =3D new TestRunNode( testRunStats );
++            node->children.swap( m_testGroups );
++            m_testRuns.push_back( node );
++            testRunEndedCumulative();
++        }
++        virtual void testRunEndedCumulative() =3D 0;
++
++        virtual void skipTest( TestCaseInfo const& ) CATCH_OVERRIDE {}
++
++        virtual void prepareExpandedExpression( AssertionResult& result )=
 const {
++            if( result.isOk() )
++                result.discardDecomposedExpression();
++            else
++                result.expandDecomposedExpression();
++        }
++
++        Ptr<IConfig const> m_config;
++        std::ostream& stream;
++        std::vector<AssertionStats> m_assertions;
++        std::vector<std::vector<Ptr<SectionNode> > > m_sections;
++        std::vector<Ptr<TestCaseNode> > m_testCases;
++        std::vector<Ptr<TestGroupNode> > m_testGroups;
++
++        std::vector<Ptr<TestRunNode> > m_testRuns;
++
++        Ptr<SectionNode> m_rootSection;
++        Ptr<SectionNode> m_deepestSection;
++        std::vector<Ptr<SectionNode> > m_sectionStack;
++        ReporterPreferences m_reporterPrefs;
++
++    };
++
++    template<char C>
++    char const* getLineOfChars() {
++        static char line[CATCH_CONFIG_CONSOLE_WIDTH] =3D {0};
++        if( !*line ) {
++            std::memset( line, C, CATCH_CONFIG_CONSOLE_WIDTH-1 );
++            line[CATCH_CONFIG_CONSOLE_WIDTH-1] =3D 0;
++        }
++        return line;
++    }
++
++    struct TestEventListenerBase : StreamingReporterBase {
++        TestEventListenerBase( ReporterConfig const& _config )
++        :   StreamingReporterBase( _config )
++        {}
++
++        virtual void assertionStarting( AssertionInfo const& ) CATCH_OVER=
RIDE {}
++        virtual bool assertionEnded( AssertionStats const& ) CATCH_OVERRI=
DE {
++            return false;
++        }
++    };
++
++} // end namespace Catch
++
++// #included from: ../internal/catch_reporter_registrars.hpp
++#define TWOBLUECUBES_CATCH_REPORTER_REGISTRARS_HPP_INCLUDED
++
++namespace Catch {
++
++    template<typename T>
++    class LegacyReporterRegistrar {
++
++        class ReporterFactory : public IReporterFactory {
++            virtual IStreamingReporter* create( ReporterConfig const& con=
fig ) const {
++                return new LegacyReporterAdapter( new T( config ) );
++            }
++
++            virtual std::string getDescription() const {
++                return T::getDescription();
++            }
++        };
++
++    public:
++
++        LegacyReporterRegistrar( std::string const& name ) {
++            getMutableRegistryHub().registerReporter( name, new ReporterF=
actory() );
++        }
++    };
++
++    template<typename T>
++    class ReporterRegistrar {
++
++        class ReporterFactory : public SharedImpl<IReporterFactory> {
++
++            // *** Please Note ***:
++            // - If you end up here looking at a compiler error because i=
t's trying to register
++            // your custom reporter class be aware that the native report=
er interface has changed
++            // to IStreamingReporter. The "legacy" interface, IReporter, =
is still supported via
++            // an adapter. Just use REGISTER_LEGACY_REPORTER to take adva=
ntage of the adapter.
++            // However please consider updating to the new interface as t=
he old one is now
++            // deprecated and will probably be removed quite soon!
++            // Please contact me via github if you have any questions at =
all about this.
++            // In fact, ideally, please contact me anyway to let me know =
you've hit this - as I have
++            // no idea who is actually using custom reporters at all (pos=
sibly no-one!).
++            // The new interface is designed to minimise exposure to inte=
rface changes in the future.
++            virtual IStreamingReporter* create( ReporterConfig const& con=
fig ) const {
++                return new T( config );
++            }
++
++            virtual std::string getDescription() const {
++                return T::getDescription();
++            }
++        };
++
++    public:
++
++        ReporterRegistrar( std::string const& name ) {
++            getMutableRegistryHub().registerReporter( name, new ReporterF=
actory() );
++        }
++    };
++
++    template<typename T>
++    class ListenerRegistrar {
++
++        class ListenerFactory : public SharedImpl<IReporterFactory> {
++
++            virtual IStreamingReporter* create( ReporterConfig const& con=
fig ) const {
++                return new T( config );
++            }
++            virtual std::string getDescription() const {
++                return std::string();
++            }
++        };
++
++    public:
++
++        ListenerRegistrar() {
++            getMutableRegistryHub().registerListener( new ListenerFactory=
() );
++        }
++    };
++}
++
++#define INTERNAL_CATCH_REGISTER_LEGACY_REPORTER( name, reporterType ) \
++    namespace{ Catch::LegacyReporterRegistrar<reporterType> catch_interna=
l_RegistrarFor##reporterType( name ); }
++
++#define INTERNAL_CATCH_REGISTER_REPORTER( name, reporterType ) \
++    namespace{ Catch::ReporterRegistrar<reporterType> catch_internal_Regi=
strarFor##reporterType( name ); }
++
++// Deprecated - use the form without INTERNAL_
++#define INTERNAL_CATCH_REGISTER_LISTENER( listenerType ) \
++    namespace{ Catch::ListenerRegistrar<listenerType> catch_internal_Regi=
strarFor##listenerType; }
++
++#define CATCH_REGISTER_LISTENER( listenerType ) \
++    namespace{ Catch::ListenerRegistrar<listenerType> catch_internal_Regi=
strarFor##listenerType; }
++
++// #included from: ../internal/catch_xmlwriter.hpp
++#define TWOBLUECUBES_CATCH_XMLWRITER_HPP_INCLUDED
++
++#include <sstream>
++#include <string>
++#include <vector>
++#include <iomanip>
++
++namespace Catch {
++
++    class XmlEncode {
++    public:
++        enum ForWhat { ForTextNodes, ForAttributes };
++
++        XmlEncode( std::string const& str, ForWhat forWhat =3D ForTextNod=
es )
++        :   m_str( str ),
++            m_forWhat( forWhat )
++        {}
++
++        void encodeTo( std::ostream& os ) const {
++
++            // Apostrophe escaping not necessary if we always use " to wr=
ite attributes
++            // (see: http://www.w3.org/TR/xml/#syntax)
++
++            for( std::size_t i =3D 0; i < m_str.size(); ++ i ) {
++                char c =3D m_str[i];
++                switch( c ) {
++                    case '<':   os << "&lt;"; break;
++                    case '&':   os << "&amp;"; break;
++
++                    case '>':
++                        // See: http://www.w3.org/TR/xml/#syntax
++                        if( i > 2 && m_str[i-1] =3D=3D ']' && m_str[i-2] =
=3D=3D ']' )
++                            os << "&gt;";
++                        else
++                            os << c;
++                        break;
++
++                    case '\"':
++                        if( m_forWhat =3D=3D ForAttributes )
++                            os << "&quot;";
++                        else
++                            os << c;
++                        break;
++
++                    default:
++                        // Escape control chars - based on contribution b=
y @espenalb in PR #465 and
++                        // by @mrpi PR #588
++                        if ( ( c >=3D 0 && c < '\x09' ) || ( c > '\x0D' &=
& c < '\x20') || c=3D=3D'\x7F' ) {
++                            // see http://stackoverflow.com/questions/404=
107/why-are-control-characters-illegal-in-xml-1-0
++                            os << "\\x" << std::uppercase << std::hex << =
std::setfill('0') << std::setw(2)
++                               << static_cast<int>( c );
++                        }
++                        else
++                            os << c;
++                }
++            }
++        }
++
++        friend std::ostream& operator << ( std::ostream& os, XmlEncode co=
nst& xmlEncode ) {
++            xmlEncode.encodeTo( os );
++            return os;
++        }
++
++    private:
++        std::string m_str;
++        ForWhat m_forWhat;
++    };
++
++    class XmlWriter {
++    public:
++
++        class ScopedElement {
++        public:
++            ScopedElement( XmlWriter* writer )
++            :   m_writer( writer )
++            {}
++
++            ScopedElement( ScopedElement const& other )
++            :   m_writer( other.m_writer ){
++                other.m_writer =3D CATCH_NULL;
++            }
++
++            ~ScopedElement() {
++                if( m_writer )
++                    m_writer->endElement();
++            }
++
++            ScopedElement& writeText( std::string const& text, bool inden=
t =3D true ) {
++                m_writer->writeText( text, indent );
++                return *this;
++            }
++
++            template<typename T>
++            ScopedElement& writeAttribute( std::string const& name, T con=
st& attribute ) {
++                m_writer->writeAttribute( name, attribute );
++                return *this;
++            }
++
++        private:
++            mutable XmlWriter* m_writer;
++        };
++
++        XmlWriter()
++        :   m_tagIsOpen( false ),
++            m_needsNewline( false ),
++            m_os( Catch::cout() )
++        {
++            writeDeclaration();
++        }
++
++        XmlWriter( std::ostream& os )
++        :   m_tagIsOpen( false ),
++            m_needsNewline( false ),
++            m_os( os )
++        {
++            writeDeclaration();
++        }
++
++        ~XmlWriter() {
++            while( !m_tags.empty() )
++                endElement();
++        }
++
++        XmlWriter& startElement( std::string const& name ) {
++            ensureTagClosed();
++            newlineIfNecessary();
++            m_os << m_indent << '<' << name;
++            m_tags.push_back( name );
++            m_indent +=3D "  ";
++            m_tagIsOpen =3D true;
++            return *this;
++        }
++
++        ScopedElement scopedElement( std::string const& name ) {
++            ScopedElement scoped( this );
++            startElement( name );
++            return scoped;
++        }
++
++        XmlWriter& endElement() {
++            newlineIfNecessary();
++            m_indent =3D m_indent.substr( 0, m_indent.size()-2 );
++            if( m_tagIsOpen ) {
++                m_os << "/>";
++                m_tagIsOpen =3D false;
++            }
++            else {
++                m_os << m_indent << "</" << m_tags.back() << ">";
++            }
++            m_os << std::endl;
++            m_tags.pop_back();
++            return *this;
++        }
++
++        XmlWriter& writeAttribute( std::string const& name, std::string c=
onst& attribute ) {
++            if( !name.empty() && !attribute.empty() )
++                m_os << ' ' << name << "=3D\"" << XmlEncode( attribute, X=
mlEncode::ForAttributes ) << '"';
++            return *this;
++        }
++
++        XmlWriter& writeAttribute( std::string const& name, bool attribut=
e ) {
++            m_os << ' ' << name << "=3D\"" << ( attribute ? "true" : "fal=
se" ) << '"';
++            return *this;
++        }
++
++        template<typename T>
++        XmlWriter& writeAttribute( std::string const& name, T const& attr=
ibute ) {
++            std::ostringstream oss;
++            oss << attribute;
++            return writeAttribute( name, oss.str() );
++        }
++
++        XmlWriter& writeText( std::string const& text, bool indent =3D tr=
ue ) {
++            if( !text.empty() ){
++                bool tagWasOpen =3D m_tagIsOpen;
++                ensureTagClosed();
++                if( tagWasOpen && indent )
++                    m_os << m_indent;
++                m_os << XmlEncode( text );
++                m_needsNewline =3D true;
++            }
++            return *this;
++        }
++
++        XmlWriter& writeComment( std::string const& text ) {
++            ensureTagClosed();
++            m_os << m_indent << "<!--" << text << "-->";
++            m_needsNewline =3D true;
++            return *this;
++        }
++
++        void writeStylesheetRef( std::string const& url ) {
++            m_os << "<?xml-stylesheet type=3D\"text/xsl\" href=3D\"" << u=
rl << "\"?>\n";
++        }
++
++        XmlWriter& writeBlankLine() {
++            ensureTagClosed();
++            m_os << '\n';
++            return *this;
++        }
++
++        void ensureTagClosed() {
++            if( m_tagIsOpen ) {
++                m_os << ">" << std::endl;
++                m_tagIsOpen =3D false;
++            }
++        }
++
++    private:
++        XmlWriter( XmlWriter const& );
++        void operator=3D( XmlWriter const& );
++
++        void writeDeclaration() {
++            m_os << "<?xml version=3D\"1.0\" encoding=3D\"UTF-8\"?>\n";
++        }
++
++        void newlineIfNecessary() {
++            if( m_needsNewline ) {
++                m_os << std::endl;
++                m_needsNewline =3D false;
++            }
++        }
++
++        bool m_tagIsOpen;
++        bool m_needsNewline;
++        std::vector<std::string> m_tags;
++        std::string m_indent;
++        std::ostream& m_os;
++    };
++
++}
++
++namespace Catch {
++    class XmlReporter : public StreamingReporterBase {
++    public:
++        XmlReporter( ReporterConfig const& _config )
++        :   StreamingReporterBase( _config ),
++            m_xml(_config.stream()),
++            m_sectionDepth( 0 )
++        {
++            m_reporterPrefs.shouldRedirectStdOut =3D true;
++        }
++
++        virtual ~XmlReporter() CATCH_OVERRIDE;
++
++        static std::string getDescription() {
++            return "Reports test results as an XML document";
++        }
++
++        virtual std::string getStylesheetRef() const {
++            return std::string();
++        }
++
++        void writeSourceInfo( SourceLineInfo const& sourceInfo ) {
++            m_xml
++                .writeAttribute( "filename", sourceInfo.file )
++                .writeAttribute( "line", sourceInfo.line );
++        }
++
++    public: // StreamingReporterBase
++
++        virtual void noMatchingTestCases( std::string const& s ) CATCH_OV=
ERRIDE {
++            StreamingReporterBase::noMatchingTestCases( s );
++        }
++
++        virtual void testRunStarting( TestRunInfo const& testInfo ) CATCH=
_OVERRIDE {
++            StreamingReporterBase::testRunStarting( testInfo );
++            std::string stylesheetRef =3D getStylesheetRef();
++            if( !stylesheetRef.empty() )
++                m_xml.writeStylesheetRef( stylesheetRef );
++            m_xml.startElement( "Catch" );
++            if( !m_config->name().empty() )
++                m_xml.writeAttribute( "name", m_config->name() );
++        }
++
++        virtual void testGroupStarting( GroupInfo const& groupInfo ) CATC=
H_OVERRIDE {
++            StreamingReporterBase::testGroupStarting( groupInfo );
++            m_xml.startElement( "Group" )
++                .writeAttribute( "name", groupInfo.name );
++        }
++
++        virtual void testCaseStarting( TestCaseInfo const& testInfo ) CAT=
CH_OVERRIDE {
++            StreamingReporterBase::testCaseStarting(testInfo);
++            m_xml.startElement( "TestCase" )
++                .writeAttribute( "name", trim( testInfo.name ) )
++                .writeAttribute( "description", testInfo.description )
++                .writeAttribute( "tags", testInfo.tagsAsString );
++
++            writeSourceInfo( testInfo.lineInfo );
++
++            if ( m_config->showDurations() =3D=3D ShowDurations::Always )
++                m_testCaseTimer.start();
++            m_xml.ensureTagClosed();
++        }
++
++        virtual void sectionStarting( SectionInfo const& sectionInfo ) CA=
TCH_OVERRIDE {
++            StreamingReporterBase::sectionStarting( sectionInfo );
++            if( m_sectionDepth++ > 0 ) {
++                m_xml.startElement( "Section" )
++                    .writeAttribute( "name", trim( sectionInfo.name ) )
++                    .writeAttribute( "description", sectionInfo.descripti=
on );
++                writeSourceInfo( sectionInfo.lineInfo );
++                m_xml.ensureTagClosed();
++            }
++        }
++
++        virtual void assertionStarting( AssertionInfo const& ) CATCH_OVER=
RIDE { }
++
++        virtual bool assertionEnded( AssertionStats const& assertionStats=
 ) CATCH_OVERRIDE {
++
++            AssertionResult const& result =3D assertionStats.assertionRes=
ult;
++
++            bool includeResults =3D m_config->includeSuccessfulResults() =
|| !result.isOk();
++
++            if( includeResults || result.getResultType() =3D=3D ResultWas=
::Warning ) {
++                // Print any info messages in <Info> tags.
++                for( std::vector<MessageInfo>::const_iterator it =3D asse=
rtionStats.infoMessages.begin(), itEnd =3D assertionStats.infoMessages.end(=
);
++                     it !=3D itEnd;
++                     ++it ) {
++                    if( it->type =3D=3D ResultWas::Info && includeResults=
 ) {
++                        m_xml.scopedElement( "Info" )
++                                .writeText( it->message );
++                    } else if ( it->type =3D=3D ResultWas::Warning ) {
++                        m_xml.scopedElement( "Warning" )
++                                .writeText( it->message );
++                    }
++                }
++            }
++
++            // Drop out if result was successful but we're not printing t=
hem.
++            if( !includeResults && result.getResultType() !=3D ResultWas:=
:Warning )
++                return true;
++
++            // Print the expression if there is one.
++            if( result.hasExpression() ) {
++                m_xml.startElement( "Expression" )
++                    .writeAttribute( "success", result.succeeded() )
++                    .writeAttribute( "type", result.getTestMacroName() );
++
++                writeSourceInfo( result.getSourceInfo() );
++
++                m_xml.scopedElement( "Original" )
++                    .writeText( result.getExpression() );
++                m_xml.scopedElement( "Expanded" )
++                    .writeText( result.getExpandedExpression() );
++            }
++
++            // And... Print a result applicable to each result type.
++            switch( result.getResultType() ) {
++                case ResultWas::ThrewException:
++                    m_xml.startElement( "Exception" );
++                    writeSourceInfo( result.getSourceInfo() );
++                    m_xml.writeText( result.getMessage() );
++                    m_xml.endElement();
++                    break;
++                case ResultWas::FatalErrorCondition:
++                    m_xml.startElement( "FatalErrorCondition" );
++                    writeSourceInfo( result.getSourceInfo() );
++                    m_xml.writeText( result.getMessage() );
++                    m_xml.endElement();
++                    break;
++                case ResultWas::Info:
++                    m_xml.scopedElement( "Info" )
++                        .writeText( result.getMessage() );
++                    break;
++                case ResultWas::Warning:
++                    // Warning will already have been written
++                    break;
++                case ResultWas::ExplicitFailure:
++                    m_xml.startElement( "Failure" );
++                    writeSourceInfo( result.getSourceInfo() );
++                    m_xml.writeText( result.getMessage() );
++                    m_xml.endElement();
++                    break;
++                default:
++                    break;
++            }
++
++            if( result.hasExpression() )
++                m_xml.endElement();
++
++            return true;
++        }
++
++        virtual void sectionEnded( SectionStats const& sectionStats ) CAT=
CH_OVERRIDE {
++            StreamingReporterBase::sectionEnded( sectionStats );
++            if( --m_sectionDepth > 0 ) {
++                XmlWriter::ScopedElement e =3D m_xml.scopedElement( "Over=
allResults" );
++                e.writeAttribute( "successes", sectionStats.assertions.pa=
ssed );
++                e.writeAttribute( "failures", sectionStats.assertions.fai=
led );
++                e.writeAttribute( "expectedFailures", sectionStats.assert=
ions.failedButOk );
++
++                if ( m_config->showDurations() =3D=3D ShowDurations::Alwa=
ys )
++                    e.writeAttribute( "durationInSeconds", sectionStats.d=
urationInSeconds );
++
++                m_xml.endElement();
++            }
++        }
++
++        virtual void testCaseEnded( TestCaseStats const& testCaseStats ) =
CATCH_OVERRIDE {
++            StreamingReporterBase::testCaseEnded( testCaseStats );
++            XmlWriter::ScopedElement e =3D m_xml.scopedElement( "OverallR=
esult" );
++            e.writeAttribute( "success", testCaseStats.totals.assertions.=
allOk() );
++
++            if ( m_config->showDurations() =3D=3D ShowDurations::Always )
++                e.writeAttribute( "durationInSeconds", m_testCaseTimer.ge=
tElapsedSeconds() );
++
++            if( !testCaseStats.stdOut.empty() )
++                m_xml.scopedElement( "StdOut" ).writeText( trim( testCase=
Stats.stdOut ), false );
++            if( !testCaseStats.stdErr.empty() )
++                m_xml.scopedElement( "StdErr" ).writeText( trim( testCase=
Stats.stdErr ), false );
++
++            m_xml.endElement();
++        }
++
++        virtual void testGroupEnded( TestGroupStats const& testGroupStats=
 ) CATCH_OVERRIDE {
++            StreamingReporterBase::testGroupEnded( testGroupStats );
++            // TODO: Check testGroupStats.aborting and act accordingly.
++            m_xml.scopedElement( "OverallResults" )
++                .writeAttribute( "successes", testGroupStats.totals.asser=
tions.passed )
++                .writeAttribute( "failures", testGroupStats.totals.assert=
ions.failed )
++                .writeAttribute( "expectedFailures", testGroupStats.total=
s.assertions.failedButOk );
++            m_xml.endElement();
++        }
++
++        virtual void testRunEnded( TestRunStats const& testRunStats ) CAT=
CH_OVERRIDE {
++            StreamingReporterBase::testRunEnded( testRunStats );
++            m_xml.scopedElement( "OverallResults" )
++                .writeAttribute( "successes", testRunStats.totals.asserti=
ons.passed )
++                .writeAttribute( "failures", testRunStats.totals.assertio=
ns.failed )
++                .writeAttribute( "expectedFailures", testRunStats.totals.=
assertions.failedButOk );
++            m_xml.endElement();
++        }
++
++    private:
++        Timer m_testCaseTimer;
++        XmlWriter m_xml;
++        int m_sectionDepth;
++    };
++
++     INTERNAL_CATCH_REGISTER_REPORTER( "xml", XmlReporter )
++
++} // end namespace Catch
++
++// #included from: ../reporters/catch_reporter_junit.hpp
++#define TWOBLUECUBES_CATCH_REPORTER_JUNIT_HPP_INCLUDED
++
++#include <assert.h>
++
++namespace Catch {
++
++    namespace {
++        std::string getCurrentTimestamp() {
++            // Beware, this is not reentrant because of backward compatib=
ility issues
++            // Also, UTC only, again because of backward compatibility (%=
z is C++11)
++            time_t rawtime;
++            std::time(&rawtime);
++            const size_t timeStampSize =3D sizeof("2017-01-16T17:06:45Z");
++
++#ifdef _MSC_VER
++            std::tm timeInfo =3D {};
++            gmtime_s(&timeInfo, &rawtime);
++#else
++            std::tm* timeInfo;
++            timeInfo =3D std::gmtime(&rawtime);
++#endif
++
++            char timeStamp[timeStampSize];
++            const char * const fmt =3D "%Y-%m-%dT%H:%M:%SZ";
++
++#ifdef _MSC_VER
++            std::strftime(timeStamp, timeStampSize, fmt, &timeInfo);
++#else
++            std::strftime(timeStamp, timeStampSize, fmt, timeInfo);
++#endif
++            return std::string(timeStamp);
++        }
++
++    }
++
++    class JunitReporter : public CumulativeReporterBase {
++    public:
++        JunitReporter( ReporterConfig const& _config )
++        :   CumulativeReporterBase( _config ),
++            xml( _config.stream() ),
++            unexpectedExceptions( 0 ),
++            m_okToFail( false )
++        {
++            m_reporterPrefs.shouldRedirectStdOut =3D true;
++        }
++
++        virtual ~JunitReporter() CATCH_OVERRIDE;
++
++        static std::string getDescription() {
++            return "Reports test results in an XML format that looks like=
 Ant's junitreport target";
++        }
++
++        virtual void noMatchingTestCases( std::string const& /*spec*/ ) C=
ATCH_OVERRIDE {}
++
++        virtual void testRunStarting( TestRunInfo const& runInfo ) CATCH_=
OVERRIDE {
++            CumulativeReporterBase::testRunStarting( runInfo );
++            xml.startElement( "testsuites" );
++        }
++
++        virtual void testGroupStarting( GroupInfo const& groupInfo ) CATC=
H_OVERRIDE {
++            suiteTimer.start();
++            stdOutForSuite.str("");
++            stdErrForSuite.str("");
++            unexpectedExceptions =3D 0;
++            CumulativeReporterBase::testGroupStarting( groupInfo );
++        }
++
++        virtual void testCaseStarting( TestCaseInfo const& testCaseInfo )=
 CATCH_OVERRIDE {
++            m_okToFail =3D testCaseInfo.okToFail();
++        }
++        virtual bool assertionEnded( AssertionStats const& assertionStats=
 ) CATCH_OVERRIDE {
++            if( assertionStats.assertionResult.getResultType() =3D=3D Res=
ultWas::ThrewException && !m_okToFail )
++                unexpectedExceptions++;
++            return CumulativeReporterBase::assertionEnded( assertionStats=
 );
++        }
++
++        virtual void testCaseEnded( TestCaseStats const& testCaseStats ) =
CATCH_OVERRIDE {
++            stdOutForSuite << testCaseStats.stdOut;
++            stdErrForSuite << testCaseStats.stdErr;
++            CumulativeReporterBase::testCaseEnded( testCaseStats );
++        }
++
++        virtual void testGroupEnded( TestGroupStats const& testGroupStats=
 ) CATCH_OVERRIDE {
++            double suiteTime =3D suiteTimer.getElapsedSeconds();
++            CumulativeReporterBase::testGroupEnded( testGroupStats );
++            writeGroup( *m_testGroups.back(), suiteTime );
++        }
++
++        virtual void testRunEndedCumulative() CATCH_OVERRIDE {
++            xml.endElement();
++        }
++
++        void writeGroup( TestGroupNode const& groupNode, double suiteTime=
 ) {
++            XmlWriter::ScopedElement e =3D xml.scopedElement( "testsuite"=
 );
++            TestGroupStats const& stats =3D groupNode.value;
++            xml.writeAttribute( "name", stats.groupInfo.name );
++            xml.writeAttribute( "errors", unexpectedExceptions );
++            xml.writeAttribute( "failures", stats.totals.assertions.faile=
d-unexpectedExceptions );
++            xml.writeAttribute( "tests", stats.totals.assertions.total() =
);
++            xml.writeAttribute( "hostname", "tbd" ); // !TBD
++            if( m_config->showDurations() =3D=3D ShowDurations::Never )
++                xml.writeAttribute( "time", "" );
++            else
++                xml.writeAttribute( "time", suiteTime );
++            xml.writeAttribute( "timestamp", getCurrentTimestamp() );
++
++            // Write test cases
++            for( TestGroupNode::ChildNodes::const_iterator
++                    it =3D groupNode.children.begin(), itEnd =3D groupNod=
e.children.end();
++                    it !=3D itEnd;
++                    ++it )
++                writeTestCase( **it );
++
++            xml.scopedElement( "system-out" ).writeText( trim( stdOutForS=
uite.str() ), false );
++            xml.scopedElement( "system-err" ).writeText( trim( stdErrForS=
uite.str() ), false );
++        }
++
++        void writeTestCase( TestCaseNode const& testCaseNode ) {
++            TestCaseStats const& stats =3D testCaseNode.value;
++
++            // All test cases have exactly one section - which represents=
 the
++            // test case itself. That section may have 0-n nested sections
++            assert( testCaseNode.children.size() =3D=3D 1 );
++            SectionNode const& rootSection =3D *testCaseNode.children.fro=
nt();
++
++            std::string className =3D stats.testInfo.className;
++
++            if( className.empty() ) {
++                if( rootSection.childSections.empty() )
++                    className =3D "global";
++            }
++            writeSection( className, "", rootSection );
++        }
++
++        void writeSection(  std::string const& className,
++                            std::string const& rootName,
++                            SectionNode const& sectionNode ) {
++            std::string name =3D trim( sectionNode.stats.sectionInfo.name=
 );
++            if( !rootName.empty() )
++                name =3D rootName + '/' + name;
++
++            if( !sectionNode.assertions.empty() ||
++                !sectionNode.stdOut.empty() ||
++                !sectionNode.stdErr.empty() ) {
++                XmlWriter::ScopedElement e =3D xml.scopedElement( "testca=
se" );
++                if( className.empty() ) {
++                    xml.writeAttribute( "classname", name );
++                    xml.writeAttribute( "name", "root" );
++                }
++                else {
++                    xml.writeAttribute( "classname", className );
++                    xml.writeAttribute( "name", name );
++                }
++                xml.writeAttribute( "time", Catch::toString( sectionNode.=
stats.durationInSeconds ) );
++
++                writeAssertions( sectionNode );
++
++                if( !sectionNode.stdOut.empty() )
++                    xml.scopedElement( "system-out" ).writeText( trim( se=
ctionNode.stdOut ), false );
++                if( !sectionNode.stdErr.empty() )
++                    xml.scopedElement( "system-err" ).writeText( trim( se=
ctionNode.stdErr ), false );
++            }
++            for( SectionNode::ChildSections::const_iterator
++                    it =3D sectionNode.childSections.begin(),
++                    itEnd =3D sectionNode.childSections.end();
++                    it !=3D itEnd;
++                    ++it )
++                if( className.empty() )
++                    writeSection( name, "", **it );
++                else
++                    writeSection( className, name, **it );
++        }
++
++        void writeAssertions( SectionNode const& sectionNode ) {
++            for( SectionNode::Assertions::const_iterator
++                    it =3D sectionNode.assertions.begin(), itEnd =3D sect=
ionNode.assertions.end();
++                    it !=3D itEnd;
++                    ++it )
++                writeAssertion( *it );
++        }
++        void writeAssertion( AssertionStats const& stats ) {
++            AssertionResult const& result =3D stats.assertionResult;
++            if( !result.isOk() ) {
++                std::string elementName;
++                switch( result.getResultType() ) {
++                    case ResultWas::ThrewException:
++                    case ResultWas::FatalErrorCondition:
++                        elementName =3D "error";
++                        break;
++                    case ResultWas::ExplicitFailure:
++                        elementName =3D "failure";
++                        break;
++                    case ResultWas::ExpressionFailed:
++                        elementName =3D "failure";
++                        break;
++                    case ResultWas::DidntThrowException:
++                        elementName =3D "failure";
++                        break;
++
++                    // We should never see these here:
++                    case ResultWas::Info:
++                    case ResultWas::Warning:
++                    case ResultWas::Ok:
++                    case ResultWas::Unknown:
++                    case ResultWas::FailureBit:
++                    case ResultWas::Exception:
++                        elementName =3D "internalError";
++                        break;
++                }
++
++                XmlWriter::ScopedElement e =3D xml.scopedElement( element=
Name );
++
++                xml.writeAttribute( "message", result.getExpandedExpressi=
on() );
++                xml.writeAttribute( "type", result.getTestMacroName() );
++
++                std::ostringstream oss;
++                if( !result.getMessage().empty() )
++                    oss << result.getMessage() << '\n';
++                for( std::vector<MessageInfo>::const_iterator
++                        it =3D stats.infoMessages.begin(),
++                        itEnd =3D stats.infoMessages.end();
++                            it !=3D itEnd;
++                            ++it )
++                    if( it->type =3D=3D ResultWas::Info )
++                        oss << it->message << '\n';
++
++                oss << "at " << result.getSourceInfo();
++                xml.writeText( oss.str(), false );
++            }
++        }
++
++        XmlWriter xml;
++        Timer suiteTimer;
++        std::ostringstream stdOutForSuite;
++        std::ostringstream stdErrForSuite;
++        unsigned int unexpectedExceptions;
++        bool m_okToFail;
++    };
++
++    INTERNAL_CATCH_REGISTER_REPORTER( "junit", JunitReporter )
++
++} // end namespace Catch
++
++// #included from: ../reporters/catch_reporter_console.hpp
++#define TWOBLUECUBES_CATCH_REPORTER_CONSOLE_HPP_INCLUDED
++
++#include <cassert>
++#include <cfloat>
++#include <cstdio>
++
++namespace Catch {
++
++    struct ConsoleReporter : StreamingReporterBase {
++        ConsoleReporter( ReporterConfig const& _config )
++        :   StreamingReporterBase( _config ),
++            m_headerPrinted( false )
++        {}
++
++        virtual ~ConsoleReporter() CATCH_OVERRIDE;
++        static std::string getDescription() {
++            return "Reports test results as plain lines of text";
++        }
++
++        virtual void noMatchingTestCases( std::string const& spec ) CATCH=
_OVERRIDE {
++            stream << "No test cases matched '" << spec << '\'' << std::e=
ndl;
++        }
++
++        virtual void assertionStarting( AssertionInfo const& ) CATCH_OVER=
RIDE {
++        }
++
++        virtual bool assertionEnded( AssertionStats const& _assertionStat=
s ) CATCH_OVERRIDE {
++            AssertionResult const& result =3D _assertionStats.assertionRe=
sult;
++
++            bool includeResults =3D m_config->includeSuccessfulResults() =
|| !result.isOk();
++
++            // Drop out if result was successful but we're not printing t=
hem.
++            if( !includeResults && result.getResultType() !=3D ResultWas:=
:Warning )
++                return false;
++
++            lazyPrint();
++
++            AssertionPrinter printer( stream, _assertionStats, includeRes=
ults );
++            printer.print();
++            stream << std::endl;
++            return true;
++        }
++
++        virtual void sectionStarting( SectionInfo const& _sectionInfo ) C=
ATCH_OVERRIDE {
++            m_headerPrinted =3D false;
++            StreamingReporterBase::sectionStarting( _sectionInfo );
++        }
++        virtual void sectionEnded( SectionStats const& _sectionStats ) CA=
TCH_OVERRIDE {
++            if( _sectionStats.missingAssertions ) {
++                lazyPrint();
++                Colour colour( Colour::ResultError );
++                if( m_sectionStack.size() > 1 )
++                    stream << "\nNo assertions in section";
++                else
++                    stream << "\nNo assertions in test case";
++                stream << " '" << _sectionStats.sectionInfo.name << "'\n"=
 << std::endl;
++            }
++            if( m_config->showDurations() =3D=3D ShowDurations::Always ) {
++                stream << getFormattedDuration(_sectionStats.durationInSe=
conds) << " s: " << _sectionStats.sectionInfo.name << std::endl;
++            }
++            if( m_headerPrinted ) {
++                m_headerPrinted =3D false;
++            }
++            StreamingReporterBase::sectionEnded( _sectionStats );
++        }
++
++        virtual void testCaseEnded( TestCaseStats const& _testCaseStats )=
 CATCH_OVERRIDE {
++            StreamingReporterBase::testCaseEnded( _testCaseStats );
++            m_headerPrinted =3D false;
++        }
++        virtual void testGroupEnded( TestGroupStats const& _testGroupStat=
s ) CATCH_OVERRIDE {
++            if( currentGroupInfo.used ) {
++                printSummaryDivider();
++                stream << "Summary for group '" << _testGroupStats.groupI=
nfo.name << "':\n";
++                printTotals( _testGroupStats.totals );
++                stream << '\n' << std::endl;
++            }
++            StreamingReporterBase::testGroupEnded( _testGroupStats );
++        }
++        virtual void testRunEnded( TestRunStats const& _testRunStats ) CA=
TCH_OVERRIDE {
++            printTotalsDivider( _testRunStats.totals );
++            printTotals( _testRunStats.totals );
++            stream << std::endl;
++            StreamingReporterBase::testRunEnded( _testRunStats );
++        }
++
++    private:
++
++        class AssertionPrinter {
++            void operator=3D ( AssertionPrinter const& );
++        public:
++            AssertionPrinter( std::ostream& _stream, AssertionStats const=
& _stats, bool _printInfoMessages )
++            :   stream( _stream ),
++                stats( _stats ),
++                result( _stats.assertionResult ),
++                colour( Colour::None ),
++                message( result.getMessage() ),
++                messages( _stats.infoMessages ),
++                printInfoMessages( _printInfoMessages )
++            {
++                switch( result.getResultType() ) {
++                    case ResultWas::Ok:
++                        colour =3D Colour::Success;
++                        passOrFail =3D "PASSED";
++                        //if( result.hasMessage() )
++                        if( _stats.infoMessages.size() =3D=3D 1 )
++                            messageLabel =3D "with message";
++                        if( _stats.infoMessages.size() > 1 )
++                            messageLabel =3D "with messages";
++                        break;
++                    case ResultWas::ExpressionFailed:
++                        if( result.isOk() ) {
++                            colour =3D Colour::Success;
++                            passOrFail =3D "FAILED - but was ok";
++                        }
++                        else {
++                            colour =3D Colour::Error;
++                            passOrFail =3D "FAILED";
++                        }
++                        if( _stats.infoMessages.size() =3D=3D 1 )
++                            messageLabel =3D "with message";
++                        if( _stats.infoMessages.size() > 1 )
++                            messageLabel =3D "with messages";
++                        break;
++                    case ResultWas::ThrewException:
++                        colour =3D Colour::Error;
++                        passOrFail =3D "FAILED";
++                        messageLabel =3D "due to unexpected exception wit=
h ";
++                        if (_stats.infoMessages.size() =3D=3D 1)
++                            messageLabel +=3D "message";
++                        if (_stats.infoMessages.size() > 1)
++                            messageLabel +=3D "messages";
++                        break;
++                    case ResultWas::FatalErrorCondition:
++                        colour =3D Colour::Error;
++                        passOrFail =3D "FAILED";
++                        messageLabel =3D "due to a fatal error condition";
++                        break;
++                    case ResultWas::DidntThrowException:
++                        colour =3D Colour::Error;
++                        passOrFail =3D "FAILED";
++                        messageLabel =3D "because no exception was thrown=
 where one was expected";
++                        break;
++                    case ResultWas::Info:
++                        messageLabel =3D "info";
++                        break;
++                    case ResultWas::Warning:
++                        messageLabel =3D "warning";
++                        break;
++                    case ResultWas::ExplicitFailure:
++                        passOrFail =3D "FAILED";
++                        colour =3D Colour::Error;
++                        if( _stats.infoMessages.size() =3D=3D 1 )
++                            messageLabel =3D "explicitly with message";
++                        if( _stats.infoMessages.size() > 1 )
++                            messageLabel =3D "explicitly with messages";
++                        break;
++                    // These cases are here to prevent compiler warnings
++                    case ResultWas::Unknown:
++                    case ResultWas::FailureBit:
++                    case ResultWas::Exception:
++                        passOrFail =3D "** internal error **";
++                        colour =3D Colour::Error;
++                        break;
++                }
++            }
++
++            void print() const {
++                printSourceInfo();
++                if( stats.totals.assertions.total() > 0 ) {
++                    if( result.isOk() )
++                        stream << '\n';
++                    printResultType();
++                    printOriginalExpression();
++                    printReconstructedExpression();
++                }
++                else {
++                    stream << '\n';
++                }
++                printMessage();
++            }
++
++        private:
++            void printResultType() const {
++                if( !passOrFail.empty() ) {
++                    Colour colourGuard( colour );
++                    stream << passOrFail << ":\n";
++                }
++            }
++            void printOriginalExpression() const {
++                if( result.hasExpression() ) {
++                    Colour colourGuard( Colour::OriginalExpression );
++                    stream  << "  ";
++                    stream << result.getExpressionInMacro();
++                    stream << '\n';
++                }
++            }
++            void printReconstructedExpression() const {
++                if( result.hasExpandedExpression() ) {
++                    stream << "with expansion:\n";
++                    Colour colourGuard( Colour::ReconstructedExpression );
++                    stream << Text( result.getExpandedExpression(), TextA=
ttributes().setIndent(2) ) << '\n';
++                }
++            }
++            void printMessage() const {
++                if( !messageLabel.empty() )
++                    stream << messageLabel << ':' << '\n';
++                for( std::vector<MessageInfo>::const_iterator it =3D mess=
ages.begin(), itEnd =3D messages.end();
++                        it !=3D itEnd;
++                        ++it ) {
++                    // If this assertion is a warning ignore any INFO mes=
sages
++                    if( printInfoMessages || it->type !=3D ResultWas::Inf=
o )
++                        stream << Text( it->message, TextAttributes().set=
Indent(2) ) << '\n';
++                }
++            }
++            void printSourceInfo() const {
++                Colour colourGuard( Colour::FileName );
++                stream << result.getSourceInfo() << ": ";
++            }
++
++            std::ostream& stream;
++            AssertionStats const& stats;
++            AssertionResult const& result;
++            Colour::Code colour;
++            std::string passOrFail;
++            std::string messageLabel;
++            std::string message;
++            std::vector<MessageInfo> messages;
++            bool printInfoMessages;
++        };
++
++        void lazyPrint() {
++
++            if( !currentTestRunInfo.used )
++                lazyPrintRunInfo();
++            if( !currentGroupInfo.used )
++                lazyPrintGroupInfo();
++
++            if( !m_headerPrinted ) {
++                printTestCaseAndSectionHeader();
++                m_headerPrinted =3D true;
++            }
++        }
++        void lazyPrintRunInfo() {
++            stream  << '\n' << getLineOfChars<'~'>() << '\n';
++            Colour colour( Colour::SecondaryText );
++            stream  << currentTestRunInfo->name
++                    << " is a Catch v"  << libraryVersion() << " host app=
lication.\n"
++                    << "Run with -? for options\n\n";
++
++            if( m_config->rngSeed() !=3D 0 )
++                stream << "Randomness seeded to: " << m_config->rngSeed()=
 << "\n\n";
++
++            currentTestRunInfo.used =3D true;
++        }
++        void lazyPrintGroupInfo() {
++            if( !currentGroupInfo->name.empty() && currentGroupInfo->grou=
psCounts > 1 ) {
++                printClosedHeader( "Group: " + currentGroupInfo->name );
++                currentGroupInfo.used =3D true;
++            }
++        }
++        void printTestCaseAndSectionHeader() {
++            assert( !m_sectionStack.empty() );
++            printOpenHeader( currentTestCaseInfo->name );
++
++            if( m_sectionStack.size() > 1 ) {
++                Colour colourGuard( Colour::Headers );
++
++                std::vector<SectionInfo>::const_iterator
++                    it =3D m_sectionStack.begin()+1, // Skip first sectio=
n (test case)
++                    itEnd =3D m_sectionStack.end();
++                for( ; it !=3D itEnd; ++it )
++                    printHeaderString( it->name, 2 );
++            }
++
++            SourceLineInfo lineInfo =3D m_sectionStack.back().lineInfo;
++
++            if( !lineInfo.empty() ){
++                stream << getLineOfChars<'-'>() << '\n';
++                Colour colourGuard( Colour::FileName );
++                stream << lineInfo << '\n';
++            }
++            stream << getLineOfChars<'.'>() << '\n' << std::endl;
++        }
++
++        void printClosedHeader( std::string const& _name ) {
++            printOpenHeader( _name );
++            stream << getLineOfChars<'.'>() << '\n';
++        }
++        void printOpenHeader( std::string const& _name ) {
++            stream  << getLineOfChars<'-'>() << '\n';
++            {
++                Colour colourGuard( Colour::Headers );
++                printHeaderString( _name );
++            }
++        }
++
++        // if string has a : in first line will set indent to follow it on
++        // subsequent lines
++        void printHeaderString( std::string const& _string, std::size_t i=
ndent =3D 0 ) {
++            std::size_t i =3D _string.find( ": " );
++            if( i !=3D std::string::npos )
++                i+=3D2;
++            else
++                i =3D 0;
++            stream << Text( _string, TextAttributes()
++                                        .setIndent( indent+i)
++                                        .setInitialIndent( indent ) ) << =
'\n';
++        }
++
++        struct SummaryColumn {
++
++            SummaryColumn( std::string const& _label, Colour::Code _colou=
r )
++            :   label( _label ),
++                colour( _colour )
++            {}
++            SummaryColumn addRow( std::size_t count ) {
++                std::ostringstream oss;
++                oss << count;
++                std::string row =3D oss.str();
++                for( std::vector<std::string>::iterator it =3D rows.begin=
(); it !=3D rows.end(); ++it ) {
++                    while( it->size() < row.size() )
++                        *it =3D ' ' + *it;
++                    while( it->size() > row.size() )
++                        row =3D ' ' + row;
++                }
++                rows.push_back( row );
++                return *this;
++            }
++
++            std::string label;
++            Colour::Code colour;
++            std::vector<std::string> rows;
++
++        };
++
++        void printTotals( Totals const& totals ) {
++            if( totals.testCases.total() =3D=3D 0 ) {
++                stream << Colour( Colour::Warning ) << "No tests ran\n";
++            }
++            else if( totals.assertions.total() > 0 && totals.testCases.al=
lPassed() ) {
++                stream << Colour( Colour::ResultSuccess ) << "All tests p=
assed";
++                stream << " ("
++                        << pluralise( totals.assertions.passed, "assertio=
n" ) << " in "
++                        << pluralise( totals.testCases.passed, "test case=
" ) << ')'
++                        << '\n';
++            }
++            else {
++
++                std::vector<SummaryColumn> columns;
++                columns.push_back( SummaryColumn( "", Colour::None )
++                                        .addRow( totals.testCases.total()=
 )
++                                        .addRow( totals.assertions.total(=
) ) );
++                columns.push_back( SummaryColumn( "passed", Colour::Succe=
ss )
++                                        .addRow( totals.testCases.passed )
++                                        .addRow( totals.assertions.passed=
 ) );
++                columns.push_back( SummaryColumn( "failed", Colour::Resul=
tError )
++                                        .addRow( totals.testCases.failed )
++                                        .addRow( totals.assertions.failed=
 ) );
++                columns.push_back( SummaryColumn( "failed as expected", C=
olour::ResultExpectedFailure )
++                                        .addRow( totals.testCases.failedB=
utOk )
++                                        .addRow( totals.assertions.failed=
ButOk ) );
++
++                printSummaryRow( "test cases", columns, 0 );
++                printSummaryRow( "assertions", columns, 1 );
++            }
++        }
++        void printSummaryRow( std::string const& label, std::vector<Summa=
ryColumn> const& cols, std::size_t row ) {
++            for( std::vector<SummaryColumn>::const_iterator it =3D cols.b=
egin(); it !=3D cols.end(); ++it ) {
++                std::string value =3D it->rows[row];
++                if( it->label.empty() ) {
++                    stream << label << ": ";
++                    if( value !=3D "0" )
++                        stream << value;
++                    else
++                        stream << Colour( Colour::Warning ) << "- none -";
++                }
++                else if( value !=3D "0" ) {
++                    stream  << Colour( Colour::LightGrey ) << " | ";
++                    stream  << Colour( it->colour )
++                            << value << ' ' << it->label;
++                }
++            }
++            stream << '\n';
++        }
++
++        static std::size_t makeRatio( std::size_t number, std::size_t tot=
al ) {
++            std::size_t ratio =3D total > 0 ? CATCH_CONFIG_CONSOLE_WIDTH =
* number/ total : 0;
++            return ( ratio =3D=3D 0 && number > 0 ) ? 1 : ratio;
++        }
++        static std::size_t& findMax( std::size_t& i, std::size_t& j, std:=
:size_t& k ) {
++            if( i > j && i > k )
++                return i;
++            else if( j > k )
++                return j;
++            else
++                return k;
++        }
++
++        void printTotalsDivider( Totals const& totals ) {
++            if( totals.testCases.total() > 0 ) {
++                std::size_t failedRatio =3D makeRatio( totals.testCases.f=
ailed, totals.testCases.total() );
++                std::size_t failedButOkRatio =3D makeRatio( totals.testCa=
ses.failedButOk, totals.testCases.total() );
++                std::size_t passedRatio =3D makeRatio( totals.testCases.p=
assed, totals.testCases.total() );
++                while( failedRatio + failedButOkRatio + passedRatio < CAT=
CH_CONFIG_CONSOLE_WIDTH-1 )
++                    findMax( failedRatio, failedButOkRatio, passedRatio )=
++;
++                while( failedRatio + failedButOkRatio + passedRatio > CAT=
CH_CONFIG_CONSOLE_WIDTH-1 )
++                    findMax( failedRatio, failedButOkRatio, passedRatio )=
--;
++
++                stream << Colour( Colour::Error ) << std::string( failedR=
atio, '=3D' );
++                stream << Colour( Colour::ResultExpectedFailure ) << std:=
:string( failedButOkRatio, '=3D' );
++                if( totals.testCases.allPassed() )
++                    stream << Colour( Colour::ResultSuccess ) << std::str=
ing( passedRatio, '=3D' );
++                else
++                    stream << Colour( Colour::Success ) << std::string( p=
assedRatio, '=3D' );
++            }
++            else {
++                stream << Colour( Colour::Warning ) << std::string( CATCH=
_CONFIG_CONSOLE_WIDTH-1, '=3D' );
++            }
++            stream << '\n';
++        }
++        void printSummaryDivider() {
++            stream << getLineOfChars<'-'>() << '\n';
++        }
++
++    private:
++        bool m_headerPrinted;
++    };
++
++    INTERNAL_CATCH_REGISTER_REPORTER( "console", ConsoleReporter )
++
++} // end namespace Catch
++
++// #included from: ../reporters/catch_reporter_compact.hpp
++#define TWOBLUECUBES_CATCH_REPORTER_COMPACT_HPP_INCLUDED
++
++namespace Catch {
++
++    struct CompactReporter : StreamingReporterBase {
++
++        CompactReporter( ReporterConfig const& _config )
++        : StreamingReporterBase( _config )
++        {}
++
++        virtual ~CompactReporter();
++
++        static std::string getDescription() {
++            return "Reports test results on a single line, suitable for I=
DEs";
++        }
++
++        virtual ReporterPreferences getPreferences() const {
++            ReporterPreferences prefs;
++            prefs.shouldRedirectStdOut =3D false;
++            return prefs;
++        }
++
++        virtual void noMatchingTestCases( std::string const& spec ) {
++            stream << "No test cases matched '" << spec << '\'' << std::e=
ndl;
++        }
++
++        virtual void assertionStarting( AssertionInfo const& ) {}
++
++        virtual bool assertionEnded( AssertionStats const& _assertionStat=
s ) {
++            AssertionResult const& result =3D _assertionStats.assertionRe=
sult;
++
++            bool printInfoMessages =3D true;
++
++            // Drop out if result was successful and we're not printing t=
hose
++            if( !m_config->includeSuccessfulResults() && result.isOk() ) {
++                if( result.getResultType() !=3D ResultWas::Warning )
++                    return false;
++                printInfoMessages =3D false;
++            }
++
++            AssertionPrinter printer( stream, _assertionStats, printInfoM=
essages );
++            printer.print();
++
++            stream << std::endl;
++            return true;
++        }
++
++        virtual void sectionEnded(SectionStats const& _sectionStats) CATC=
H_OVERRIDE {
++            if (m_config->showDurations() =3D=3D ShowDurations::Always) {
++                stream << getFormattedDuration(_sectionStats.durationInSe=
conds) << " s: " << _sectionStats.sectionInfo.name << std::endl;
++            }
++        }
++
++        virtual void testRunEnded( TestRunStats const& _testRunStats ) {
++            printTotals( _testRunStats.totals );
++            stream << '\n' << std::endl;
++            StreamingReporterBase::testRunEnded( _testRunStats );
++        }
++
++    private:
++        class AssertionPrinter {
++            void operator=3D ( AssertionPrinter const& );
++        public:
++            AssertionPrinter( std::ostream& _stream, AssertionStats const=
& _stats, bool _printInfoMessages )
++            : stream( _stream )
++            , stats( _stats )
++            , result( _stats.assertionResult )
++            , messages( _stats.infoMessages )
++            , itMessage( _stats.infoMessages.begin() )
++            , printInfoMessages( _printInfoMessages )
++            {}
++
++            void print() {
++                printSourceInfo();
++
++                itMessage =3D messages.begin();
++
++                switch( result.getResultType() ) {
++                    case ResultWas::Ok:
++                        printResultType( Colour::ResultSuccess, passedStr=
ing() );
++                        printOriginalExpression();
++                        printReconstructedExpression();
++                        if ( ! result.hasExpression() )
++                            printRemainingMessages( Colour::None );
++                        else
++                            printRemainingMessages();
++                        break;
++                    case ResultWas::ExpressionFailed:
++                        if( result.isOk() )
++                            printResultType( Colour::ResultSuccess, faile=
dString() + std::string( " - but was ok" ) );
++                        else
++                            printResultType( Colour::Error, failedString(=
) );
++                        printOriginalExpression();
++                        printReconstructedExpression();
++                        printRemainingMessages();
++                        break;
++                    case ResultWas::ThrewException:
++                        printResultType( Colour::Error, failedString() );
++                        printIssue( "unexpected exception with message:" =
);
++                        printMessage();
++                        printExpressionWas();
++                        printRemainingMessages();
++                        break;
++                    case ResultWas::FatalErrorCondition:
++                        printResultType( Colour::Error, failedString() );
++                        printIssue( "fatal error condition with message:"=
 );
++                        printMessage();
++                        printExpressionWas();
++                        printRemainingMessages();
++                        break;
++                    case ResultWas::DidntThrowException:
++                        printResultType( Colour::Error, failedString() );
++                        printIssue( "expected exception, got none" );
++                        printExpressionWas();
++                        printRemainingMessages();
++                        break;
++                    case ResultWas::Info:
++                        printResultType( Colour::None, "info" );
++                        printMessage();
++                        printRemainingMessages();
++                        break;
++                    case ResultWas::Warning:
++                        printResultType( Colour::None, "warning" );
++                        printMessage();
++                        printRemainingMessages();
++                        break;
++                    case ResultWas::ExplicitFailure:
++                        printResultType( Colour::Error, failedString() );
++                        printIssue( "explicitly" );
++                        printRemainingMessages( Colour::None );
++                        break;
++                    // These cases are here to prevent compiler warnings
++                    case ResultWas::Unknown:
++                    case ResultWas::FailureBit:
++                    case ResultWas::Exception:
++                        printResultType( Colour::Error, "** internal erro=
r **" );
++                        break;
++                }
++            }
++
++        private:
++            // Colour::LightGrey
++
++            static Colour::Code dimColour() { return Colour::FileName; }
++
++#ifdef CATCH_PLATFORM_MAC
++            static const char* failedString() { return "FAILED"; }
++            static const char* passedString() { return "PASSED"; }
++#else
++            static const char* failedString() { return "failed"; }
++            static const char* passedString() { return "passed"; }
++#endif
++
++            void printSourceInfo() const {
++                Colour colourGuard( Colour::FileName );
++                stream << result.getSourceInfo() << ':';
++            }
++
++            void printResultType( Colour::Code colour, std::string const&=
 passOrFail ) const {
++                if( !passOrFail.empty() ) {
++                    {
++                        Colour colourGuard( colour );
++                        stream << ' ' << passOrFail;
++                    }
++                    stream << ':';
++                }
++            }
++
++            void printIssue( std::string const& issue ) const {
++                stream << ' ' << issue;
++            }
++
++            void printExpressionWas() {
++                if( result.hasExpression() ) {
++                    stream << ';';
++                    {
++                        Colour colour( dimColour() );
++                        stream << " expression was:";
++                    }
++                    printOriginalExpression();
++                }
++            }
++
++            void printOriginalExpression() const {
++                if( result.hasExpression() ) {
++                    stream << ' ' << result.getExpression();
++                }
++            }
++
++            void printReconstructedExpression() const {
++                if( result.hasExpandedExpression() ) {
++                    {
++                        Colour colour( dimColour() );
++                        stream << " for: ";
++                    }
++                    stream << result.getExpandedExpression();
++                }
++            }
++
++            void printMessage() {
++                if ( itMessage !=3D messages.end() ) {
++                    stream << " '" << itMessage->message << '\'';
++                    ++itMessage;
++                }
++            }
++
++            void printRemainingMessages( Colour::Code colour =3D dimColou=
r() ) {
++                if ( itMessage =3D=3D messages.end() )
++                    return;
++
++                // using messages.end() directly yields compilation error:
++                std::vector<MessageInfo>::const_iterator itEnd =3D messag=
es.end();
++                const std::size_t N =3D static_cast<std::size_t>( std::di=
stance( itMessage, itEnd ) );
++
++                {
++                    Colour colourGuard( colour );
++                    stream << " with " << pluralise( N, "message" ) << ':=
';
++                }
++
++                for(; itMessage !=3D itEnd; ) {
++                    // If this assertion is a warning ignore any INFO mes=
sages
++                    if( printInfoMessages || itMessage->type !=3D ResultW=
as::Info ) {
++                        stream << " '" << itMessage->message << '\'';
++                        if ( ++itMessage !=3D itEnd ) {
++                            Colour colourGuard( dimColour() );
++                            stream << " and";
++                        }
++                    }
++                }
++            }
++
++        private:
++            std::ostream& stream;
++            AssertionStats const& stats;
++            AssertionResult const& result;
++            std::vector<MessageInfo> messages;
++            std::vector<MessageInfo>::const_iterator itMessage;
++            bool printInfoMessages;
++        };
++
++        // Colour, message variants:
++        // - white: No tests ran.
++        // -   red: Failed [both/all] N test cases, failed [both/all] M a=
ssertions.
++        // - white: Passed [both/all] N test cases (no assertions).
++        // -   red: Failed N tests cases, failed M assertions.
++        // - green: Passed [both/all] N tests cases with M assertions.
++
++        std::string bothOrAll( std::size_t count ) const {
++            return count =3D=3D 1 ? std::string() : count =3D=3D 2 ? "bot=
h " : "all " ;
++        }
++
++        void printTotals( const Totals& totals ) const {
++            if( totals.testCases.total() =3D=3D 0 ) {
++                stream << "No tests ran.";
++            }
++            else if( totals.testCases.failed =3D=3D totals.testCases.tota=
l() ) {
++                Colour colour( Colour::ResultError );
++                const std::string qualify_assertions_failed =3D
++                    totals.assertions.failed =3D=3D totals.assertions.tot=
al() ?
++                        bothOrAll( totals.assertions.failed ) : std::stri=
ng();
++                stream <<
++                    "Failed " << bothOrAll( totals.testCases.failed )
++                              << pluralise( totals.testCases.failed, "tes=
t case"  ) << ", "
++                    "failed " << qualify_assertions_failed <<
++                                 pluralise( totals.assertions.failed, "as=
sertion" ) << '.';
++            }
++            else if( totals.assertions.total() =3D=3D 0 ) {
++                stream <<
++                    "Passed " << bothOrAll( totals.testCases.total() )
++                              << pluralise( totals.testCases.total(), "te=
st case" )
++                              << " (no assertions).";
++            }
++            else if( totals.assertions.failed ) {
++                Colour colour( Colour::ResultError );
++                stream <<
++                    "Failed " << pluralise( totals.testCases.failed, "tes=
t case"  ) << ", "
++                    "failed " << pluralise( totals.assertions.failed, "as=
sertion" ) << '.';
++            }
++            else {
++                Colour colour( Colour::ResultSuccess );
++                stream <<
++                    "Passed " << bothOrAll( totals.testCases.passed )
++                              << pluralise( totals.testCases.passed, "tes=
t case"  ) <<
++                    " with "  << pluralise( totals.assertions.passed, "as=
sertion" ) << '.';
++            }
++        }
++    };
++
++    INTERNAL_CATCH_REGISTER_REPORTER( "compact", CompactReporter )
++
++} // end namespace Catch
++
++namespace Catch {
++    // These are all here to avoid warnings about not having any out of l=
ine
++    // virtual methods
++    NonCopyable::~NonCopyable() {}
++    IShared::~IShared() {}
++    IStream::~IStream() CATCH_NOEXCEPT {}
++    FileStream::~FileStream() CATCH_NOEXCEPT {}
++    CoutStream::~CoutStream() CATCH_NOEXCEPT {}
++    DebugOutStream::~DebugOutStream() CATCH_NOEXCEPT {}
++    StreamBufBase::~StreamBufBase() CATCH_NOEXCEPT {}
++    IContext::~IContext() {}
++    IResultCapture::~IResultCapture() {}
++    ITestCase::~ITestCase() {}
++    ITestCaseRegistry::~ITestCaseRegistry() {}
++    IRegistryHub::~IRegistryHub() {}
++    IMutableRegistryHub::~IMutableRegistryHub() {}
++    IExceptionTranslator::~IExceptionTranslator() {}
++    IExceptionTranslatorRegistry::~IExceptionTranslatorRegistry() {}
++    IReporter::~IReporter() {}
++    IReporterFactory::~IReporterFactory() {}
++    IReporterRegistry::~IReporterRegistry() {}
++    IStreamingReporter::~IStreamingReporter() {}
++    AssertionStats::~AssertionStats() {}
++    SectionStats::~SectionStats() {}
++    TestCaseStats::~TestCaseStats() {}
++    TestGroupStats::~TestGroupStats() {}
++    TestRunStats::~TestRunStats() {}
++    CumulativeReporterBase::SectionNode::~SectionNode() {}
++    CumulativeReporterBase::~CumulativeReporterBase() {}
++
++    StreamingReporterBase::~StreamingReporterBase() {}
++    ConsoleReporter::~ConsoleReporter() {}
++    CompactReporter::~CompactReporter() {}
++    IRunner::~IRunner() {}
++    IMutableContext::~IMutableContext() {}
++    IConfig::~IConfig() {}
++    XmlReporter::~XmlReporter() {}
++    JunitReporter::~JunitReporter() {}
++    TestRegistry::~TestRegistry() {}
++    FreeFunctionTestCase::~FreeFunctionTestCase() {}
++    IGeneratorInfo::~IGeneratorInfo() {}
++    IGeneratorsForTest::~IGeneratorsForTest() {}
++    WildcardPattern::~WildcardPattern() {}
++    TestSpec::Pattern::~Pattern() {}
++    TestSpec::NamePattern::~NamePattern() {}
++    TestSpec::TagPattern::~TagPattern() {}
++    TestSpec::ExcludedPattern::~ExcludedPattern() {}
++    Matchers::Impl::MatcherUntypedBase::~MatcherUntypedBase() {}
++
++    void Config::dummy() {}
++
++    namespace TestCaseTracking {
++        ITracker::~ITracker() {}
++        TrackerBase::~TrackerBase() {}
++        SectionTracker::~SectionTracker() {}
++        IndexTracker::~IndexTracker() {}
++    }
++}
++
++#ifdef __clang__
++#pragma clang diagnostic pop
++#endif
++
++#endif
++
++#ifdef CATCH_CONFIG_MAIN
++// #included from: internal/catch_default_main.hpp
++#define TWOBLUECUBES_CATCH_DEFAULT_MAIN_HPP_INCLUDED
++
++#ifndef __OBJC__
++
++#if defined(WIN32) && defined(_UNICODE) && !defined(DO_NOT_USE_WMAIN)
++// Standard C/C++ Win32 Unicode wmain entry point
++extern "C" int wmain (int argc, wchar_t * argv[], wchar_t * []) {
++#else
++// Standard C/C++ main entry point
++int main (int argc, char * argv[]) {
++#endif
++
++    int result =3D Catch::Session().run( argc, argv );
++    return ( result < 0xff ? result : 0xff );
++}
++
++#else // __OBJC__
++
++// Objective-C entry point
++int main (int argc, char * const argv[]) {
++#if !CATCH_ARC_ENABLED
++    NSAutoreleasePool * pool =3D [[NSAutoreleasePool alloc] init];
++#endif
++
++    Catch::registerTestMethods();
++    int result =3D Catch::Session().run( argc, (char* const*)argv );
++
++#if !CATCH_ARC_ENABLED
++    [pool drain];
++#endif
++
++    return ( result < 0xff ? result : 0xff );
++}
++
++#endif // __OBJC__
++
++#endif
++
++#ifdef CLARA_CONFIG_MAIN_NOT_DEFINED
++#  undef CLARA_CONFIG_MAIN
++#endif
++
++//////
++
++// If this config identifier is defined then all CATCH macros are prefixe=
d with CATCH_
++#ifdef CATCH_CONFIG_PREFIX_ALL
++
++#if defined(CATCH_CONFIG_FAST_COMPILE)
++#define CATCH_REQUIRE( expr ) INTERNAL_CATCH_TEST_NO_TRY( "CATCH_REQUIRE"=
, Catch::ResultDisposition::Normal, expr )
++#define CATCH_REQUIRE_FALSE( expr ) INTERNAL_CATCH_TEST_NO_TRY( "CATCH_RE=
QUIRE_FALSE", Catch::ResultDisposition::Normal | Catch::ResultDisposition::=
FalseTest, expr )
++#else
++#define CATCH_REQUIRE( expr ) INTERNAL_CATCH_TEST( "CATCH_REQUIRE", Catch=
::ResultDisposition::Normal, expr )
++#define CATCH_REQUIRE_FALSE( expr ) INTERNAL_CATCH_TEST( "CATCH_REQUIRE_F=
ALSE", Catch::ResultDisposition::Normal | Catch::ResultDisposition::FalseTe=
st, expr  )
++#endif
++
++#define CATCH_REQUIRE_THROWS( expr ) INTERNAL_CATCH_THROWS( "CATCH_REQUIR=
E_THROWS", Catch::ResultDisposition::Normal, "", expr )
++#define CATCH_REQUIRE_THROWS_AS( expr, exceptionType ) INTERNAL_CATCH_THR=
OWS_AS( "CATCH_REQUIRE_THROWS_AS", exceptionType, Catch::ResultDisposition:=
:Normal, expr )
++#define CATCH_REQUIRE_THROWS_WITH( expr, matcher ) INTERNAL_CATCH_THROWS(=
 "CATCH_REQUIRE_THROWS_WITH", Catch::ResultDisposition::Normal, matcher, ex=
pr )
++#define CATCH_REQUIRE_NOTHROW( expr ) INTERNAL_CATCH_NO_THROW( "CATCH_REQ=
UIRE_NOTHROW", Catch::ResultDisposition::Normal, expr )
++
++#define CATCH_CHECK( expr ) INTERNAL_CATCH_TEST( "CATCH_CHECK", Catch::Re=
sultDisposition::ContinueOnFailure, expr )
++#define CATCH_CHECK_FALSE( expr ) INTERNAL_CATCH_TEST( "CATCH_CHECK_FALSE=
", Catch::ResultDisposition::ContinueOnFailure | Catch::ResultDisposition::=
FalseTest, expr )
++#define CATCH_CHECKED_IF( expr ) INTERNAL_CATCH_IF( "CATCH_CHECKED_IF", C=
atch::ResultDisposition::ContinueOnFailure, expr )
++#define CATCH_CHECKED_ELSE( expr ) INTERNAL_CATCH_ELSE( "CATCH_CHECKED_EL=
SE", Catch::ResultDisposition::ContinueOnFailure, expr )
++#define CATCH_CHECK_NOFAIL( expr ) INTERNAL_CATCH_TEST( "CATCH_CHECK_NOFA=
IL", Catch::ResultDisposition::ContinueOnFailure | Catch::ResultDisposition=
::SuppressFail, expr )
++
++#define CATCH_CHECK_THROWS( expr )  INTERNAL_CATCH_THROWS( "CATCH_CHECK_T=
HROWS", Catch::ResultDisposition::ContinueOnFailure, "", expr )
++#define CATCH_CHECK_THROWS_AS( expr, exceptionType ) INTERNAL_CATCH_THROW=
S_AS( "CATCH_CHECK_THROWS_AS", exceptionType, Catch::ResultDisposition::Con=
tinueOnFailure, expr )
++#define CATCH_CHECK_THROWS_WITH( expr, matcher ) INTERNAL_CATCH_THROWS( "=
CATCH_CHECK_THROWS_WITH", Catch::ResultDisposition::ContinueOnFailure, matc=
her, expr )
++#define CATCH_CHECK_NOTHROW( expr ) INTERNAL_CATCH_NO_THROW( "CATCH_CHECK=
_NOTHROW", Catch::ResultDisposition::ContinueOnFailure, expr )
++
++#define CATCH_CHECK_THAT( arg, matcher ) INTERNAL_CHECK_THAT( "CATCH_CHEC=
K_THAT", matcher, Catch::ResultDisposition::ContinueOnFailure, arg )
++
++#if defined(CATCH_CONFIG_FAST_COMPILE)
++#define CATCH_REQUIRE_THAT( arg, matcher ) INTERNAL_CHECK_THAT_NO_TRY( "C=
ATCH_REQUIRE_THAT", matcher, Catch::ResultDisposition::Normal, arg )
++#else
++#define CATCH_REQUIRE_THAT( arg, matcher ) INTERNAL_CHECK_THAT( "CATCH_RE=
QUIRE_THAT", matcher, Catch::ResultDisposition::Normal, arg )
++#endif
++
++#define CATCH_INFO( msg ) INTERNAL_CATCH_INFO( "CATCH_INFO", msg )
++#define CATCH_WARN( msg ) INTERNAL_CATCH_MSG( "CATCH_WARN", Catch::Result=
Was::Warning, Catch::ResultDisposition::ContinueOnFailure, msg )
++#define CATCH_SCOPED_INFO( msg ) INTERNAL_CATCH_INFO( "CATCH_INFO", msg )
++#define CATCH_CAPTURE( msg ) INTERNAL_CATCH_INFO( "CATCH_CAPTURE", #msg "=
 :=3D " << Catch::toString(msg) )
++#define CATCH_SCOPED_CAPTURE( msg ) INTERNAL_CATCH_INFO( "CATCH_CAPTURE",=
 #msg " :=3D " << Catch::toString(msg) )
++
++#ifdef CATCH_CONFIG_VARIADIC_MACROS
++    #define CATCH_TEST_CASE( ... ) INTERNAL_CATCH_TESTCASE( __VA_ARGS__ )
++    #define CATCH_TEST_CASE_METHOD( className, ... ) INTERNAL_CATCH_TEST_=
CASE_METHOD( className, __VA_ARGS__ )
++    #define CATCH_METHOD_AS_TEST_CASE( method, ... ) INTERNAL_CATCH_METHO=
D_AS_TEST_CASE( method, __VA_ARGS__ )
++    #define CATCH_REGISTER_TEST_CASE( Function, ... ) INTERNAL_CATCH_REGI=
STER_TESTCASE( Function, __VA_ARGS__ )
++    #define CATCH_SECTION( ... ) INTERNAL_CATCH_SECTION( __VA_ARGS__ )
++    #define CATCH_FAIL( ... ) INTERNAL_CATCH_MSG( "CATCH_FAIL", Catch::Re=
sultWas::ExplicitFailure, Catch::ResultDisposition::Normal, __VA_ARGS__ )
++    #define CATCH_FAIL_CHECK( ... ) INTERNAL_CATCH_MSG( "CATCH_FAIL_CHECK=
", Catch::ResultWas::ExplicitFailure, Catch::ResultDisposition::ContinueOnF=
ailure, __VA_ARGS__ )
++    #define CATCH_SUCCEED( ... ) INTERNAL_CATCH_MSG( "CATCH_SUCCEED", Cat=
ch::ResultWas::Ok, Catch::ResultDisposition::ContinueOnFailure, __VA_ARGS__=
 )
++#else
++    #define CATCH_TEST_CASE( name, description ) INTERNAL_CATCH_TESTCASE(=
 name, description )
++    #define CATCH_TEST_CASE_METHOD( className, name, description ) INTERN=
AL_CATCH_TEST_CASE_METHOD( className, name, description )
++    #define CATCH_METHOD_AS_TEST_CASE( method, name, description ) INTERN=
AL_CATCH_METHOD_AS_TEST_CASE( method, name, description )
++    #define CATCH_REGISTER_TEST_CASE( function, name, description ) INTER=
NAL_CATCH_REGISTER_TESTCASE( function, name, description )
++    #define CATCH_SECTION( name, description ) INTERNAL_CATCH_SECTION( na=
me, description )
++    #define CATCH_FAIL( msg ) INTERNAL_CATCH_MSG( "CATCH_FAIL", Catch::Re=
sultWas::ExplicitFailure, Catch::ResultDisposition::Normal, msg )
++    #define CATCH_FAIL_CHECK( msg ) INTERNAL_CATCH_MSG( "CATCH_FAIL_CHECK=
", Catch::ResultWas::ExplicitFailure, Catch::ResultDisposition::ContinueOnF=
ailure, msg )
++    #define CATCH_SUCCEED( msg ) INTERNAL_CATCH_MSG( "CATCH_SUCCEED", Cat=
ch::ResultWas::Ok, Catch::ResultDisposition::ContinueOnFailure, msg )
++#endif
++#define CATCH_ANON_TEST_CASE() INTERNAL_CATCH_TESTCASE( "", "" )
++
++#define CATCH_REGISTER_REPORTER( name, reporterType ) INTERNAL_CATCH_REGI=
STER_REPORTER( name, reporterType )
++#define CATCH_REGISTER_LEGACY_REPORTER( name, reporterType ) INTERNAL_CAT=
CH_REGISTER_LEGACY_REPORTER( name, reporterType )
++
++#define CATCH_GENERATE( expr) INTERNAL_CATCH_GENERATE( expr )
++
++// "BDD-style" convenience wrappers
++#ifdef CATCH_CONFIG_VARIADIC_MACROS
++#define CATCH_SCENARIO( ... ) CATCH_TEST_CASE( "Scenario: " __VA_ARGS__ )
++#define CATCH_SCENARIO_METHOD( className, ... ) INTERNAL_CATCH_TEST_CASE_=
METHOD( className, "Scenario: " __VA_ARGS__ )
++#else
++#define CATCH_SCENARIO( name, tags ) CATCH_TEST_CASE( "Scenario: " name, =
tags )
++#define CATCH_SCENARIO_METHOD( className, name, tags ) INTERNAL_CATCH_TES=
T_CASE_METHOD( className, "Scenario: " name, tags )
++#endif
++#define CATCH_GIVEN( desc )    CATCH_SECTION( std::string( "Given: ") + d=
esc, "" )
++#define CATCH_WHEN( desc )     CATCH_SECTION( std::string( " When: ") + d=
esc, "" )
++#define CATCH_AND_WHEN( desc ) CATCH_SECTION( std::string( "  And: ") + d=
esc, "" )
++#define CATCH_THEN( desc )     CATCH_SECTION( std::string( " Then: ") + d=
esc, "" )
++#define CATCH_AND_THEN( desc ) CATCH_SECTION( std::string( "  And: ") + d=
esc, "" )
++
++// If CATCH_CONFIG_PREFIX_ALL is not defined then the CATCH_ prefix is no=
t required
++#else
++
++#if defined(CATCH_CONFIG_FAST_COMPILE)
++#define REQUIRE( expr ) INTERNAL_CATCH_TEST_NO_TRY( "REQUIRE", Catch::Res=
ultDisposition::Normal, expr )
++#define REQUIRE_FALSE( expr ) INTERNAL_CATCH_TEST_NO_TRY( "REQUIRE_FALSE"=
, Catch::ResultDisposition::Normal | Catch::ResultDisposition::FalseTest, e=
xpr )
++
++#else
++#define REQUIRE( expr ) INTERNAL_CATCH_TEST( "REQUIRE", Catch::ResultDisp=
osition::Normal, expr  )
++#define REQUIRE_FALSE( expr ) INTERNAL_CATCH_TEST( "REQUIRE_FALSE", Catch=
::ResultDisposition::Normal | Catch::ResultDisposition::FalseTest, expr )
++#endif
++
++#define REQUIRE_THROWS( expr ) INTERNAL_CATCH_THROWS( "REQUIRE_THROWS", C=
atch::ResultDisposition::Normal, "", expr )
++#define REQUIRE_THROWS_AS( expr, exceptionType ) INTERNAL_CATCH_THROWS_AS=
( "REQUIRE_THROWS_AS", exceptionType, Catch::ResultDisposition::Normal, exp=
r )
++#define REQUIRE_THROWS_WITH( expr, matcher ) INTERNAL_CATCH_THROWS( "REQU=
IRE_THROWS_WITH", Catch::ResultDisposition::Normal, matcher, expr )
++#define REQUIRE_NOTHROW( expr ) INTERNAL_CATCH_NO_THROW( "REQUIRE_NOTHROW=
", Catch::ResultDisposition::Normal, expr )
++
++#define CHECK( expr ) INTERNAL_CATCH_TEST( "CHECK", Catch::ResultDisposit=
ion::ContinueOnFailure, expr )
++#define CHECK_FALSE( expr ) INTERNAL_CATCH_TEST( "CHECK_FALSE", Catch::Re=
sultDisposition::ContinueOnFailure | Catch::ResultDisposition::FalseTest, e=
xpr )
++#define CHECKED_IF( expr ) INTERNAL_CATCH_IF( "CHECKED_IF", Catch::Result=
Disposition::ContinueOnFailure, expr )
++#define CHECKED_ELSE( expr ) INTERNAL_CATCH_ELSE( "CHECKED_ELSE", Catch::=
ResultDisposition::ContinueOnFailure, expr )
++#define CHECK_NOFAIL( expr ) INTERNAL_CATCH_TEST( "CHECK_NOFAIL", Catch::=
ResultDisposition::ContinueOnFailure | Catch::ResultDisposition::SuppressFa=
il, expr )
++
++#define CHECK_THROWS( expr )  INTERNAL_CATCH_THROWS( "CHECK_THROWS", Catc=
h::ResultDisposition::ContinueOnFailure, "", expr )
++#define CHECK_THROWS_AS( expr, exceptionType ) INTERNAL_CATCH_THROWS_AS( =
"CHECK_THROWS_AS", exceptionType, Catch::ResultDisposition::ContinueOnFailu=
re, expr )
++#define CHECK_THROWS_WITH( expr, matcher ) INTERNAL_CATCH_THROWS( "CHECK_=
THROWS_WITH", Catch::ResultDisposition::ContinueOnFailure, matcher, expr )
++#define CHECK_NOTHROW( expr ) INTERNAL_CATCH_NO_THROW( "CHECK_NOTHROW", C=
atch::ResultDisposition::ContinueOnFailure, expr )
++
++#define CHECK_THAT( arg, matcher ) INTERNAL_CHECK_THAT( "CHECK_THAT", mat=
cher, Catch::ResultDisposition::ContinueOnFailure, arg )
++
++#if defined(CATCH_CONFIG_FAST_COMPILE)
++#define REQUIRE_THAT( arg, matcher ) INTERNAL_CHECK_THAT_NO_TRY( "REQUIRE=
_THAT", matcher, Catch::ResultDisposition::Normal, arg )
++#else
++#define REQUIRE_THAT( arg, matcher ) INTERNAL_CHECK_THAT( "REQUIRE_THAT",=
 matcher, Catch::ResultDisposition::Normal, arg )
++#endif
++
++#define INFO( msg ) INTERNAL_CATCH_INFO( "INFO", msg )
++#define WARN( msg ) INTERNAL_CATCH_MSG( "WARN", Catch::ResultWas::Warning=
, Catch::ResultDisposition::ContinueOnFailure, msg )
++#define SCOPED_INFO( msg ) INTERNAL_CATCH_INFO( "INFO", msg )
++#define CAPTURE( msg ) INTERNAL_CATCH_INFO( "CAPTURE", #msg " :=3D " << C=
atch::toString(msg) )
++#define SCOPED_CAPTURE( msg ) INTERNAL_CATCH_INFO( "CAPTURE", #msg " :=3D=
 " << Catch::toString(msg) )
++
++#ifdef CATCH_CONFIG_VARIADIC_MACROS
++#define TEST_CASE( ... ) INTERNAL_CATCH_TESTCASE( __VA_ARGS__ )
++#define TEST_CASE_METHOD( className, ... ) INTERNAL_CATCH_TEST_CASE_METHO=
D( className, __VA_ARGS__ )
++#define METHOD_AS_TEST_CASE( method, ... ) INTERNAL_CATCH_METHOD_AS_TEST_=
CASE( method, __VA_ARGS__ )
++#define REGISTER_TEST_CASE( Function, ... ) INTERNAL_CATCH_REGISTER_TESTC=
ASE( Function, __VA_ARGS__ )
++#define SECTION( ... ) INTERNAL_CATCH_SECTION( __VA_ARGS__ )
++#define FAIL( ... ) INTERNAL_CATCH_MSG( "FAIL", Catch::ResultWas::Explici=
tFailure, Catch::ResultDisposition::Normal, __VA_ARGS__ )
++#define FAIL_CHECK( ... ) INTERNAL_CATCH_MSG( "FAIL_CHECK", Catch::Result=
Was::ExplicitFailure, Catch::ResultDisposition::ContinueOnFailure, __VA_ARG=
S__ )
++#define SUCCEED( ... ) INTERNAL_CATCH_MSG( "SUCCEED", Catch::ResultWas::O=
k, Catch::ResultDisposition::ContinueOnFailure, __VA_ARGS__ )
++#else
++#define TEST_CASE( name, description ) INTERNAL_CATCH_TESTCASE( name, des=
cription )
++    #define TEST_CASE_METHOD( className, name, description ) INTERNAL_CAT=
CH_TEST_CASE_METHOD( className, name, description )
++    #define METHOD_AS_TEST_CASE( method, name, description ) INTERNAL_CAT=
CH_METHOD_AS_TEST_CASE( method, name, description )
++    #define REGISTER_TEST_CASE( method, name, description ) INTERNAL_CATC=
H_REGISTER_TESTCASE( method, name, description )
++    #define SECTION( name, description ) INTERNAL_CATCH_SECTION( name, de=
scription )
++    #define FAIL( msg ) INTERNAL_CATCH_MSG( "FAIL", Catch::ResultWas::Exp=
licitFailure, Catch::ResultDisposition::Normal, msg )
++    #define FAIL_CHECK( msg ) INTERNAL_CATCH_MSG( "FAIL_CHECK", Catch::Re=
sultWas::ExplicitFailure, Catch::ResultDisposition::ContinueOnFailure, msg )
++    #define SUCCEED( msg ) INTERNAL_CATCH_MSG( "SUCCEED", Catch::ResultWa=
s::Ok, Catch::ResultDisposition::ContinueOnFailure, msg )
++#endif
++#define ANON_TEST_CASE() INTERNAL_CATCH_TESTCASE( "", "" )
++
++#define REGISTER_REPORTER( name, reporterType ) INTERNAL_CATCH_REGISTER_R=
EPORTER( name, reporterType )
++#define REGISTER_LEGACY_REPORTER( name, reporterType ) INTERNAL_CATCH_REG=
ISTER_LEGACY_REPORTER( name, reporterType )
++
++#define GENERATE( expr) INTERNAL_CATCH_GENERATE( expr )
++
++#endif
++
++#define CATCH_TRANSLATE_EXCEPTION( signature ) INTERNAL_CATCH_TRANSLATE_E=
XCEPTION( signature )
++
++// "BDD-style" convenience wrappers
++#ifdef CATCH_CONFIG_VARIADIC_MACROS
++#define SCENARIO( ... ) TEST_CASE( "Scenario: " __VA_ARGS__ )
++#define SCENARIO_METHOD( className, ... ) INTERNAL_CATCH_TEST_CASE_METHOD=
( className, "Scenario: " __VA_ARGS__ )
++#else
++#define SCENARIO( name, tags ) TEST_CASE( "Scenario: " name, tags )
++#define SCENARIO_METHOD( className, name, tags ) INTERNAL_CATCH_TEST_CASE=
_METHOD( className, "Scenario: " name, tags )
++#endif
++#define GIVEN( desc )    SECTION( std::string("   Given: ") + desc, "" )
++#define WHEN( desc )     SECTION( std::string("    When: ") + desc, "" )
++#define AND_WHEN( desc ) SECTION( std::string("And when: ") + desc, "" )
++#define THEN( desc )     SECTION( std::string("    Then: ") + desc, "" )
++#define AND_THEN( desc ) SECTION( std::string("     And: ") + desc, "" )
++
++using Catch::Detail::Approx;
++
++// #included from: internal/catch_reenable_warnings.h
++
++#define TWOBLUECUBES_CATCH_REENABLE_WARNINGS_H_INCLUDED
++
++#ifdef __clang__
++#    ifdef __ICC // icpc defines the __clang__ macro
++#        pragma warning(pop)
++#    else
++#        pragma clang diagnostic pop
++#    endif
++#elif defined __GNUC__
++#    pragma GCC diagnostic pop
++#endif
++
++#endif // TWOBLUECUBES_SINGLE_INCLUDE_CATCH_HPP_INCLUDED
++
diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo/0002-catc=
h.hpp-Define-SIGSTKSZ-as-constant.patch b/meta-oe/recipes-devtools/nlohmann=
-fifo/nlohmann-fifo/0002-catch.hpp-Define-SIGSTKSZ-as-constant.patch
new file mode 100644
index 0000000000..dcbbf9dd3f
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo/0002-catch.hpp-D=
efine-SIGSTKSZ-as-constant.patch
@@ -0,0 +1,41 @@
+From 9a3cf8cf44e916cca30cd6c3cfcf6b2f20ce2c06 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 1 Aug 2025 11:22:24 -0700
+Subject: [PATCH 2/2] catch.hpp: Define SIGSTKSZ as constant
+
+This compilation error is occurring because of a change
+in how SIGSTKSZ is defined in newer versions of glibc.
+In older versions, SIGSTKSZ was a compile-time constant,
+but in glibc 2.34 and later, it became a runtime value
+(specifically a function call to sysconf(_SC_SIGSTKSZ)),
+which means it can't be used to declare static arrays
+at file scope.
+
+This is already fixed for Catch2 but for catch-1.x
+this is best we can do, define it to be 16K which is
+the value in glibc 2.33 for all architectures except
+IA ( itanium ) where it was 256K but we do not support
+it in OE
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/thirdparty/catch/catch.hpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/test/thirdparty/catch/catch.hpp b/test/thirdparty/catch/catch=
.hpp
+index fdb046f..1e444a4 100644
+--- a/test/thirdparty/catch/catch.hpp
++++ b/test/thirdparty/catch/catch.hpp
+@@ -6519,6 +6519,11 @@ namespace Catch {
+=20
+ #include <signal.h>
+=20
++#ifdef SIGSTKSZ
++#undef SIGSTKSZ
++#define SIGSTKSZ 16384 // 16K bytes
++#endif
++
+ namespace Catch {
+=20
+     struct SignalDefs {
diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/=
meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
index ec87535ec7..9b42ea17f5 100644
--- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -4,8 +4,10 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.MIT;md5=3Db67209a1e36b682a8226de19d26=
5b1e0"
=20
-SRC_URI =3D "git://github.com/nlohmann/fifo_map.git;branch=3Dmaster;protoc=
ol=3Dhttps"
-
+SRC_URI =3D "git://github.com/nlohmann/fifo_map.git;branch=3Dmaster;protoc=
ol=3Dhttps \
+           file://0001-catch.hpp-Upgrade-to-latest-from-Catch-v1.12.2.patc=
h \
+           file://0002-catch.hpp-Define-SIGSTKSZ-as-constant.patch \
+          "
 PV =3D "1.0.0+git"
=20
 SRCREV =3D "d732aaf9a315415ae8fd7eb11e3a4c1f80e42a48"

