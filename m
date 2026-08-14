Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191C5C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:11 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24397.1786747622275492038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gam6fD/O;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1551620a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747622; x=1787352422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED6maNPlJ1VvJSZi6rmrMkZcJ/HLXgT6RaHusQV1C1s=;
        b=gam6fD/ONGKAVxqaZNOej8Z3+G/0oBs10xlHTP7ZyCCxSlqmorKdgUZ/0WDGEr2bLf
         gCuIqiV6tFUZk5yKAOkP7yGueXhmytusCwDIcBhx3kDrM0wMIrQUiXqZ33fhrFb21szU
         xuzdwDBheMpxtXuEe1UmjbcC3p11dUZ9V94IxUAyO+V1uE7T0AXZLjLoE+s3t5zqSxxY
         vR0bZxwdfkEbC6oaqQLkquPyReqhDe7+YRZ7GzqeUNLFAYDrHOkxB+vvczF/FRYDy5se
         QNE0IH4+LmGRgXRmet8R/JmGSwQPoSDBWnoJeafWmcK8g12XbSYGfx32bGNExwozA70h
         EWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747622; x=1787352422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED6maNPlJ1VvJSZi6rmrMkZcJ/HLXgT6RaHusQV1C1s=;
        b=EzarRsgJmPFL4lqBaJ8A+So+3JkO36/vBFFbSr4KIuhZJKHpVNLGIZxNIux2yrH+AM
         LT9vBSU1G2FREzCj74zoXQ0IITwrSI68s7zZanN3awZjAEFyFpemrPl7lhCnS4+5Aady
         W6PjtBOLwN7pNdZbgPc3cKfUbxyLf4h2Our4BJr64Pxi/pPSGYqoZZ7XYYeaksNoS+Vr
         rWhMuBYuR6DGSCPPwTb+q5CabxQ206gXvBWYkPlBEMtu44iWdn+/ek2Ozu4hZVuhXiNd
         3kkPBlyeWYZ8Ec6pMNf/tv1JzuB+OWANfj+3K4GqbE/kl46aH6Ud7tRcEfBpxl3hrXJY
         iqWw==
X-Gm-Message-State: AOJu0Yw5h6WI0TDwY88M9+QjnGL3/3NETSj/CJv1UUKRXtW2DoYWBzwe
	tmeK/x8f/h9YjkLzpjWvRAN7kz0Tc2C67Y00qKgReD5nVetbKAcYaTsXR2/xk+IQ
X-Gm-Gg: AR+sD11R0n4IEvCqgEa68IJURkLv2j7zPpge+Eu2tUOITb61IumOGrpVxMXdsG/03dN
	U3JtOK+7bPdca7IuQHN4NKaT0F6/6uDv3Et69lISDoWBBsTbr5SeHZxMUu0BkpTXpQCGLIoUBLc
	0K6BRXgU0NYhO+x0r8+SL+UgURgVly4ItfbUbu5clZS5fTc95BDWSejjhcSThxgdwOa35nVKZBi
	ghZBE+URP1IZPxsOODaMHRL3dTIekQGI0V9OoCMBnNtPVcIrzpJn8+19c5wmViHVbjrbK9wuiBC
	hEjJwSfYo+tz0Gpt5rR6B0TYvRkfdEwLh75YH0EN/pGFWjF7QF8EYpSxGbs0QFuSLP+prKkHyBK
	Q1DqkoL8Zicke/NcFV/pvBxO2MdhecEmF0LWtFNzAAbwZFSie3lQSfEPqBE/Ph0D2CnCq6/Tp5X
	rr4lGWFxGQW+qbUP57lIeIU4Cs5Evk6VwpR2Gn+KiYrj0GyDLzRCY8SMmj2sAeeSoRRDTADrIjn
	MHkfo71JQbF8b9Ryqqv6NKnN2LRl+sPsylejg3GdVjH70mZlfgnB+DC7lmN3XYQgKkwspzeE65S
	5m+9Ol758jmN6l9klENBzne/gHp5Ud5w8Szji2+kGAyg+UxIP5UsorLENX6zrwNjQ/pBcn0Badf
	vn4U8PSoTNAaLbgJcv+DLOFBz/5HnAYmwsUTQl0jSbUINYw==
X-Received: by 2002:a17:90b:590d:b0:38f:23d6:b4a9 with SMTP id 98e67ed59e1d1-3933ed66651mr11405890a91.21.1786747621534;
        Fri, 14 Aug 2026 15:47:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 071/109] gsoap: upgrade 2.8.142 -> 2.8.144
Date: Fri, 14 Aug 2026 15:44:57 -0700
Message-ID: <20260814224539.1523174-71-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129135

Point release. SRC_URI[sha256sum] filled in for the new tarball. Refreshed
0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-systems.patch: 2.8.144
widened the same guard lines with its own opt-in WITH_MUSL/WITH_POSIX_*_R
macros (which this recipe never defines), so the patch's automatic __GLIBC__
detection is still needed on top and was rebased onto the new line numbers
and macro list.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-signature-on-non-glibc-linux-musl-s.patch | 62 ++++++++++++-------
 .../{gsoap_2.8.142.bb => gsoap_2.8.144.bb}    |  2 +-
 2 files changed, 40 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.142.bb => gsoap_2.8.144.bb} (94%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
index 51ffde158e..a57b3ff23e 100644
--- a/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
+++ b/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
@@ -4,18 +4,23 @@ Date: Sun, 19 May 2024 17:11:20 -0700
 Subject: [PATCH] Provide strtod_l signature on non-glibc linux ( musl )
  systems
 
+Rebased on 2.8.144: upstream widened the same guard lines with its own
+opt-in WITH_MUSL/WITH_POSIX_*_R macros, which this recipe never defines, so
+the automatic __GLIBC__ detection this patch adds is still needed on top.
+
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gsoap/stdsoap2.c | 5 +++++
- 1 file changed, 5 insertions(+)
+ gsoap/stdsoap2.c   | 8 ++++++--
+ gsoap/stdsoap2.cpp | 8 ++++++--
+ 2 files changed, 12 insertions(+), 4 deletions(-)
 
 --- a/gsoap/stdsoap2.cpp
 +++ b/gsoap/stdsoap2.cpp
-@@ -74,6 +74,11 @@ A commercial use license is available fr
- 
+@@ -74,6 +74,11 @@
+
  #include "stdsoap2.h"
- 
+
 +#if defined(__linux__) && !defined(__GLIBC__)
 +struct __locale_struct;
 +double strtod_l(const char *__restrict, char **__restrict, struct __locale_struct *);
@@ -24,39 +29,39 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if GSOAP_VERSION != GSOAP_LIB_VERSION
  # error "GSOAP VERSION MISMATCH IN LIBRARY: PLEASE REINSTALL PACKAGE"
  #endif
-@@ -5460,7 +5465,7 @@ tcp_gethostbyname(struct soap *soap, con
+@@ -5460,7 +5465,7 @@
  {
  #if (defined(_AIX43) || defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R)
    struct hostent_data ht_data;
--#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
-+#elif (!defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
+-#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__) || defined(WITH_POSIX_GETHOSTBYNAME_R) || defined(WITH_MUSL)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
++#elif (!defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__) || defined(WITH_POSIX_GETHOSTBYNAME_R) || defined(WITH_MUSL)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
    int r;
    char *tmpbuf = soap->tmpbuf;
    size_t tmplen = sizeof(soap->tmpbuf);
-@@ -5493,7 +5498,7 @@ tcp_gethostbyname(struct soap *soap, con
+@@ -5493,7 +5498,7 @@
      hostent = NULL;
      soap->errnum = h_errno;
    }
--#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
-+#elif (!defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
+-#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__) || defined(WITH_POSIX_GETHOSTBYNAME_R) || defined(WITH_MUSL)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
++#elif (!defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__) || defined(WITH_POSIX_GETHOSTBYNAME_R) || defined(WITH_MUSL)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
    while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
    {
      if (tmpbuf != soap->tmpbuf)
-@@ -23192,7 +23197,7 @@ soap_strerror(struct soap *soap)
+@@ -23409,7 +23414,7 @@
    {
  #ifndef WIN32
  # ifdef HAVE_STRERROR_R
--#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R)
-+#  if !defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R)
+-#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R) || defined(WITH_MUSL)
++#  if !defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R) || defined(WITH_MUSL)
      err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
      if (err != 0)
        soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
 --- a/gsoap/stdsoap2.c
 +++ b/gsoap/stdsoap2.c
-@@ -74,6 +74,11 @@ A commercial use license is available fr
- 
+@@ -74,6 +74,11 @@
+
  #include "stdsoap2.h"
- 
+
 +#if defined(__linux__) && !defined(__GLIBC__)
 +struct __locale_struct;
 +double strtod_l(const char *__restrict, char **__restrict, struct __locale_struct *);
@@ -65,21 +70,32 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if GSOAP_VERSION != GSOAP_LIB_VERSION
  # error "GSOAP VERSION MISMATCH IN LIBRARY: PLEASE REINSTALL PACKAGE"
  #endif
-@@ -5493,7 +5498,7 @@ tcp_gethostbyname(struct soap *soap, con
+@@ -5460,7 +5465,7 @@
+ {
+ #if (defined(_AIX43) || defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R)
+   struct hostent_data ht_data;
+-#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__) || defined(WITH_POSIX_GETHOSTBYNAME_R) || defined(WITH_MUSL)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
++#elif (!defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__) || defined(WITH_POSIX_GETHOSTBYNAME_R) || defined(WITH_MUSL)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
+   int r;
+   char *tmpbuf = soap->tmpbuf;
+   size_t tmplen = sizeof(soap->tmpbuf);
+@@ -5493,7 +5498,7 @@
      hostent = NULL;
      soap->errnum = h_errno;
    }
--#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
-+#elif (!defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
+-#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__) || defined(WITH_POSIX_GETHOSTBYNAME_R) || defined(WITH_MUSL)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
++#elif (!defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__) || defined(WITH_POSIX_GETHOSTBYNAME_R) || defined(WITH_MUSL)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
    while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
    {
      if (tmpbuf != soap->tmpbuf)
-@@ -23263,7 +23268,7 @@ soap_strerror(struct soap *soap)
+@@ -23409,7 +23414,7 @@
    {
  #ifndef WIN32
  # ifdef HAVE_STRERROR_R
--#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R)
-+#  if !defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R)
+-#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R) || defined(WITH_MUSL)
++#  if !defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R) || defined(WITH_MUSL)
      err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
      if (err != 0)
        soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
+--
+2.43.0
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.144.bb
similarity index 94%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.144.bb
index f77b88fedd..5d4c99256b 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.144.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7eaf5d4df67c0db38549ba3c714a37d6 \
 
 SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
            file://0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch"
-SRC_URI[sha256sum] = "6d7196bd6591ec2977474c681e351b4a33eb5c2d64c9e2e6727b004f330b3752"
+SRC_URI[sha256sum] = "b981818fbbd4bf9f6f4feac03136800f6e16a7d0b7515924ff7a2661ca26e581"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/${BPN}2/files/"
 UPSTREAM_CHECK_REGEX = "${BPN}_(?P<pver>\d+(\.\d+)+)\.zip"

