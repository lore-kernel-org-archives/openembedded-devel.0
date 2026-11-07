Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11962.1794070352884046987
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RNO/e/gN;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4919a880834so879445f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070351; x=1794675151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8d5K8nEQP6K2G6K2MVvCnYnBbR0c83fusIMaKN+wGM=;
        b=RNO/e/gNAWSUkMZX3zxVXGISwokEH1HLwXyxMB+LV+l1kqXlpIVj69BLwHYjcNfaEI
         yLtZR3JDgiEvqkSXCq/FcbrWtXISbBN3/tx5feeHLmIhlHbEBHNCwJEHpkzz1xNHxaVD
         PpDQkIs3s6Bte7cTqhx3vArpBCWWINoKOqbyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070351; x=1794675151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W8d5K8nEQP6K2G6K2MVvCnYnBbR0c83fusIMaKN+wGM=;
        b=DzSURkb4S3XnrCpWKdzjxHvQjJ2Z1h57Tds4aTNcAxCZ7sI0TkvQQpCdSmo9VirRic
         yoG8h50neQsVOfyrnekunIQKlbybBBZ7eXYMbSIH1SU9qWkeRXLpeUe5N/kt0StHC5AW
         c81Oh8rKphUsJt9tBijW+6RJWux/FjgMhpPjKmAdgP0hYAzfoBhuZx+DH1ixTWYtjPgl
         y1/KX0ykLehoP0NcFMD/npoUHBS2oUTqSKC//fCtWyb55B2YnckcJiCSJ5m6bXDZ9l+q
         vTxkQAsgcIkNAI8CqDFzNo+0rYlELQfQ5o8ADFeCU44c73yE1zlUy0DLY/mm7QQZNNsH
         K+Mg==
X-Gm-Message-State: APuU4Z+7SO1uqfYo72SJX/3PrlJMpmPQjaC/kUnJvUZZ1ew4u6nUMnxt
	NJC9d6FSNcKBzreZR+boeT8fPR4HxBOIEYVtA6qYwt0Khhl923eDiCJosEPYUmfvcF1Ywe6tcc2
	dLfBi
X-Gm-Gg: AYBFou0Nphe9YAYaVQmmy32zx8C/5EGPBgCX64jYm2QJtT8TRbctZTQt4Ejvbt3ktAU
	oRddlu+MKhiiFXBoK6qSLgVVn8QQxfRP2W3ZdvhHZDndIVrnU42Ip4NSr1fRIB+3EuUahLJv2qD
	UMENSlesFvj0XGPAa9drnk9yhgb4nXZMdXEMjtcmD2Xasc9GzlAzjYqlaRfsDn/cimUnM/7QzlF
	RTe2QWMJV84Oi6zNcuIiyFzjEpPC/ZqmpLA7hfHq7N84iurYGhkfnCK5KyQzT7ZoQwL/Fqw6UNG
	9Wlk4m/OPFF2siVEc52NgdAGETO+ogk8LpqwnK0AS3zl/QMcSRU2+X9H1OE59NAmF29Dxc7UmR/
	e96Jv69qsD7Wk0AXf1+NLZ5nPNPJEQOSm9kYz9xfO9BClh5A8pZ8QeknOtQU2qvhztjqr2MfBAf
	Q75HUpIyFPqPjFWHBdScvzcA3qEzwpHLQCOyYKAibfCFCIavSkr98E4HmUK3rvLJGdk3vNQpoXX
	m4JixZy10SD8pfoY7anOjcUvv6hUpaej9QWx9NosiCWs7lUfhUrEosilr1EcJ71pV59gMhfqDXU
	Znf04l1P2AIQpb2TXxUP/5EdVev5y6m9ZornbmK/mKiYeBT5001R6aBtn6ldyJzzHRhyFkTiY9F
	ludErjMppco5exSD3Ht+/YN9nO2FruAV8JKng18QyTK4QH1CtJUQ3LQ==
X-Received: by 2002:a5d:5d13:0:b0:48e:6f84:2e8e with SMTP id ffacd0b85a97d-49275eeefc2mr8251624f8f.39.1794070351128;
        Sat, 07 Nov 2026 08:52:31 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:30 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 08/22] gsoap: Upgrade 2.8.144 -> 2.8.146
Date: Sat,  7 Nov 2026 18:52:07 +0200
Message-ID: <20261107165221.122340-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131993
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.8.146:

- Update compile-time configuration option `WITH_SELF_PIPE` to use
  `poll()` when available.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-signature-on-non-glibc-linux-musl-s.patch | 46 ++++++++++---------
 .../{gsoap_2.8.144.bb => gsoap_2.8.146.bb}    |  2 +-
 2 files changed, 25 insertions(+), 23 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.144.bb => gsoap_2.8.146.bb} (94%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
index a57b3ff23e..b64009b6d7 100644
--- a/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
+++ b/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
@@ -1,4 +1,4 @@
-From 2b7a51556185539a0f9baef0f109e0814933d6b3 Mon Sep 17 00:00:00 2001
+From 2deca92607b4f399510e7e23c79192ebe3d2d15d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 19 May 2024 17:11:20 -0700
 Subject: [PATCH] Provide strtod_l signature on non-glibc linux ( musl )
@@ -11,16 +11,18 @@ the automatic __GLIBC__ detection this patch adds is still needed on top.
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gsoap/stdsoap2.c   | 8 ++++++--
- gsoap/stdsoap2.cpp | 8 ++++++--
- 2 files changed, 12 insertions(+), 4 deletions(-)
-
---- a/gsoap/stdsoap2.cpp
-+++ b/gsoap/stdsoap2.cpp
-@@ -74,6 +74,11 @@
+ gsoap/stdsoap2.c   | 11 ++++++++---
+ gsoap/stdsoap2.cpp | 11 ++++++++---
+ 2 files changed, 16 insertions(+), 6 deletions(-)
 
+diff --git a/gsoap/stdsoap2.c b/gsoap/stdsoap2.c
+index 554b059..f4fcfd7 100644
+--- a/gsoap/stdsoap2.c
++++ b/gsoap/stdsoap2.c
+@@ -74,6 +74,11 @@ A commercial use license is available from Genivia, Inc., contact@genivia.com
+ 
  #include "stdsoap2.h"
-
+ 
 +#if defined(__linux__) && !defined(__GLIBC__)
 +struct __locale_struct;
 +double strtod_l(const char *__restrict, char **__restrict, struct __locale_struct *);
@@ -29,7 +31,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if GSOAP_VERSION != GSOAP_LIB_VERSION
  # error "GSOAP VERSION MISMATCH IN LIBRARY: PLEASE REINSTALL PACKAGE"
  #endif
-@@ -5460,7 +5465,7 @@
+@@ -5467,7 +5472,7 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
  {
  #if (defined(_AIX43) || defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R)
    struct hostent_data ht_data;
@@ -38,7 +40,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    int r;
    char *tmpbuf = soap->tmpbuf;
    size_t tmplen = sizeof(soap->tmpbuf);
-@@ -5493,7 +5498,7 @@
+@@ -5500,7 +5505,7 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
      hostent = NULL;
      soap->errnum = h_errno;
    }
@@ -47,7 +49,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
    {
      if (tmpbuf != soap->tmpbuf)
-@@ -23409,7 +23414,7 @@
+@@ -23432,7 +23437,7 @@ soap_strerror(struct soap *soap)
    {
  #ifndef WIN32
  # ifdef HAVE_STRERROR_R
@@ -56,12 +58,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
      if (err != 0)
        soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
---- a/gsoap/stdsoap2.c
-+++ b/gsoap/stdsoap2.c
-@@ -74,6 +74,11 @@
-
+diff --git a/gsoap/stdsoap2.cpp b/gsoap/stdsoap2.cpp
+index 554b059..f4fcfd7 100644
+--- a/gsoap/stdsoap2.cpp
++++ b/gsoap/stdsoap2.cpp
+@@ -74,6 +74,11 @@ A commercial use license is available from Genivia, Inc., contact@genivia.com
+ 
  #include "stdsoap2.h"
-
+ 
 +#if defined(__linux__) && !defined(__GLIBC__)
 +struct __locale_struct;
 +double strtod_l(const char *__restrict, char **__restrict, struct __locale_struct *);
@@ -70,7 +74,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if GSOAP_VERSION != GSOAP_LIB_VERSION
  # error "GSOAP VERSION MISMATCH IN LIBRARY: PLEASE REINSTALL PACKAGE"
  #endif
-@@ -5460,7 +5465,7 @@
+@@ -5467,7 +5472,7 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
  {
  #if (defined(_AIX43) || defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R)
    struct hostent_data ht_data;
@@ -79,7 +83,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    int r;
    char *tmpbuf = soap->tmpbuf;
    size_t tmplen = sizeof(soap->tmpbuf);
-@@ -5493,7 +5498,7 @@
+@@ -5500,7 +5505,7 @@ tcp_gethostbyname(struct soap *soap, const char *addr, struct hostent *hostent,
      hostent = NULL;
      soap->errnum = h_errno;
    }
@@ -88,7 +92,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
    {
      if (tmpbuf != soap->tmpbuf)
-@@ -23409,7 +23414,7 @@
+@@ -23432,7 +23437,7 @@ soap_strerror(struct soap *soap)
    {
  #ifndef WIN32
  # ifdef HAVE_STRERROR_R
@@ -97,5 +101,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
      if (err != 0)
        soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
---
-2.43.0
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.144.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.146.bb
similarity index 94%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.144.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.146.bb
index 5d4c99256b..ca9919f4d0 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.144.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.146.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7eaf5d4df67c0db38549ba3c714a37d6 \
 
 SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
            file://0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch"
-SRC_URI[sha256sum] = "b981818fbbd4bf9f6f4feac03136800f6e16a7d0b7515924ff7a2661ca26e581"
+SRC_URI[sha256sum] = "821af2ecfb93ca9dbd9bdae67fa0d57f9165fb4252bb40e23cd510dc4d49ec98"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/${BPN}2/files/"
 UPSTREAM_CHECK_REGEX = "${BPN}_(?P<pver>\d+(\.\d+)+)\.zip"
-- 
2.47.3

