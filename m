Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF24CD8C8C
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 15:00:18 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17483.1780758015802878139
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2026 08:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YBMbmznZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7dd7818ac2aso36109367b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780758015; x=1781362815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vswzktgX8tUGLlbnCt6UjJ17Iz0pNEcbtF8jhyvhyvE=;
        b=YBMbmznZWZDk71TL1OHeGZSfuXVVh/Cc0SJZWIctcQOn/qmVgW9W5G2wB7LLMRaCTy
         d/FWr2wHREiau3S1IadxLN3KjCLf53yQ9pD8K1TjWtJc8ZuWInW+Nd5vSB7ro0dJkUY2
         h2XxP2AVlwJ/6CwIe/zFdnhZWfOUjer6AG2gCtsWoVCS7+lGwAlSCQn2MANcK9bMOiJZ
         dDzAN+Hs2yN7dW7xbAGctnhAXrHjjrOY15w6LKdPk+rHkh7187zm64fIcN8NNkes1S5C
         enYF4OAL5wG1oLSUrLOAn2quqNxvm/l6wzU6UauUMenIEhqbgAyEpCb071bt5nkhPk+6
         N0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758015; x=1781362815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vswzktgX8tUGLlbnCt6UjJ17Iz0pNEcbtF8jhyvhyvE=;
        b=HKoc6oqmy4tPdqenay1eE4ZYZAYzMSUY5kowzpAwwDIFPTzhwINQVNhjj9hX63uYTo
         +y0SJqsOXwG+rCg++IW40XQc7FIYWbMjMjc/xaw8NnwAqluU2TPMhO6rfi7q+61uw4Lg
         TBob9kE0YeNVujqjsZlCsuHGqQ/xIMxH3utG9mBVpKGrHygmBkWPOyAfFw7SxP3GOkdh
         rv2eiP3tmFdz78FGqdbN7QHh+u5/eJiJZV9YWBmfGzm4Zvue+QT64ksUcn04jAZ3msNH
         dHHU3u30srDQ1SryEi4KsMRwtC5/aYWQcj1pLwUUKbkeLz+KOiIyAamk4plm/lLCPqoz
         4bfw==
X-Gm-Message-State: AOJu0Ywe7hTcPa5vEPed71vkLM/HGtKj/32l7jPN4SS8Ncj8E71x87+B
	cAz+WVe4NhyEvv6wY+PZPAJRDebx3Lbb4piCnYLNR/scKPCvqPmyRKkwpTAn1BHD
X-Gm-Gg: Acq92OFEpT7Aatpiuh8yXxDugadOe+pBYFg/RX40Tiw2nuHL7w4gN2eEPSRekCsMec5
	VIV0/HKvQ0x4PrCK9k33AWr6K9NVb8cM2EPKbuIJj8ZEXWMiaYFcGolmoTLDxqSCTuAA7UOpdes
	RxVk/WXDcgo7F9CpgMk6dDGHsKSho2BZE7mFCAStsgQADdAVKscd3S/m/y7NJqoOFv3FFzc4dU8
	cxh8wODlk+nGO6iH2vf/ZHH9cPSJf5U5Uibr0LFr9gri4vzQBv/S+Ryf9kuGhWceQtdFId7c3jN
	teTRmHWYVPgRfRAB7KmzICyJKngtcqZ8vEpuGNUZIg8gPbvgWzRByyyUiAP6O2DrBdrJ+fOzbZr
	8EjpztUKWlDJA9R96r3PDhCyinbvyW5ymdywnw7kXYLKIOykxQUOWodPKPD8/oUP/6kUOsSSN7s
	HuokAlUvyXDCLQbpglL3olbtOBYp3ewlzI9ZZAQdeOFbPFxMyeK7fM6u0RpzQoSGBfHYGRk/asw
	et69zftZ4acp+VzvoBzIeqTsPC0pHm2eLz9K2U60NKvSvsTIJo8z/YKwDv1gA==
X-Received: by 2002:a05:690c:d81:b0:7bd:8ce4:92b with SMTP id 00721157ae682-7ed0e184c6fmr78972527b3.17.1780758012989;
        Sat, 06 Jun 2026 08:00:12 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea2167b40bsm62202497b3.17.2026.06.06.08.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:00:12 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 1/2] gsoap: upgrade 2.8.137 -> 2.8.142
Date: Sat,  6 Jun 2026 11:00:02 -0400
Message-ID: <20260606150003.1054238-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2026 15:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127408

From the changelog.md file:

Version 2.8.142 (04/25/2026)
---
- Update heap memory management to free all auxiliary hash table data upon calling `soap_end()`, i.e. in addition to `soap_done()`, unless compiled in DEBUG mode that verifies memory consistency keeping auxiliary data until `soap_done()` is called.  This change aligns the behavior with pre-2.8.140 releases, while still benefiting from fast `soap_unlink()`.

Version 2.8.141 (04/08/2026)
---
- New HTTP-STREAMS plugin for persistent http(s) connections ("streams") to accelerate client threads.
- Minor update to support OpenSSL 4.

Version 2.8.140 (01/25/2026)
---
- Improved heap memory management (for deserialization storage) with a much faster `soap_unlink()` implementation by using pointer hash tables.
- Faster JSON parsers `json.c` (via `xml-rpc.c`) and `json.cpp` (via `xml-rpc.cpp`) with faster `soap_unlink()`.
- Changed `soap_link()` (an internal API function) to another fail-safe combination `soap_new_link()` and `soap_set_link()`.
- Fixed wsdl2h issue with a missing namespace URI (not found but needed to form a valid QName) when a schema A imports a schema B and schema B includes a chameleon schema C that defines an attributeGroup that is referenced by an attributeGroup reference in schema A.

Version 2.8.139 (07/14/2025)
---
- Add `WITH_POSIX_STRERROR_R` to force XSI-compliant POSIX `strerror_r` usage when compiling `stdsoap2.c` or `stdsoap2.cpp` from source; e.g. when compiling on Musl Linux the compile-time detection of the XSI-compliant `strerror_r` may fail, which leads to a compiler error.  To avoid this run `./configure CFLAGS=-DWITH_POSIX_STRERROR_R CXXFLAGS=-DWITH_POSIX_STRERROR_R`.
- Minor improvement of the `SOAP_XML_IGNORENS` (ignore XML namespaces) logic when performing non-strict XML validation (`SOAP_XML_STRICT` is not enabled) when ignoring extra XML extensibility elements in an inbound SOAP/XML message; no longer produces validation errors for non-serializable XML to "safely" ignore, unless strict XML validation is enabled with `SOAP_XML_STRICT`, as expected.

Version 2.8.138 (03/24/2025)
---
- The wsdl2h tool with SSL/TLS enabled for https no longer supports legacy SSLv3, only TLS 1.0 to 1.3, this avoids potential TLS/SSL handshake errors.
- Corrected a logic bug in wsdl2h for attribute/elemenet reference qualification for C++ class and C struct members in the generated header interface file for soapcpp2; the issue occurs in certain schema use cases when attributes/elements are referenced in the same schema target namespace, but depends on the schema attribute/element default form qualifications; the problem was inadvertently introduced in 2.8.95 despite our extensive test suite that includes the official W3C XML Data Bindings in gsoap/samples/autotest: this old problem was actually visible in the AttributeReferenceUnqualified log.  Because this is a specific case, the problem does not affect ONVIF and many other WSDLs and schemas.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../php/{php_8.5.6.bb => php_8.5.7.bb}           |  0
 ...d_l-signature-on-non-glibc-linux-musl-s.patch | 16 ++++++++--------
 .../gsoap/{gsoap_2.8.137.bb => gsoap_2.8.142.bb} |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.6.bb => php_8.5.7.bb} (100%)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.137.bb => gsoap_2.8.142.bb} (93%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.6.bb b/meta-oe/recipes-devtools/php/php_8.5.7.bb
similarity index 100%
rename from meta-oe/recipes-devtools/php/php_8.5.6.bb
rename to meta-oe/recipes-devtools/php/php_8.5.7.bb
diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
index df27a59ee7..51ffde158e 100644
--- a/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
+++ b/meta-oe/recipes-support/gsoap/gsoap/0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch
@@ -24,7 +24,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if GSOAP_VERSION != GSOAP_LIB_VERSION
  # error "GSOAP VERSION MISMATCH IN LIBRARY: PLEASE REINSTALL PACKAGE"
  #endif
-@@ -5457,7 +5462,7 @@ tcp_gethostbyname(struct soap *soap, con
+@@ -5460,7 +5465,7 @@ tcp_gethostbyname(struct soap *soap, con
  {
  #if (defined(_AIX43) || defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R)
    struct hostent_data ht_data;
@@ -33,7 +33,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    int r;
    char *tmpbuf = soap->tmpbuf;
    size_t tmplen = sizeof(soap->tmpbuf);
-@@ -5490,7 +5495,7 @@ tcp_gethostbyname(struct soap *soap, con
+@@ -5493,7 +5498,7 @@ tcp_gethostbyname(struct soap *soap, con
      hostent = NULL;
      soap->errnum = h_errno;
    }
@@ -46,8 +46,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    {
  #ifndef WIN32
  # ifdef HAVE_STRERROR_R
--#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
-+#  if !defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
+-#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R)
++#  if !defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R)
      err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
      if (err != 0)
        soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
@@ -65,7 +65,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if GSOAP_VERSION != GSOAP_LIB_VERSION
  # error "GSOAP VERSION MISMATCH IN LIBRARY: PLEASE REINSTALL PACKAGE"
  #endif
-@@ -5490,7 +5495,7 @@ tcp_gethostbyname(struct soap *soap, con
+@@ -5493,7 +5498,7 @@ tcp_gethostbyname(struct soap *soap, con
      hostent = NULL;
      soap->errnum = h_errno;
    }
@@ -74,12 +74,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    while ((r = gethostbyname_r(addr, hostent, tmpbuf, tmplen, &hostent, &soap->errnum)) < 0)
    {
      if (tmpbuf != soap->tmpbuf)
-@@ -23192,7 +23197,7 @@ soap_strerror(struct soap *soap)
+@@ -23263,7 +23268,7 @@ soap_strerror(struct soap *soap)
    {
  #ifndef WIN32
  # ifdef HAVE_STRERROR_R
--#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
-+#  if !defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)))
+-#  if !defined(_GNU_SOURCE) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R)
++#  if !defined(__GLIBC__) || (!(~_GNU_SOURCE+1) && ((!defined(_POSIX_C_SOURCE) && !defined(_XOPEN_SOURCE)) || (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600))) || defined(WITH_POSIX_STRERROR_R)
      err = strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
      if (err != 0)
        soap_strcpy(soap->msgbuf, sizeof(soap->msgbuf), "unknown error");
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.137.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
similarity index 93%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.137.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
index b91187c13f..974d99434a 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.137.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7eaf5d4df67c0db38549ba3c714a37d6 \
 
 SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
            file://0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch"
-SRC_URI[sha256sum] = "a6c9fb9088efd60ad0e983fa83d8440fe128514db22297b5b3f2de302106e55c"
+SRC_URI[sha256sum] = "6d7196bd6591ec2977474c681e351b4a33eb5c2d64c9e2e6727b004f330b3752"
 
 inherit autotools
 
-- 
2.43.0


