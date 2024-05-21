Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FC2C41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:58 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.3103.1716315049045036225
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XfEL8Lkl;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ee38966529so777185ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315048; x=1716919848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpn7v6evRaFusG/WO4BCfLW/GJAjTErGkYh/TPo6FC0=;
        b=XfEL8LklhtbSiWlTgTGzsysg0RdjePYqMLy9+52/k+QAUVItrlTvC+n/ef566j7R3a
         DpKV5HVPN8gh+CGhnufKkgHxlXSV6KMolcjjIy0+Z9KtqlaVlglGgPvAeGXsRBuDHpf+
         2ntVjo4M3nfBgYBq5UXsmig6ja+BKW5JDn6UomUMCqR3TyO3KQ5Wpwm4ASuVQEKk/AQb
         ncU+pwxoqsbkn9geCII2ljsca+Uc/MWCWC9UECaDxpy5+/mU1q/8p0Kw3U30XoYdbY1n
         2xGxVt4GQJvkuJ6K/lfw80oCTFMSmcrICTXIyalfhstHUffykkVbC8RGnH6NFEFpcqsh
         KJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315048; x=1716919848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpn7v6evRaFusG/WO4BCfLW/GJAjTErGkYh/TPo6FC0=;
        b=l+ezOUnKReB8lVeMaZYdxhZPmjZ7Pj6j5RG6j+Kz2TP288wt51RA0UlsZjv9oFlgbj
         MM4OIy56rMT4L2C5NGhYTQ9wTsWZeqx7ajKqfiyjWhXrrif7eWuDrfcuTvMGMt1omx/0
         ItJQ5+i8PThMKMjyBvtXbno5DX2Hz7Y6cN+Wb4MTebjWoMOTU9eTRrQ9PZzCOchyb25Z
         GFopw4N73cDaJQTLTOir48AeTHwkycbYiepFPeiRFNRWBeHIPOkirky3p0IjmhgT8W/q
         ZjG6pv8OdrIHKdfqq2tbmWHqAUdnFdl5zfb1eaZgc2t7WhSUcJ+lfhHEdBi3nJAqshMs
         ErqA==
X-Gm-Message-State: AOJu0Yx5CSsse89jRhHglukVkl/mY0z5oMUYROpkbdYqQY+Oyo1b2AZV
	y9I3nISH057bt7D1mPZA5uRWYzAbX06U9fBTCXOj+RnBWbyn+uVcWBYUQYdcMis=
X-Google-Smtp-Source: AGHT+IF8OC5VU6b9b6ieCgLncF6QLp2wZTsu+5IfJ0Qre3uoVm3EOP2CYSGI0PcqyNsRRW0VzO40Dw==
X-Received: by 2002:a17:903:18d:b0:1f3:62c:247f with SMTP id d9443c01a7336-1f3062c27d8mr64725865ad.11.1716315048114;
        Tue, 21 May 2024 11:10:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 22/22] gsoap: Upgrade to 2.8.134
Date: Tue, 21 May 2024 11:10:23 -0700
Message-ID: <20240521181024.426176-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110471

Redo musl support patch such that it can always be applied

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-signature-on-non-glibc-linux-musl-s.patch | 85 ++++++++++++++++
 ...1-Simplify-check-for-gethostbyname_r.patch | 96 -------------------
 .../{gsoap_2.8.126.bb => gsoap_2.8.134.bb}    |  6 +-
 3 files changed, 88 insertions(+), 99 deletions(-)
 create mode 100644 meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
 delete mode 100644 meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.126.bb => gsoap_2.8.134.bb} (87%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
new file mode 100644
index 0000000000..df27a59ee7
--- /dev/null
+++ b/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
@@ -0,0 +1,85 @@
+From 2b7a51556185539a0f9baef0f109e0814933d6b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 May 2024 17:11:20 -0700
+Subject: [PATCH] Provide strtod_l signature on non-glibc linux ( musl )
+ systems
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gsoap/stdsoap2.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+--- a/gsoap/stdsoap2.cpp
++++ b/gsoap/stdsoap2.cpp
+@@ -74,6 +74,11 @@ A commercial use license is available fr
+ 
+ #include "stdsoap2.h"
+ 
++#if defined(__linux__) && !defined(__GLIBC__)
++struct __locale_struct;
++double strtod_l(const char *__restrict, char **__restrict, struct __locale_struct *);
++#endif
++
+ #if GSOAP_VERSION != GSOAP_LIB_VERSION
+ # error "GSOAP VERSION MISMATCH IN LIBRARY: PLEASE REINSTALL PACKAGE"
+ #endif
+@@ -5457,7 +5462,7 @@ tcp_gethostbyname(struct soap *soap, con
+ {
+ #if (defined(_AIX43) || defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R)
+   struct hostent_data ht_data;
+-#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
++#elif (!defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
+   int r;
+   char *tmpbuf = soap->tmpbuf;
+   size_t tmplen = sizeof(soap->tmpbuf);
+@@ -5490,7 +5495,7 @@ tcp_gethostbyname(struct soap *soap, con
+     hostent = NULL;
+     soap->errnum = h_errno;
+   }
+-#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
++#elif (!defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
+   while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
+   {
+     if (tmpbuf != soap->tmpbuf)
+@@ -23192,7 +23197,7 @@ soap_strerror(struct soap *soap)
+   {
+ #ifndef WIN32
+ # ifdef HAVE_STRERROR_R
+-#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
++#  if !defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
+     err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
+     if (err != 0)
+       soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
+--- a/gsoap/stdsoap2.c
++++ b/gsoap/stdsoap2.c
+@@ -74,6 +74,11 @@ A commercial use license is available fr
+ 
+ #include "stdsoap2.h"
+ 
++#if defined(__linux__) && !defined(__GLIBC__)
++struct __locale_struct;
++double strtod_l(const char *__restrict, char **__restrict, struct __locale_struct *);
++#endif
++
+ #if GSOAP_VERSION != GSOAP_LIB_VERSION
+ # error "GSOAP VERSION MISMATCH IN LIBRARY: PLEASE REINSTALL PACKAGE"
+ #endif
+@@ -5490,7 +5495,7 @@ tcp_gethostbyname(struct soap *soap, con
+     hostent = NULL;
+     soap->errnum = h_errno;
+   }
+-#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
++#elif (!defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && !defined(__QNX__) && !defined(QNX) && defined(HAVE_GETHOSTBYNAME_R)
+   while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
+   {
+     if (tmpbuf != soap->tmpbuf)
+@@ -23192,7 +23197,7 @@ soap_strerror(struct soap *soap)
+   {
+ #ifndef WIN32
+ # ifdef HAVE_STRERROR_R
+-#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
++#  if !defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
+     err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
+     if (err != 0)
+       soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch
deleted file mode 100644
index 6ae02deb24..0000000000
--- a/meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From fa923a50790c907725c822b2fc7d63b2da62b4ad Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 12 Mar 2023 13:34:55 -0700
-Subject: [PATCH] Simplify check for gethostbyname_r()
-
-This helps build fix with musl.
-
-Imported from Alpine: https://git.alpinelinux.org/aports/tree/community/gsoap/musl-fixes.patch
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- gsoap/stdsoap2.c   |  6 ++----
- gsoap/stdsoap2.cpp | 10 ++--------
- 2 files changed, 4 insertions(+), 12 deletions(-)
-
-diff --git a/gsoap/stdsoap2.c b/gsoap/stdsoap2.c
-index 654a1e1..fa31d02 100644
---- a/gsoap/stdsoap2.c
-+++ b/gsoap/stdsoap2.c
-@@ -5463,7 +5463,7 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
-     hostent = NULL;
-     soap->errnum = h_errno;
-   }
--#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && defined(HAVE_GETHOSTBYNAME_R)
-+#elif defined(HAVE_GETHOSTBYNAME_R)
-   while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
-   {
-     if (tmpbuf != soap->tmpbuf)
-@@ -5478,8 +5478,6 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
-     if (!tmpbuf)
-       break;
-   }
--#elif defined(HAVE_GETHOSTBYNAME_R)
--  hostent = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &soap->errnum);
- #elif defined(VXWORKS)
-   /* vxWorks compatible */
-   /* If the DNS resolver library resolvLib has been configured in the vxWorks
-@@ -23112,7 +23110,7 @@ soap_strerror(struct soap *soap)
-   {
- #ifndef WIN32
- # ifdef HAVE_STRERROR_R
--#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
-+#  if 1
-     err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
-     if (err != 0)
-       soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
-diff --git a/gsoap/stdsoap2.cpp b/gsoap/stdsoap2.cpp
-index 654a1e1..5fd5fd6 100644
---- a/gsoap/stdsoap2.cpp
-+++ b/gsoap/stdsoap2.cpp
-@@ -5430,7 +5430,7 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
- {
- #if (defined(_AIX43) || defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R)
-   struct hostent_data ht_data;
--#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && defined(HAVE_GETHOSTBYNAME_R)
-+#elif defined(HAVE_GETHOSTBYNAME_R)
-   int r;
-   char *tmpbuf = soap->tmpbuf;
-   size_t tmplen = sizeof(soap->tmpbuf);
-@@ -5463,7 +5463,7 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
-     hostent = NULL;
-     soap->errnum = h_errno;
-   }
--#elif (!defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && !defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600 || defined(__ANDROID__) || defined(FREEBSD) || defined(__FreeBSD__)) && !defined(SUN_OS) && defined(HAVE_GETHOSTBYNAME_R)
-+#elif defined(HAVE_GETHOSTBYNAME_R)
-   while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
-   {
-     if (tmpbuf != soap->tmpbuf)
-@@ -5478,8 +5478,6 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
-     if (!tmpbuf)
-       break;
-   }
--#elif defined(HAVE_GETHOSTBYNAME_R)
--  hostent = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &soap->errnum);
- #elif defined(VXWORKS)
-   /* vxWorks compatible */
-   /* If the DNS resolver library resolvLib has been configured in the vxWorks
-@@ -23112,13 +23110,9 @@ soap_strerror(struct soap *soap)
-   {
- #ifndef WIN32
- # ifdef HAVE_STRERROR_R
--#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
-     err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
-     if (err != 0)
-       soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
--#  else
--    return strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* GNU-specific */
--#  endif
- # else
-     return strerror(err);
- # endif
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.126.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
similarity index 87%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.126.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
index 6d8b53d308..5528e87e6c 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.126.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
@@ -5,9 +5,9 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
                     file://GPLv2_license.txt;md5=a33672dbe491b6517750a0389063508b"
 
-SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip"
-SRC_URI:append:libc-musl = " file://0001-Simplify-check-for-gethostbyname_r.patch"
-SRC_URI[sha256sum] = "b65190ebf8c2517d6fafbdc2000bc7bc650d921a02f4aa53eb1e3df267592c4a"
+SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
+           file://0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch"
+SRC_URI[sha256sum] = "63478e555c0ccde0164f055ff605b02805db0abc6712a04bcb14cb617b047218"
 
 inherit autotools
 
-- 
2.45.1


