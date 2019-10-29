Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E02207FA25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:31:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472gCM3Xs3zRY
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572373887;
	bh=CZHS+O7uHudG+qPyLTEA2jlkjkaR5+0n0BbvLiPREdA=;
	h=From:To:Subject:Date:From;
	b=XffGC+Z2AFKwfrw5orwbh7YMx7NLqI6M7sVK3UNecr+5SJPdDiYNCptaJ49mq/aql
	OWkEAd1PFT8k87QJ6QuoAb15s20MZVhzOdbdH407S8UjHW+l8IQnsmbcWDtgJVoejE
	azSqAWii16gLZ/i/1jY0CRfZaBIBLXoDku9wP8DJpknVB8zgTgpQePl+e1moSXovfm
	PIxwcypwxScrFJGayYx56pAKzmfNJFICGpvXGl8rJfSr2O6M+XSItbFQK19vy8IAus
	CBcSI4+VMWogIPjS8PJwIQrzzZOGikT6JYIksVx5/VqwMvjxfVH+PN5EqZC1W2jk1p
	o9lH1imZnwvbUW+Dqs/xugmnwsarS2urLLafqkPiUk/Vq5HZlYG5KxI0dZM0xTEEuZ
	uCxvJh496o1XM5xITP9lqRTy0Talk20gveECuhQIaAkDD728BNbCNDgtpJWrE/+bHR
	g/0+pxs2fiEpLH9HwqgAx7vrNz84CUcF5NkdL5pCS+RRQQOcXyHQn8qF35Ys4tF5TT
	FHIqfr9rS3vopwXKHcEHh9C+mEAcWFKCj2O3emdqE12tBJrpbIAYw+e5EZcfuoxht4
	9I8CrfY33F8jpFgtwZ8jCymzQWpg4VX4ZLCFUo9f1jbQV+Q+8IjHULm25WAmZz1PXt
	qMAFXBtw+t9sSPoREwQmBQz8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 20:31:21 +0200
Message-Id: <20191029183123.1868-8-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libnss-nisplus: Upgrade to the latest upstream git
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
X-List-Received-Date: Tue, 29 Oct 2019 18:31:27 -0000

Patch applied upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libnss-nisplus/libnss-nisplus.bb          |   3 +-
 ...us-hosts-Remove-use-of-RES_USE_INET6.patch | 245 ------------------
 2 files changed, 1 insertion(+), 247 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus/0001-nisplus-hosts-Remove-use-of-RES_USE_INET6.patch

diff --git a/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb b/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb
index 3a0a87eea..c9d259b1a 100644
--- a/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb
+++ b/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb
@@ -15,10 +15,9 @@ DEPENDS += "libtirpc libnsl2"
 
 PV = "1.3+git${SRCPV}"
 
-SRCREV = "c6934373c7bac91499ff7bbe7d2439599325ca63"
+SRCREV = "116219e215858f4af9370171d3ead63baca8fdb4"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nisplus \
-           file://0001-nisplus-hosts-Remove-use-of-RES_USE_INET6.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus/0001-nisplus-hosts-Remove-use-of-RES_USE_INET6.patch b/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus/0001-nisplus-hosts-Remove-use-of-RES_USE_INET6.patch
deleted file mode 100644
index cf380ddf4..000000000
--- a/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus/0001-nisplus-hosts-Remove-use-of-RES_USE_INET6.patch
+++ /dev/null
@@ -1,245 +0,0 @@
-From 184bda40e05053cd2df61c28bec0baa7353697bb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 28 Aug 2019 09:49:10 -0700
-Subject: [PATCH] nisplus-hosts: Remove use of RES_USE_INET6
-
-Upstream glibc dropped it starting glibc 2.30
-see
-https://sourceware.org/git/?p=glibc.git;a=commit;h=3f8b44be0a658266adff5ece1e4bc3ce097a5dbe
-
-Upstream-Status: Submitted [https://github.com/thkukuk/libnss_nisplus/pull/2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Makefile.am     |  3 +-
- src/mapv4v6addr.h   | 69 ---------------------------------------------
- src/nisplus-hosts.c | 58 ++++++++-----------------------------
- 3 files changed, 13 insertions(+), 117 deletions(-)
- delete mode 100644 src/mapv4v6addr.h
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index e879d5c..37ef86c 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -15,8 +15,7 @@ AM_CPPFLAGS = -I$(srcdir) @TIRPC_CFLAGS@ @LIBNSL_CFLAGS@
- 
- lib_LTLIBRARIES = libnss_nisplus.la
- 
--noinst_HEADERS = libc-lock.h nss-nisplus.h netgroup.h nisplus-parser.h \
--		 mapv4v6addr.h
-+noinst_HEADERS = libc-lock.h nss-nisplus.h netgroup.h nisplus-parser.h
- check_PROGRAMS = nss_loader-test
- nss_loader_test_LDADD = -ldl
- 
-diff --git a/src/mapv4v6addr.h b/src/mapv4v6addr.h
-deleted file mode 100644
-index 7f85f7d..0000000
---- a/src/mapv4v6addr.h
-+++ /dev/null
-@@ -1,69 +0,0 @@
--/*
-- * ++Copyright++ 1985, 1988, 1993
-- * -
-- * Copyright (c) 1985, 1988, 1993
-- *    The Regents of the University of California.  All rights reserved.
-- *
-- * Redistribution and use in source and binary forms, with or without
-- * modification, are permitted provided that the following conditions
-- * are met:
-- * 1. Redistributions of source code must retain the above copyright
-- *    notice, this list of conditions and the following disclaimer.
-- * 2. Redistributions in binary form must reproduce the above copyright
-- *    notice, this list of conditions and the following disclaimer in the
-- *    documentation and/or other materials provided with the distribution.
-- * 4. Neither the name of the University nor the names of its contributors
-- *    may be used to endorse or promote products derived from this software
-- *    without specific prior written permission.
-- *
-- * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
-- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
-- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-- * SUCH DAMAGE.
-- * -
-- * Portions Copyright (c) 1993 by Digital Equipment Corporation.
-- *
-- * Permission to use, copy, modify, and distribute this software for any
-- * purpose with or without fee is hereby granted, provided that the above
-- * copyright notice and this permission notice appear in all copies, and that
-- * the name of Digital Equipment Corporation not be used in advertising or
-- * publicity pertaining to distribution of the document or software without
-- * specific, written prior permission.
-- *
-- * THE SOFTWARE IS PROVIDED "AS IS" AND DIGITAL EQUIPMENT CORP. DISCLAIMS ALL
-- * WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES
-- * OF MERCHANTABILITY AND FITNESS.   IN NO EVENT SHALL DIGITAL EQUIPMENT
-- * CORPORATION BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
-- * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
-- * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
-- * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
-- * SOFTWARE.
-- * -
-- * --Copyright--
-- */
--
--#include <string.h>
--#include <arpa/nameser.h>
--
--static void
--map_v4v6_address (const char *src, char *dst)
--{
--  u_char *p = (u_char *) dst;
--  int i;
--
--  /* Move the IPv4 part to the right position.  */
--  memcpy (dst + 12, src, INADDRSZ);
--
--  /* Mark this ipv6 addr as a mapped ipv4. */
--  for (i = 0; i < 10; i++)
--    *p++ = 0x00;
--  *p++ = 0xff;
--  *p = 0xff;
--}
-diff --git a/src/nisplus-hosts.c b/src/nisplus-hosts.c
-index cc00aa2..d37b209 100644
---- a/src/nisplus-hosts.c
-+++ b/src/nisplus-hosts.c
-@@ -42,14 +42,9 @@ static u_long tablename_len;
- #define NISENTRYLEN(idx, col, res) \
- 	(NIS_RES_OBJECT (res)[idx].EN_data.en_cols.en_cols_val[col].ec_value.ec_value_len)
- 
--/* Get implementation for some internal functions. */
--#include "mapv4v6addr.h"
--
--
- static int
- _nss_nisplus_parse_hostent (nis_result *result, int af, struct hostent *host,
--			    char *buffer, size_t buflen, int *errnop,
--			    int flags)
-+			    char *buffer, size_t buflen, int *errnop)
- {
-   unsigned int i;
-   char *first_unused = buffer;
-@@ -66,8 +61,7 @@ _nss_nisplus_parse_hostent (nis_result *result, int af, struct hostent *host,
- 
-   char *data = first_unused;
- 
--  if (room_left < (af != AF_INET || (flags & AI_V4MAPPED) != 0
--		   ? IN6ADDRSZ : INADDRSZ))
-+  if (room_left < INADDRSZ)
-     {
-     no_more_room:
-       *errnop = ERANGE;
-@@ -78,18 +72,8 @@ _nss_nisplus_parse_hostent (nis_result *result, int af, struct hostent *host,
-   if (af != AF_INET6
-       && inet_pton (AF_INET, NISENTRYVAL (0, 2, result), data) > 0)
-     {
--      assert ((flags & AI_V4MAPPED) == 0 || af != AF_UNSPEC);
--      if (flags & AI_V4MAPPED)
--	{
--	  map_v4v6_address (data, data);
--	  host->h_addrtype = AF_INET6;
--	  host->h_length = IN6ADDRSZ;
--	}
--      else
--	{
--	  host->h_addrtype = AF_INET;
--	  host->h_length = INADDRSZ;
--	}
-+      host->h_addrtype = AF_INET;
-+      host->h_length = INADDRSZ;
-     }
-   else if (af != AF_INET
- 	   && inet_pton (AF_INET6, NISENTRYVAL (0, 2, result), data) > 0)
-@@ -319,12 +303,8 @@ internal_nisplus_gethostent_r (struct hostent *host, char *buffer,
- 	    }
- 	}
- 
--      if (_res.options & RES_USE_INET6)
--	parse_res = _nss_nisplus_parse_hostent (result, AF_INET6, host, buffer,
--						buflen, errnop, AI_V4MAPPED);
--      else
--	parse_res = _nss_nisplus_parse_hostent (result, AF_INET, host, buffer,
--						buflen, errnop, 0);
-+      parse_res = _nss_nisplus_parse_hostent (result, AF_INET, host, buffer,
-+						buflen, errnop);
- 
-       if (parse_res == -1)
- 	{
-@@ -379,7 +359,7 @@ get_tablename (int *herrnop)
- static enum nss_status
- internal_gethostbyname2_r (const char *name, int af, struct hostent *host,
- 			   char *buffer, size_t buflen, int *errnop,
--			   int *herrnop, int flags)
-+			   int *herrnop)
- {
-   if (tablename_val == NULL)
-     {
-@@ -454,7 +434,7 @@ internal_gethostbyname2_r (const char *name, int af, struct hostent *host,
-     }
- 
-   int parse_res = _nss_nisplus_parse_hostent (result, af, host, buffer,
--					      buflen, errnop, flags);
-+					      buflen, errnop);
- 
-   nis_freeresult (result);
- 
-@@ -485,8 +465,7 @@ _nss_nisplus_gethostbyname2_r (const char *name, int af, struct hostent *host,
-     }
- 
-   return internal_gethostbyname2_r (name, af, host, buffer, buflen, errnop,
--				    herrnop,
--			 ((_res.options & RES_USE_INET6) ? AI_V4MAPPED : 0));
-+				    herrnop);
- }
- 
- 
-@@ -495,19 +474,8 @@ _nss_nisplus_gethostbyname_r (const char *name, struct hostent *host,
- 			      char *buffer, size_t buflen, int *errnop,
- 			      int *h_errnop)
- {
--  if (_res.options & RES_USE_INET6)
--    {
--      enum nss_status status;
--
--      status = internal_gethostbyname2_r (name, AF_INET6, host, buffer,
--					  buflen, errnop, h_errnop,
--					  AI_V4MAPPED);
--      if (status == NSS_STATUS_SUCCESS)
--	return status;
--    }
--
-   return internal_gethostbyname2_r (name, AF_INET, host, buffer,
--				   buflen, errnop, h_errnop, 0);
-+				   buflen, errnop, h_errnop);
- }
- 
- 
-@@ -555,9 +523,7 @@ _nss_nisplus_gethostbyaddr_r (const void *addr, socklen_t addrlen, int af,
-     }
- 
-   parse_res = _nss_nisplus_parse_hostent (result, af, host,
--					  buffer, buflen, errnop,
--					  ((_res.options & RES_USE_INET6)
--					   ? AI_V4MAPPED : 0));
-+					  buffer, buflen, errnop);
-   nis_freeresult (result);
- 
-   if (parse_res > 0)
-@@ -584,7 +550,7 @@ _nss_nisplus_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
- 
-   enum nss_status status = internal_gethostbyname2_r (name, AF_UNSPEC, &host,
- 						      buffer, buflen,
--						      errnop, herrnop, 0);
-+						      errnop, herrnop);
-   if (status == NSS_STATUS_SUCCESS)
-     {
-       if (*pat == NULL)
--- 
-2.23.0
-
-- 
2.17.1


