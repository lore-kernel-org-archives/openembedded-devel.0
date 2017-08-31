Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 335AD77D6C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 05:28:35 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 63so6599276pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 22:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VtgJTlIeyT12SpW1xDPEPR1w4RQwG3gjB6GlEcJx0tw=;
	b=TJNEypEOOjDIGLcHdx8KwdZlAqwnDdDjNnhMHOXh84183utLRqA5K5amnLVnch5xJM
	M4E/K5xai03RK8pukNRPdpLs4uKEHb6BRwp5r61cOZqn1pB5B01zK/wz4aT85VMu7IrK
	Tt33xEtxTYr7+yUCMCuYbxgmw8ZOKwK9n51qO9SMjyHGIlsqE/GpFLhjtvfYaiRZS8Re
	9WXffpI22BrXgUevrBsbDTREq5KY/uCIqtuNVWRNygEYVYi51NL6OF07nza+jQOL10Zx
	kIz90EAvl4Hnygweyt4fxjt25vk+oEvHA8NbEfMmESCRwhVYHtBH0PnTf0ag0/Khhuk2
	QBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VtgJTlIeyT12SpW1xDPEPR1w4RQwG3gjB6GlEcJx0tw=;
	b=o6ONjF8oDi1CWJPPPja+fd8T+sSwpQmBjHy8Rek+GPg/u3fUWEeVVCSNuFgMWA1qCd
	Ll9Cimzppg7ldkttL86mZpaQkhFtbeuyqbvxxikr1TyUbMyheqWcfqfoQ1S+yn2/2bUP
	NBC/wStjHTACZNjcQ+a3WAeJHTmC93oorF8N81XCK/Hrsxv8jFa7DirB1zT15BXlcbUq
	0q++uWuPwkCBWs8qTbN11i3S1GYFO6IkrFaWFgACYbOvA/IZsLlwqHWfSdMMmSZhcz9G
	CP+mQfaACw6I2jh/fkpORhL+D4ZnYhEIL0sLvePoWX5zcdv02LVD/za4nX/PeahUA6uJ
	CFgw==
X-Gm-Message-State: AHYfb5gv6K3Oye12Nx+9VAW81+iXtqVMOIbdNW0sqXwSX8qcU7b90vhl
	lKHzQswmro3qRIvx
X-Received: by 10.99.122.69 with SMTP id j5mr1105279pgn.18.1504157317045;
	Wed, 30 Aug 2017 22:28:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	y81sm11737754pfi.153.2017.08.30.22.28.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 22:28:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Aug 2017 22:28:27 -0700
Message-Id: <20170831052827.34529-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831052827.34529-1-raj.khem@gmail.com>
References: <20170831052827.34529-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] gsoap: Fix build with musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Aug 2017 05:28:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gsoap/0001-stdgsoap2-Fix-build-with-musl.patch | 63 ++++++++++++++++++++++
 meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb      |  3 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-build-with-musl.patch

diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-build-with-musl.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-build-with-musl.patch
new file mode 100644
index 000000000..571cbe540
--- /dev/null
+++ b/meta-oe/recipes-support/gsoap/gsoap/0001-stdgsoap2-Fix-build-with-musl.patch
@@ -0,0 +1,63 @@
+From db260fbc7af4c73c997c485a0c69c61594a0e59c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Aug 2017 19:48:50 -0700
+Subject: [PATCH] stdgsoap2: Fix build with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gsoap/stdsoap2.c   | 2 +-
+ gsoap/stdsoap2.cpp | 4 ++--
+ gsoap/stdsoap2.h   | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gsoap/stdsoap2.c b/gsoap/stdsoap2.c
+index 58e9df4..62389e1 100644
+--- a/gsoap/stdsoap2.c
++++ b/gsoap/stdsoap2.c
+@@ -4462,7 +4462,7 @@ tcp_gethost(struct soap *soap, const char *addr, struct in_addr *inaddr)
+       return soap->error = SOAP_EOM;
+     return SOAP_OK;
+   }
+-#if defined(__GLIBC__) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FREEBSD) || defined(__FreeBSD__))) || defined(__ANDROID__)
++#if defined(LINUX) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FREEBSD) || defined(__FreeBSD__))) || defined(__ANDROID__)
+   if (gethostbyname_r(addr, &hostent, soap->buf, sizeof(soap->buf), &host, &soap->errnum) < 0)
+     host = NULL;
+ #elif defined(_AIX43) || ((defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R))
+diff --git a/gsoap/stdsoap2.cpp b/gsoap/stdsoap2.cpp
+index 58e9df4..b637161 100644
+--- a/gsoap/stdsoap2.cpp
++++ b/gsoap/stdsoap2.cpp
+@@ -4462,7 +4462,7 @@ tcp_gethost(struct soap *soap, const char *addr, struct in_addr *inaddr)
+       return soap->error = SOAP_EOM;
+     return SOAP_OK;
+   }
+-#if defined(__GLIBC__) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FREEBSD) || defined(__FreeBSD__))) || defined(__ANDROID__)
++#if defined(LINUX) || (defined(HAVE_GETHOSTBYNAME_R) && (defined(FREEBSD) || defined(__FreeBSD__))) || defined(__ANDROID__)
+   if (gethostbyname_r(addr, &hostent, soap->buf, sizeof(soap->buf), &host, &soap->errnum) < 0)
+     host = NULL;
+ #elif defined(_AIX43) || ((defined(TRU64) || defined(HP_UX)) && defined(HAVE_GETHOSTBYNAME_R))
+@@ -19658,7 +19658,7 @@ soap_strerror(struct soap *soap)
+   {
+ #ifndef WIN32
+ # ifdef HAVE_STRERROR_R
+-#  if defined(_GNU_SOURCE) && !defined(__ANDROID__)
++#  if defined(_GNU_SOURCE) && !defined(__ANDROID__) && defined(__GLIBC__)
+     return strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* GNU-specific */
+ #  else
+     strerror_r(err, soap->msgbuf, sizeof(soap->msgbuf)); /* XSI-compliant */
+diff --git a/gsoap/stdsoap2.h b/gsoap/stdsoap2.h
+index 07a3952..c6ace4c 100644
+--- a/gsoap/stdsoap2.h
++++ b/gsoap/stdsoap2.h
+@@ -947,7 +947,7 @@ extern "C" {
+ # endif
+ #elif defined(SOCKLEN_T)
+ # define SOAP_SOCKLEN_T SOCKLEN_T
+-#elif defined(__socklen_t_defined) || defined(_SOCKLEN_T) || defined(CYGWIN) || defined(FREEBSD) || defined(__FreeBSD__) || defined(OPENBSD) || defined(__QNX__) || defined(QNX) || defined(OS390) || defined(__ANDROID__) || defined(_XOPEN_SOURCE)
++#elif defined(__socklen_t_defined) || defined(_SOCKLEN_T) || defined(CYGWIN) || defined(FREEBSD) || defined(__FreeBSD__) || defined(OPENBSD) || defined(__QNX__) || defined(QNX) || defined(OS390) || defined(__ANDROID__) || defined(_XOPEN_SOURCE) || defined (LINUX)
+ # define SOAP_SOCKLEN_T socklen_t
+ #elif defined(IRIX) || defined(WIN32) || defined(__APPLE__) || defined(SUN_OS) || defined(OPENSERVER) || defined(TRU64) || defined(VXWORKS)
+ # define SOAP_SOCKLEN_T int
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
index 41fccb533..887584461 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
            file://0001-Fix-out-of-tree-builds.patch \
-"
+           file://0001-stdgsoap2-Fix-build-with-musl.patch \
+           "
 SRC_URI[md5sum] = "212951d6e1435bb51fa4320f458809ea"
 SRC_URI[sha256sum] = "3e7bb24a9e492f5cb86daca34054c9787152f1d7b70add36b789d03816d5ffa1"
 
-- 
2.14.1


