Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA1AC433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:46 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.4575.1649155290113240096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=buRGQ+fu;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id bq8so25751339ejb.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5J+T6+FlZ/3HsDHcNgj39LRvxsstwUfGjJibznQIcOc=;
        b=buRGQ+fugQ199QSuQ906Jw71isOxB9s5DgzHjLnl387k8sBi/qjoMfktrqy9Djy+kG
         YEthwqqpt4mFEswbSgmJ9WrAQRuGeMPYeNPxJJMv8blf8bqUwh18cFhVU1xiDth6/lSq
         uZ71G1ASDuBWiHky53HXvSuSvurxNgBSizGG57wedMCOerQTBjzNuo5w2MNlU54oQ+FC
         Ytgl/0S2s5UTneGEnPFUYbIJj+gg7T2BshJR8ji5TpEMny0ezTa4cjABeLwyW7hYFTDO
         BiVcWX0PbOPOMqSuUm8tpNucQqFDtvM6QMRlF+fvSb9Iz+sol8ImLsgm1kyFxHqILnms
         teXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5J+T6+FlZ/3HsDHcNgj39LRvxsstwUfGjJibznQIcOc=;
        b=CCBPSNoOtMMhoG7S1M5uZ+s19MRpuUpBsOtg0j2Dz/5zT//ZiNyAA+GxfaipwxxiyD
         HJbjbVKeZ6QH+69LLQlt96fLEwrEhAMmet9zGeEZYL7XUCunK/XepXybFrXu3T7wzoGi
         M9v3gUlTsxw0hppq+q8muwUQqprDNynbh1Xor2XFGCjQ+YYxaC9ZBhNPmvsRruntBaWv
         Mdu7Mm7odxzkqQ6ke8/jzTEpFahvHtxvt4f5R9N5ZQemOx13fEdbQZgHL9yCE4a+As2r
         qbgNAwHbpNj1YCeNjG53draWJhlEdeaV0v+0+uAfiNR6eXln8KkpTaX+OoQCAL1p5qu1
         EQ4A==
X-Gm-Message-State: AOAM5333F/5hq2JxwDHTKItZ2WaRw6T8N7Vk/zNIyOBMKFVi6uxutjBn
	uC0cZLm2GeOHZNvlHv7Xt5llxLqFhnKK3g==
X-Google-Smtp-Source: 
 ABdhPJzc6mxA/8iNCj3F87NPM0I3AYuhu6WmN7qRDfSanhbHPF6o0vNawQAQBNU3b6BgoGvfoTlIIg==
X-Received: by 2002:a17:907:dab:b0:6df:e51a:b990 with SMTP id
 go43-20020a1709070dab00b006dfe51ab990mr2715102ejc.573.1649155288393;
        Tue, 05 Apr 2022 03:41:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 z1-20020a170906434100b006e7efa329fbsm2456661ejm.109.2022.04.05.03.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 03:41:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][hardknott][PATCH 2/3] abseil-cpp: Fix build with glibc 2.34
Date: Tue,  5 Apr 2022 12:41:22 +0200
Message-Id: <20220405104123.1371786-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405104123.1371786-1-Martin.Jansa@gmail.com>
References: <20220405104123.1371786-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96426

From: Khem Raj <raj.khem@gmail.com>

* based on commit from honister, but without the upgrade:
  commit 8691de2580dd872e3d001d67c8455108b3bd627c
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Sat May 8 14:38:52 2021 -0700

    abseil-cpp: Upgrade to lts_2021_03_24

    Fix build with glibc 2.34 while here
    Forward patches to this version
    Let system package the libraries

  to fix abseil-cpp-native build on e.g. Ubuntu-22.04 with glibc-2.34 to fi=
x:

  | FAILED: absl/debugging/CMakeFiles/failure_signal_handler.dir/failure_si=
gnal_handler.cc.o
  | /OE/lge/build/webosose/hardknott/BUILD/hosttools/g++ -Dfailure_signal_h=
andler_EXPORTS -I/OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linux/a=
bseil-cpp-native/20200923+gitAUTOINC+6f9d96a1f4-r0/git -isystem/OE/lge/buil=
d/webosose/hardknott/BUILD/work/x86_64-linux/abseil-cpp-native/20200923+git=
AUTOINC+6f9d96a1f4-r0/recipe-sysroot-native/usr/include -O2 -pipe -fPIC -Wa=
ll -Wextra -Wcast-qual -Wconversion-null -Wmissing-declarations -Woverlengt=
h-strings -Wpointer-arith -Wundef -Wunused-local-typedefs -Wunused-result -=
Wvarargs -Wvla -Wwrite-strings -Wno-missing-field-initializers -Wno-sign-co=
mpare -DNOMINMAX -std=3Dgnu++14 -MD -MT absl/debugging/CMakeFiles/failure_s=
ignal_handler.dir/failure_signal_handler.cc.o -MF absl/debugging/CMakeFiles=
/failure_signal_handler.dir/failure_signal_handler.cc.o.d -o absl/debugging=
/CMakeFiles/failure_signal_handler.dir/failure_signal_handler.cc.o -c /OE/l=
ge/build/webosose/hardknott/BUILD/work/x86_64-linux/abseil-cpp-native/20200=
923+gitAUTOINC+6f9d96a1f4-r0/git/absl/debugging/failure_signal_handler.cc
  | /OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linux/abseil-cpp-nat=
ive/20200923+gitAUTOINC+6f9d96a1f4-r0/git/absl/debugging/failure_signal_han=
dler.cc: In function =E2=80=98bool absl::lts_2020_09_23::SetupAlternateStac=
kOnce()=E2=80=99:
  | /OE/lge/build/webosose/hardknott/BUILD/work/x86_64-linux/abseil-cpp-nat=
ive/20200923+gitAUTOINC+6f9d96a1f4-r0/git/absl/debugging/failure_signal_han=
dler.cc:138:32: error: no matching function for call to =E2=80=98max(long i=
nt, int)=E2=80=99
  |   138 |   size_t stack_size =3D (std::max(SIGSTKSZ, 65536) + page_mask)=
 & ~page_mask;
  |       |                        ~~~~~~~~^~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...01-Export-of-internal-Abseil-changes.patch | 82 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Exp=
ort-of-internal-Abseil-changes.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-=
internal-Abseil-changes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-=
cpp/0001-Export-of-internal-Abseil-changes.patch
new file mode 100644
index 0000000000..c0fb0571f7
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-interna=
l-Abseil-changes.patch
@@ -0,0 +1,82 @@
+From d3424201a73f29ab533121b1821a76e1b4313beb Mon Sep 17 00:00:00 2001
+From: Abseil Team <absl-team@google.com>
+Date: Mon, 3 May 2021 07:37:39 -0700
+Subject: [PATCH] Export of internal Abseil changes
+
+--
+cf88f9cf40eab54c06bca7f20795352ec23bb583 by Derek Mauro <dmauro@google.com=
>:
+
+Fixes build with latest glibc
+Fixes #952
+
+PiperOrigin-RevId: 371693908
+
+--
+99bcd0f4a747ce7a401e23c745adf34d0ec5131b by Samuel Benzaquen <sbenza@googl=
e.com>:
+
+Add support for std::string_view in StrFormat even when
+absl::string_view !=3D std::string_view.
+
+PiperOrigin-RevId: 371693633
+
+--
+e35463572149a6c2d4a0d439b9300ce03fd6b96d by Abseil Team <absl-team@google.=
com>:
+
+Cmake builds should only install pkg-config when explicitly requested.
+
+PiperOrigin-RevId: 371403419
+GitOrigin-RevId: cf88f9cf40eab54c06bca7f20795352ec23bb583
+Change-Id: I4360a18c638a4d901ff44ab1e0a9d8f321c302ea
+---
+ absl/debugging/failure_signal_handler.cc         | 3 ++-
+ absl/strings/internal/str_format/arg.h           | 8 ++++++++
+ absl/strings/internal/str_format/convert_test.cc | 3 +++
+ 3 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/absl/debugging/failure_signal_handler.cc b/absl/debugging/fai=
lure_signal_handler.cc
+index 5d13bdbb..2ed137b5 100644
+--- a/absl/debugging/failure_signal_handler.cc
++++ b/absl/debugging/failure_signal_handler.cc
+@@ -135,7 +135,8 @@ static bool SetupAlternateStackOnce() {
+ #else
+   const size_t page_mask =3D sysconf(_SC_PAGESIZE) - 1;
+ #endif
+-  size_t stack_size =3D (std::max(SIGSTKSZ, 65536) + page_mask) & ~page_m=
ask;
++  size_t stack_size =3D
++      (std::max<size_t>(SIGSTKSZ, 65536) + page_mask) & ~page_mask;
+ #if defined(ABSL_HAVE_ADDRESS_SANITIZER) || \
+     defined(ABSL_HAVE_MEMORY_SANITIZER) || defined(ABSL_HAVE_THREAD_SANIT=
IZER)
+   // Account for sanitizer instrumentation requiring additional stack spa=
ce.
+diff --git a/absl/strings/internal/str_format/arg.h b/absl/strings/interna=
l/str_format/arg.h
+index 3dbc1526..f9d89d12 100644
+--- a/absl/strings/internal/str_format/arg.h
++++ b/absl/strings/internal/str_format/arg.h
+@@ -108,6 +108,14 @@ StringConvertResult FormatConvertImpl(const std::stri=
ng& v,
+ StringConvertResult FormatConvertImpl(string_view v,
+                                       FormatConversionSpecImpl conv,
+                                       FormatSinkImpl* sink);
++#if defined(ABSL_HAVE_STD_STRING_VIEW) && !defined(ABSL_USES_STD_STRING_V=
IEW)
++inline StringConvertResult FormatConvertImpl(std::string_view v,
++                                             FormatConversionSpecImpl con=
v,
++                                             FormatSinkImpl* sink) {
++  return FormatConvertImpl(absl::string_view(v.data(), v.size()), conv, s=
ink);
++}
++#endif  // ABSL_HAVE_STD_STRING_VIEW && !ABSL_USES_STD_STRING_VIEW
++
+ ArgConvertResult<FormatConversionCharSetUnion(
+     FormatConversionCharSetInternal::s, FormatConversionCharSetInternal::=
p)>
+ FormatConvertImpl(const char* v, const FormatConversionSpecImpl conv,
+diff --git a/absl/strings/internal/str_format/convert_test.cc b/absl/strin=
gs/internal/str_format/convert_test.cc
+index 634ee78b..cc789530 100644
+--- a/absl/strings/internal/str_format/convert_test.cc
++++ b/absl/strings/internal/str_format/convert_test.cc
+@@ -215,6 +215,9 @@ TEST_F(FormatConvertTest, BasicString) {
+   TestStringConvert(static_cast<const char*>("hello"));
+   TestStringConvert(std::string("hello"));
+   TestStringConvert(string_view("hello"));
++#if defined(ABSL_HAVE_STD_STRING_VIEW)
++  TestStringConvert(std::string_view("hello"));
++#endif  // ABSL_HAVE_STD_STRING_VIEW
+ }
+=20
+ TEST_F(FormatConvertTest, NullString) {
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-o=
e/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 569bb13993..a49fe672e8 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D=
${BRANCH};protocol=3Dhttps \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
+           file://0001-Export-of-internal-Abseil-changes.patch \
           "
=20
 S =3D "${WORKDIR}/git"
--=20
2.35.1


