Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3BBFF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:01:29 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8954.1777366879715039892
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 02:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WSU/+7Qs;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so110326971fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 02:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777366877; x=1777971677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXaP+1Pu8XGCf0YHS6OLRXd1UVRGbKBMOJcdoz12zUU=;
        b=WSU/+7Qs1Eclsew/LAgQ2Abprhg3KBm3ZlIff8uTgM8HdfdaZSTcg9odBTbk55hxx6
         PB26fJVdIA3NTYMbWxEdoR5aypnHihYHRzcVH2u1k8BRySF1eDInqa/0LuJr5+ga/TW2
         zJLYtCjG5O7g3YiJBr13wQ1dY5A/2WPUI5XusXoWwVyBPbFwIOZ1IREY1mt1EH7QgRSo
         vJdrYwr12kZEM42tc4+zNZ8vLk/gdJnqjqAYPciP+rDS/AbyasRUO9F8KKMZa1pI6Jky
         ozAxeHm/31DQfR1n80D8F2VJIUH52ZyIfElGhaJgVf94BAVO6PNH42BB6dVFcYuJkOfN
         5WPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777366877; x=1777971677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXaP+1Pu8XGCf0YHS6OLRXd1UVRGbKBMOJcdoz12zUU=;
        b=H0T+ckgVYVyWYKnphXA65omy4zI0J2/o4m5TnMcKcW+KDhXpkjmzHzaGuJzaLZH66O
         A7TJtHIuQL62uqo9SIJAXPpL9A1nkyf09gM+D79RnQZ4vvgfFYl/Op4YidRLmlwej+mn
         AtzkWuM8EHu+8CX5rgWVWBqvQhe8HwgAQcis1PAt/oVFylgc2dWZRfwOiCy3h2rgVvrv
         tn+EkIgMns9UCRhRF84sg/8HZqQM98yOlLbuGukVJSl2S1jZoB1nD68DT9b4N1MSa6G8
         JwbZ63yiPLL4b26pmqG1A4yUqRsr88CXFYUxMxLsCgf0A7p5ry9mQ3wRSC3nMzlHrN09
         Wtdg==
X-Gm-Message-State: AOJu0Yyy64pifunjmMGhOx+V2rzkY2HI5mh76j4zeRUMG8facjmRO/VL
	mkeQ5/DuplgeEanYdJS2ygKCnfIMXokwfiC5X0ScpzyQCyxytBtJGa3i6kWycSHA5cT+VJO+Aad
	0Gwqf
X-Gm-Gg: AeBDievX8B+D6PBNBQLQ2gQFw8Fe/OGxbk8eoBiTL1YmKwVNr8n215h6JfwEjB9I2mz
	EySTv6TQ/kw1lhCfYxzvGcgVIhBUAU980H/v3u4nbanv6NShIa3nb9GVKknexhH6DlaocjkAUXt
	sjTu1w/n5Je5vVrnz+oTRapVZhTfaeRTexTamRAlE7cs6yMKzbcefIDjGOBRBZTcMFi2Z04uind
	7/X37UWzX1w3qt1xHwhhoU8QS6AVQ/Y1rDlqXSbgmE70I5ANe8cxSqCQVpZpkL1XpGFL3Y9q6ZH
	kA0iUuncgVrkpmTSQI40fbY1sg8vXfTDtTgDrfM/XJoDEWxUmCvbTBpOaISwZb5Tb8qCPcZCcDY
	ZCNIrqOX5C6rQ4yYSZO2383Z7ub8Tx2GwGmDT+o5rpM0LD1y4IfbYkPYmBpNVNgmcML9zqRxg0c
	dbFjR0Ij+Lg5OoyKMeaON3a8ShNdL5T11MwHtOr8WFO6bGxn5Qv1qCAYSED27D7w==
X-Received: by 2002:a05:6512:15a4:b0:5a2:c0d8:e634 with SMTP id 2adb3069b0e04-5a746409fc9mr1015859e87.8.1777366876821;
        Tue, 28 Apr 2026 02:01:16 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462d61f7sm461938e87.35.2026.04.28.02.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:01:16 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-oe][scarthgap][PATCH 2/2] jq: fix build with gcc-15
Date: Tue, 28 Apr 2026 12:00:53 +0300
Message-ID: <20260428090053.3401574-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428090053.3401574-1-mikko.rapeli@linaro.org>
References: <20260428090053.3401574-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126650

From: Martin Jansa <martin.jansa@gmail.com>

* backport 3 commits to fix:
  http://errors.yoctoproject.org/Errors/Details/848831/

../jq-1.7.1/src/builtin.c:1705:4: error: initialization of 'jv (*)(void)' from incompatible pointer type 'jv (*)(jq_state *, jv)' [-Wincompatible-pointer-types]
 1705 |   {f_ ## name,  #name, 1},
      |    ^~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...c-fix-build-with-Woverlength-strings.patch | 215 +++++++++++++++
 ...-add-and-use-LIBM_DA-and-LIBM_DA_NO-.patch | 164 ++++++++++++
 ...eck-builtin-cfunctions-in-function_l.patch | 249 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   3 +
 4 files changed, 631 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-builtin.c-fix-build-with-Woverlength-strings.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/0002-libm.h-builtin.c-add-and-use-LIBM_DA-and-LIBM_DA_NO-.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/0003-builtin.c-typecheck-builtin-cfunctions-in-function_l.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/0001-builtin.c-fix-build-with-Woverlength-strings.patch b/meta-oe/recipes-devtools/jq/jq/0001-builtin.c-fix-build-with-Woverlength-strings.patch
new file mode 100644
index 0000000000..cd7cdba00c
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/0001-builtin.c-fix-build-with-Woverlength-strings.patch
@@ -0,0 +1,215 @@
+From 8707f8764dfc470d1974eb1d613f5a4bec3610ac Mon Sep 17 00:00:00 2001
+From: Emanuele Torre <torreemanuele6@gmail.com>
+Date: Fri, 26 Jan 2024 04:42:11 +0100
+Subject: [PATCH] builtin.c: fix build with -Woverlength-strings
+
+C99 only allows string literals long at most 4095 characters.
+jq_builtins was a lot longer than that.
+
+I rewrote all the optional libm error stubs in C so the value of
+jq_builtins is not build dependent.
+
+I replaced the command that generates builtin.inc with a POSIX compliant
+od|sed command that encodes builtin.jq as a comma delimited list of
+octal numbers (that can be embedded in C using a {} literal).
+
+I also added -Woverlength-strings to AM_CFLAGS to verify that the
+problem is fixed.
+
+Fixes #1481
+Upstream-Status: Backport [605836b builtin.c: fix build with -Woverlength-strings]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+
+ Makefile.am   | 10 ++++--
+ src/builtin.c | 86 ++++++++++++++++++++++++---------------------------
+ 2 files changed, 48 insertions(+), 48 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 76e35df..f1f9f2e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -19,7 +19,8 @@ LIBJQ_SRC = src/builtin.c src/bytecode.c src/compile.c src/execute.c    \
+ 
+ ### C build options
+ 
+-AM_CFLAGS = -Wextra -Wall -Wno-unused-parameter -Wno-unused-function
++AM_CFLAGS = -Wextra -Wall -Wno-unused-parameter -Wno-unused-function \
++            -Woverlength-strings
+ 
+ if WIN32
+ AM_CFLAGS += -municode
+@@ -119,7 +120,12 @@ src/main.c: src/version.h src/config_opts.inc
+ 
+ src/builtin.inc: $(srcdir)/src/builtin.jq
+ 	mkdir -p src
+-	$(AM_V_GEN) sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' -e 's/^/"/' -e 's/$$/\\n"/' $(srcdir)/src/builtin.jq > $@
++	$(AM_V_GEN) od -v -A n -t o1 -- $< | \
++	sed -e 's/$$/ /' \
++	    -e 's/\([0123456789]\) /\1, /g' \
++	    -e 's/ $$//' \
++	    -e 's/ 0/  0/g' \
++	    -e 's/ \([123456789]\)/ 0\1/g' > $@
+ src/builtin.o: src/builtin.inc
+ 
+ CLEANFILES = src/version.h .remake-version-h src/builtin.inc src/config_opts.inc
+diff --git a/src/builtin.c b/src/builtin.c
+index 902490d..a3ce7e4 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -155,7 +155,11 @@ static jv f_ ## name(jq_state *jq, jv input) { \
+   jv_free(input); \
+   return ret; \
+ }
+-#define LIBM_DD_NO(name)
++#define LIBM_DD_NO(name) \
++static jv f_ ## name(jq_state *jq, jv input) { \
++  jv error = jv_string("Error: " #name "/0 not found at build time"); \
++  return ret_error(input, error); \
++}
+ 
+ #define LIBM_DDD(name) \
+ static jv f_ ## name(jq_state *jq, jv input, jv a, jv b) { \
+@@ -173,7 +177,12 @@ static jv f_ ## name(jq_state *jq, jv input, jv a, jv b) { \
+   jv_free(b); \
+   return ret; \
+ }
+-#define LIBM_DDD_NO(name)
++#define LIBM_DDD_NO(name) \
++static jv f_ ## name(jq_state *jq, jv input, jv a, jv b) { \
++  jv_free(b); \
++  jv error = jv_string("Error: " #name "/2 not found at build time"); \
++  return ret_error2(input, a, error); \
++}
+ 
+ #define LIBM_DDDD(name) \
+ static jv f_ ## name(jq_state *jq, jv input, jv a, jv b, jv c) { \
+@@ -199,7 +208,14 @@ static jv f_ ## name(jq_state *jq, jv input, jv a, jv b, jv c) { \
+   jv_free(c); \
+   return ret; \
+ }
+-#define LIBM_DDDD_NO(name)
++#define LIBM_DDDD_NO(name) \
++static jv f_ ## name(jq_state *jq, jv input, jv a, jv b, jv c) { \
++  jv_free(c) \
++  jv_free(b); \
++  jv error = jv_string("Error: " #name "/3 not found at build time"); \
++  return ret_error2(input, a, error); \
++}
++
+ #include "libm.h"
+ #undef LIBM_DDDD_NO
+ #undef LIBM_DDD_NO
+@@ -226,6 +242,11 @@ static jv f_frexp(jq_state *jq, jv input) {
+   jv_free(input);
+   return ret;
+ }
++#else
++static jv f_frexp(jq_state *jq, jv input) {
++  jv error = jv_string("Error: frexp/0 not found at build time");
++  return ret_error(input, error);
++}
+ #endif
+ #ifdef HAVE_MODF
+ static jv f_modf(jq_state *jq, jv input) {
+@@ -237,6 +258,11 @@ static jv f_modf(jq_state *jq, jv input) {
+   jv_free(input);
+   return jv_array_append(ret, jv_number(i));
+ }
++#else
++static jv f_modf(jq_state *jq, jv input) {
++  jv error = jv_string("Error: modf/0 not found at build time");
++  return ret_error(input, error);
++}
+ #endif
+ #ifdef HAVE_LGAMMA_R
+ static jv f_lgamma_r(jq_state *jq, jv input) {
+@@ -248,6 +274,11 @@ static jv f_lgamma_r(jq_state *jq, jv input) {
+   jv_free(input);
+   return jv_array_append(ret, jv_number(sign));
+ }
++#else
++static jv f_lgamma_r(jq_state *jq, jv input) {
++  jv error = jv_string("Error: lgamma_r/0 not found at build time");
++  return ret_error(input, error);
++}
+ #endif
+ 
+ static jv f_negate(jq_state *jq, jv input) {
+@@ -1703,27 +1734,21 @@ static jv f_current_line(jq_state *jq, jv a) {
+ 
+ #define LIBM_DD(name) \
+   {f_ ## name,  #name, 1},
+-#define LIBM_DD_NO(name)
++#define LIBM_DD_NO(name) LIBM_DD(name)
+ 
+ #define LIBM_DDD(name) \
+   {f_ ## name, #name, 3},
+-#define LIBM_DDD_NO(name)
++#define LIBM_DDD_NO(name) LIBM_DDD(name)
+ 
+ #define LIBM_DDDD(name) \
+   {f_ ## name, #name, 4},
+-#define LIBM_DDDD_NO(name)
++#define LIBM_DDDD_NO(name) LIBM_DDDD(name)
+ 
+ static const struct cfunction function_list[] = {
+ #include "libm.h"
+-#ifdef HAVE_FREXP
+   {f_frexp,"frexp", 1},
+-#endif
+-#ifdef HAVE_MODF
+   {f_modf,"modf", 1},
+-#endif
+-#ifdef HAVE_LGAMMA_R
+   {f_lgamma_r,"lgamma_r", 1},
+-#endif
+   {f_negate, "_negate", 1},
+ #define BINOP(name) {f_ ## name, "_" #name, 3},
+ BINOPS
+@@ -1838,42 +1863,11 @@ static block bind_bytecoded_builtins(block b) {
+   return BLOCK(builtins, b);
+ }
+ 
+-static const char jq_builtins[] =
++static const char jq_builtins[] = {
+ /* Include jq-coded builtins */
+ #include "src/builtin.inc"
+-
+-/* Include unsupported math functions next */
+-#define LIBM_DD(name)
+-#define LIBM_DDD(name)
+-#define LIBM_DDDD(name)
+-#define LIBM_DD_NO(name) "def " #name ": \"Error: " #name "/0 not found at build time\"|error;"
+-#define LIBM_DDD_NO(name) "def " #name "(a;b): \"Error: " #name "/2 not found at build time\"|error;"
+-#define LIBM_DDDD_NO(name) "def " #name "(a;b;c): \"Error: " #name "/3 not found at build time\"|error;"
+-#include "libm.h"
+-#ifndef HAVE_FREXP
+-  "def frexp: \"Error: frexp/0 not found at build time\"|error;"
+-#endif
+-#ifndef HAVE_MODF
+-  "def modf: \"Error: modf/0 not found at build time\"|error;"
+-#endif
+-#ifndef HAVE_LGAMMA_R
+-  "def lgamma_r: \"Error: lgamma_r/0 not found at build time\"|error;"
+-#endif
+-;
+-
+-#undef LIBM_DDDD_NO
+-#undef LIBM_DDD_NO
+-#undef LIBM_DD_NO
+-#undef LIBM_DDDD
+-#undef LIBM_DDD
+-#undef LIBM_DD
+-
+-#ifdef __APPLE__
+-#undef HAVE_GAMMA
+-#undef HAVE_EXP10
+-#undef HAVE_DREM
+-#undef HAVE_SIGNIFICAND
+-#endif
++  '\0',
++};
+ 
+ static block gen_builtin_list(block builtins) {
+   jv list = jv_array_append(block_list_funcs(builtins, 1), jv_string("builtins/0"));
diff --git a/meta-oe/recipes-devtools/jq/jq/0002-libm.h-builtin.c-add-and-use-LIBM_DA-and-LIBM_DA_NO-.patch b/meta-oe/recipes-devtools/jq/jq/0002-libm.h-builtin.c-add-and-use-LIBM_DA-and-LIBM_DA_NO-.patch
new file mode 100644
index 0000000000..68b8cb4f6e
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/0002-libm.h-builtin.c-add-and-use-LIBM_DA-and-LIBM_DA_NO-.patch
@@ -0,0 +1,164 @@
+From c65e6fa48e6da30727c87ccdd88d8fb6a7a70f20 Mon Sep 17 00:00:00 2001
+From: Emanuele Torre <torreemanuele6@gmail.com>
+Date: Fri, 26 Jan 2024 11:26:57 +0100
+Subject: [PATCH] libm.h+builtin.c: add and use LIBM_DA and LIBM_DA_NO macros
+
+For functions that from one double return an array with two numbers.
+Upstream-Status: Backport [bd3c828 libm.h+builtin.c: add and use LIBM_DA and LIBM_DA_NO macros]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/builtin.c | 78 ++++++++++++++++-----------------------------------
+ src/libm.h    | 15 ++++++++++
+ 2 files changed, 39 insertions(+), 54 deletions(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index a3ce7e4..9b71bca 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -216,13 +216,32 @@ static jv f_ ## name(jq_state *jq, jv input, jv a, jv b, jv c) { \
+   return ret_error2(input, a, error); \
+ }
+ 
++#define LIBM_DA(name, type) \
++static jv f_ ## name(jq_state *jq, jv input) { \
++  if (jv_get_kind(input) != JV_KIND_NUMBER) { \
++    return type_error(input, "number required"); \
++  } \
++  type value; \
++  double d = name(jv_number_value(input), &value); \
++  jv ret = JV_ARRAY(jv_number(d), jv_number(value)); \
++  jv_free(input); \
++  return ret; \
++}
++#define LIBM_DA_NO(name, type) \
++static jv f_ ## name(jq_state *jq, jv input) { \
++  jv error = jv_string("Error: " #name "/0 not found at build time"); \
++  return ret_error(input, error); \
++}
++
+ #include "libm.h"
+ #undef LIBM_DDDD_NO
+ #undef LIBM_DDD_NO
+ #undef LIBM_DD_NO
++#undef LIBM_DA_NO
+ #undef LIBM_DDDD
+ #undef LIBM_DDD
+ #undef LIBM_DD
++#undef LIBM_DA
+ 
+ #ifdef __APPLE__
+ #undef gamma
+@@ -231,56 +250,6 @@ static jv f_ ## name(jq_state *jq, jv input, jv a, jv b, jv c) { \
+ #undef exp10
+ #endif
+ 
+-#ifdef HAVE_FREXP
+-static jv f_frexp(jq_state *jq, jv input) {
+-  if (jv_get_kind(input) != JV_KIND_NUMBER) {
+-    return type_error(input, "number required");
+-  }
+-  int exp;
+-  double d = frexp(jv_number_value(input), &exp);
+-  jv ret = JV_ARRAY(jv_number(d), jv_number(exp));
+-  jv_free(input);
+-  return ret;
+-}
+-#else
+-static jv f_frexp(jq_state *jq, jv input) {
+-  jv error = jv_string("Error: frexp/0 not found at build time");
+-  return ret_error(input, error);
+-}
+-#endif
+-#ifdef HAVE_MODF
+-static jv f_modf(jq_state *jq, jv input) {
+-  if (jv_get_kind(input) != JV_KIND_NUMBER) {
+-    return type_error(input, "number required");
+-  }
+-  double i;
+-  jv ret = JV_ARRAY(jv_number(modf(jv_number_value(input), &i)));
+-  jv_free(input);
+-  return jv_array_append(ret, jv_number(i));
+-}
+-#else
+-static jv f_modf(jq_state *jq, jv input) {
+-  jv error = jv_string("Error: modf/0 not found at build time");
+-  return ret_error(input, error);
+-}
+-#endif
+-#ifdef HAVE_LGAMMA_R
+-static jv f_lgamma_r(jq_state *jq, jv input) {
+-  if (jv_get_kind(input) != JV_KIND_NUMBER) {
+-    return type_error(input, "number required");
+-  }
+-  int sign;
+-  jv ret = JV_ARRAY(jv_number(lgamma_r(jv_number_value(input), &sign)));
+-  jv_free(input);
+-  return jv_array_append(ret, jv_number(sign));
+-}
+-#else
+-static jv f_lgamma_r(jq_state *jq, jv input) {
+-  jv error = jv_string("Error: lgamma_r/0 not found at build time");
+-  return ret_error(input, error);
+-}
+-#endif
+-
+ static jv f_negate(jq_state *jq, jv input) {
+   if (jv_get_kind(input) != JV_KIND_NUMBER) {
+     return type_error(input, "cannot be negated");
+@@ -1733,8 +1702,10 @@ static jv f_current_line(jq_state *jq, jv a) {
+ }
+ 
+ #define LIBM_DD(name) \
+-  {f_ ## name,  #name, 1},
++  {f_ ## name, #name, 1},
+ #define LIBM_DD_NO(name) LIBM_DD(name)
++#define LIBM_DA(name, type) LIBM_DD(name)
++#define LIBM_DA_NO(name, type) LIBM_DD(name)
+ 
+ #define LIBM_DDD(name) \
+   {f_ ## name, #name, 3},
+@@ -1746,9 +1717,6 @@ static jv f_current_line(jq_state *jq, jv a) {
+ 
+ static const struct cfunction function_list[] = {
+ #include "libm.h"
+-  {f_frexp,"frexp", 1},
+-  {f_modf,"modf", 1},
+-  {f_lgamma_r,"lgamma_r", 1},
+   {f_negate, "_negate", 1},
+ #define BINOP(name) {f_ ## name, "_" #name, 3},
+ BINOPS
+@@ -1813,9 +1781,11 @@ BINOPS
+ #undef LIBM_DDDD_NO
+ #undef LIBM_DDD_NO
+ #undef LIBM_DD_NO
++#undef LIBM_DA_NO
+ #undef LIBM_DDDD
+ #undef LIBM_DDD
+ #undef LIBM_DD
++#undef LIBM_DA
+ 
+ struct bytecoded_builtin { const char* name; block code; };
+ static block bind_bytecoded_builtins(block b) {
+diff --git a/src/libm.h b/src/libm.h
+index 8efc1c5..7332bd8 100644
+--- a/src/libm.h
++++ b/src/libm.h
+@@ -289,3 +289,18 @@ LIBM_DDD(ldexp)
+ #else
+ LIBM_DDD_NO(ldexp)
+ #endif
++#ifdef HAVE_MODF
++LIBM_DA(modf, double)
++#else
++LIBM_DA_NO(modf, double)
++#endif
++#ifdef HAVE_FREXP
++LIBM_DA(frexp, int)
++#else
++LIBM_DA_NO(frexp, int)
++#endif
++#ifdef HAVE_LGAMMA_R
++LIBM_DA(lgamma_r, int)
++#else
++LIBM_DA_NO(lgamma_r, int)
++#endif
diff --git a/meta-oe/recipes-devtools/jq/jq/0003-builtin.c-typecheck-builtin-cfunctions-in-function_l.patch b/meta-oe/recipes-devtools/jq/jq/0003-builtin.c-typecheck-builtin-cfunctions-in-function_l.patch
new file mode 100644
index 0000000000..f8b6c5baf6
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/0003-builtin.c-typecheck-builtin-cfunctions-in-function_l.patch
@@ -0,0 +1,249 @@
+From 98839759a92e3ad41870bfc7415f0ecf320b5097 Mon Sep 17 00:00:00 2001
+From: Emanuele Torre <torreemanuele6@gmail.com>
+Date: Mon, 25 Nov 2024 07:47:14 +0100
+Subject: [PATCH] builtin.c: typecheck builtin cfunctions in function_list
+
+In C23 (default C standard used by GCC 15),  jv (*fptr)();  has become
+equivalent to  jv (*fptr)(void);  so we can no longer assign builtin
+implemenations directly to the fptr member of cfunctions without
+generating a compile error.
+
+Since there does not seem to be any straight-forward way to tell
+autoconf to force the compiler to use C99 short of explicitly adding
+-std=c99 to CFLAGS, it is probably a cleaner solution to just make the
+code C23 compatible.
+
+A possible solution could have been to just redeclare  cfunction.fptr
+as void*, but then the functions' return type would not have been type
+checked (e.g. if you tried to add a {printf, "printf", 2}, where printf
+is a function that does not return jv, the compiler wouldn't have
+complained.)
+We were already not typechecking the arguments of the functions, so e.g.
+  {binop_plus, "_plus", 3},  /* instead of {f_plus, "_plus, 3},       */
+  {f_setpath, "setpath", 4}, /* instead of {f_setpath, "setpath", 3}, */
+compile without errors despite not having the correct prototype.
+
+So I thought of instead improving the situation by redefining
+cfunction.fptr as a union of function pointers with the prototypes that
+the jq bytecode interpreter can call, and use a macro to add the builtin
+functions to function_list using to the arity argument to assign the
+implementation function to the appropriate union member.
+
+Now the code won't compile if the wrong arity, or an arity not supported
+by the bytecode interpreter (>5 = 1input+4arguments), or a prototype not
+jallable by the bytecode interpreter (e.g. binop_plus that doesn't
+expect a  jq_state*  argument).
+
+Also, the code now compiles with gcc -std=c23.
+
+Fixes #3206
+Upstream-Status: Backport [0b82b38 builtin.c: typecheck builtin cfunctions in function_list]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/builtin.c  | 126 +++++++++++++++++++++++++------------------------
+ src/bytecode.h |  11 +++--
+ src/execute.c  |  11 ++---
+ 3 files changed, 78 insertions(+), 70 deletions(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index 9b71bca..6ba6511 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -1701,82 +1701,83 @@ static jv f_current_line(jq_state *jq, jv a) {
+   return jq_util_input_get_current_line(jq);
+ }
+ 
++#define CFUNC(func, name, arity) \
++  {.fptr = { .a ## arity = func }, name, arity}
++
+ #define LIBM_DD(name) \
+-  {f_ ## name, #name, 1},
++  CFUNC(f_ ## name, #name, 1),
+ #define LIBM_DD_NO(name) LIBM_DD(name)
+ #define LIBM_DA(name, type) LIBM_DD(name)
+ #define LIBM_DA_NO(name, type) LIBM_DD(name)
+ 
+ #define LIBM_DDD(name) \
+-  {f_ ## name, #name, 3},
++  CFUNC(f_ ## name, #name, 3),
+ #define LIBM_DDD_NO(name) LIBM_DDD(name)
+ 
+ #define LIBM_DDDD(name) \
+-  {f_ ## name, #name, 4},
++  CFUNC(f_ ## name, #name, 4),
+ #define LIBM_DDDD_NO(name) LIBM_DDDD(name)
+ 
+ static const struct cfunction function_list[] = {
+ #include "libm.h"
+-  {f_negate, "_negate", 1},
+-#define BINOP(name) {f_ ## name, "_" #name, 3},
++  CFUNC(f_negate, "_negate", 1),
++#define BINOP(name) CFUNC(f_ ## name, "_" #name, 3),
+ BINOPS
+ #undef BINOP
+-  {f_dump, "tojson", 1},
+-  {f_json_parse, "fromjson", 1},
+-  {f_tonumber, "tonumber", 1},
+-  {f_tostring, "tostring", 1},
+-  {f_keys, "keys", 1},
+-  {f_keys_unsorted, "keys_unsorted", 1},
+-  {f_startswith, "startswith", 2},
+-  {f_endswith, "endswith", 2},
+-  {f_ltrimstr, "ltrimstr", 2},
+-  {f_rtrimstr, "rtrimstr", 2},
+-  {f_string_split, "split", 2},
+-  {f_string_explode, "explode", 1},
+-  {f_string_implode, "implode", 1},
+-  {f_string_indexes, "_strindices", 2},
+-  {f_setpath, "setpath", 3}, // FIXME typechecking
+-  {f_getpath, "getpath", 2},
+-  {f_delpaths, "delpaths", 2},
+-  {f_has, "has", 2},
+-  {f_contains, "contains", 2},
+-  {f_length, "length", 1},
+-  {f_utf8bytelength, "utf8bytelength", 1},
+-  {f_type, "type", 1},
+-  {f_isinfinite, "isinfinite", 1},
+-  {f_isnan, "isnan", 1},
+-  {f_isnormal, "isnormal", 1},
+-  {f_infinite, "infinite", 1},
+-  {f_nan, "nan", 1},
+-  {f_sort, "sort", 1},
+-  {f_sort_by_impl, "_sort_by_impl", 2},
+-  {f_group_by_impl, "_group_by_impl", 2},
+-  {f_min, "min", 1},
+-  {f_max, "max", 1},
+-  {f_min_by_impl, "_min_by_impl", 2},
+-  {f_max_by_impl, "_max_by_impl", 2},
+-  {f_error, "error", 1},
+-  {f_format, "format", 2},
+-  {f_env, "env", 1},
+-  {f_halt, "halt", 1},
+-  {f_halt_error, "halt_error", 2},
+-  {f_get_search_list, "get_search_list", 1},
+-  {f_get_prog_origin, "get_prog_origin", 1},
+-  {f_get_jq_origin, "get_jq_origin", 1},
+-  {f_match, "_match_impl", 4},
+-  {f_modulemeta, "modulemeta", 1},
+-  {f_input, "input", 1},
+-  {f_debug, "debug", 1},
+-  {f_stderr, "stderr", 1},
+-  {f_strptime, "strptime", 2},
+-  {f_strftime, "strftime", 2},
+-  {f_strflocaltime, "strflocaltime", 2},
+-  {f_mktime, "mktime", 1},
+-  {f_gmtime, "gmtime", 1},
+-  {f_localtime, "localtime", 1},
+-  {f_now, "now", 1},
+-  {f_current_filename, "input_filename", 1},
+-  {f_current_line, "input_line_number", 1},
++  CFUNC(f_dump, "tojson", 1),
++  CFUNC(f_json_parse, "fromjson", 1),
++  CFUNC(f_tonumber, "tonumber", 1),
++  CFUNC(f_tostring, "tostring", 1),
++  CFUNC(f_keys, "keys", 1),
++  CFUNC(f_keys_unsorted, "keys_unsorted", 1),
++  CFUNC(f_startswith, "startswith", 2),
++  CFUNC(f_endswith, "endswith", 2),
++  CFUNC(f_string_split, "split", 2),
++  CFUNC(f_string_explode, "explode", 1),
++  CFUNC(f_string_implode, "implode", 1),
++  CFUNC(f_string_indexes, "_strindices", 2),
++  CFUNC(f_setpath, "setpath", 3),
++  CFUNC(f_getpath, "getpath", 2),
++  CFUNC(f_delpaths, "delpaths", 2),
++  CFUNC(f_has, "has", 2),
++  CFUNC(f_contains, "contains", 2),
++  CFUNC(f_length, "length", 1),
++  CFUNC(f_utf8bytelength, "utf8bytelength", 1),
++  CFUNC(f_type, "type", 1),
++  CFUNC(f_isinfinite, "isinfinite", 1),
++  CFUNC(f_isnan, "isnan", 1),
++  CFUNC(f_isnormal, "isnormal", 1),
++  CFUNC(f_infinite, "infinite", 1),
++  CFUNC(f_nan, "nan", 1),
++  CFUNC(f_sort, "sort", 1),
++  CFUNC(f_sort_by_impl, "_sort_by_impl", 2),
++  CFUNC(f_group_by_impl, "_group_by_impl", 2),
++  CFUNC(f_min, "min", 1),
++  CFUNC(f_max, "max", 1),
++  CFUNC(f_min_by_impl, "_min_by_impl", 2),
++  CFUNC(f_max_by_impl, "_max_by_impl", 2),
++  CFUNC(f_error, "error", 1),
++  CFUNC(f_format, "format", 2),
++  CFUNC(f_env, "env", 1),
++  CFUNC(f_halt, "halt", 1),
++  CFUNC(f_halt_error, "halt_error", 2),
++  CFUNC(f_get_search_list, "get_search_list", 1),
++  CFUNC(f_get_prog_origin, "get_prog_origin", 1),
++  CFUNC(f_get_jq_origin, "get_jq_origin", 1),
++  CFUNC(f_match, "_match_impl", 4),
++  CFUNC(f_modulemeta, "modulemeta", 1),
++  CFUNC(f_input, "input", 1),
++  CFUNC(f_debug, "debug", 1),
++  CFUNC(f_stderr, "stderr", 1),
++  CFUNC(f_strptime, "strptime", 2),
++  CFUNC(f_strftime, "strftime", 2),
++  CFUNC(f_strflocaltime, "strflocaltime", 2),
++  CFUNC(f_mktime, "mktime", 1),
++  CFUNC(f_gmtime, "gmtime", 1),
++  CFUNC(f_localtime, "localtime", 1),
++  CFUNC(f_now, "now", 1),
++  CFUNC(f_current_filename, "input_filename", 1),
++  CFUNC(f_current_line, "input_line_number", 1),
+ };
+ #undef LIBM_DDDD_NO
+ #undef LIBM_DDD_NO
+diff --git a/src/bytecode.h b/src/bytecode.h
+index 1501985..a4055f5 100644
+--- a/src/bytecode.h
++++ b/src/bytecode.h
+@@ -2,7 +2,7 @@
+ #define BYTECODE_H
+ #include <stdint.h>
+ 
+-#include "jv.h"
++#include "jq.h"
+ 
+ typedef enum {
+ #define OP(name, imm, in, out) name,
+@@ -44,9 +44,14 @@ struct opcode_description {
+ const struct opcode_description* opcode_describe(opcode op);
+ 
+ 
+-#define MAX_CFUNCTION_ARGS 10
++#define MAX_CFUNCTION_ARGS 4
+ struct cfunction {
+-  jv (*fptr)();
++  union {
++    jv (*a1)(jq_state *, jv);
++    jv (*a2)(jq_state *, jv, jv);
++    jv (*a3)(jq_state *, jv, jv, jv);
++    jv (*a4)(jq_state *, jv, jv, jv, jv);
++  } fptr;
+   const char* name;
+   int nargs;
+ };
+diff --git a/src/execute.c b/src/execute.c
+index 9ef8368..62404db 100644
+--- a/src/execute.c
++++ b/src/execute.c
+@@ -913,14 +913,13 @@ jv jq_next(jq_state *jq) {
+       }
+       struct cfunction* function = &frame_current(jq)->bc->globals->cfunctions[*pc++];
+       switch (function->nargs) {
+-      case 1: top = ((jv (*)(jq_state *, jv))function->fptr)(jq, in[0]); break;
+-      case 2: top = ((jv (*)(jq_state *, jv, jv))function->fptr)(jq, in[0], in[1]); break;
+-      case 3: top = ((jv (*)(jq_state *, jv, jv, jv))function->fptr)(jq, in[0], in[1], in[2]); break;
+-      case 4: top = ((jv (*)(jq_state *, jv, jv, jv, jv))function->fptr)(jq, in[0], in[1], in[2], in[3]); break;
+-      case 5: top = ((jv (*)(jq_state *, jv, jv, jv, jv, jv))function->fptr)(jq, in[0], in[1], in[2], in[3], in[4]); break;
++      case 1: top = function->fptr.a1(jq, in[0]); break;
++      case 2: top = function->fptr.a2(jq, in[0], in[1]); break;
++      case 3: top = function->fptr.a3(jq, in[0], in[1], in[2]); break;
++      case 4: top = function->fptr.a4(jq, in[0], in[1], in[2], in[3]); break;
+       // FIXME: a) up to 7 arguments (input + 6), b) should assert
+       // because the compiler should not generate this error.
+       default: return jv_invalid_with_msg(jv_string("Function takes too many arguments"));
+       }
+ 
+       if (jv_is_valid(top)) {
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index dfc8dda7ee..5bc242d265 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=488f4e0b04c0456337fb70d1ac1758ba"
 
 GITHUB_BASE_URI = "https://github.com/jqlang/${BPN}/releases/"
 SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
+    file://0001-builtin.c-fix-build-with-Woverlength-strings.patch \
+    file://0002-libm.h-builtin.c-add-and-use-LIBM_DA-and-LIBM_DA_NO-.patch \
+    file://0003-builtin.c-typecheck-builtin-cfunctions-in-function_l.patch \
     file://run-ptest \
     file://CVE-2024-23337.patch \
     file://CVE-2024-53427.patch \
-- 
2.51.0


