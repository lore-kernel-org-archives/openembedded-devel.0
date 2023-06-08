Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B9CC7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 07:37:47 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.3739.1686209861343355594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 00:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=kgVaaFbS;
 spf=pass (domain: mvista.com, ip: 209.85.215.173, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-543c6a2aa07so86971a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 00:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686209860; x=1688801860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZa+Xmw2UuTyqGv2rqVKdPy8xdKDPtJhsWCslYlu0qA=;
        b=kgVaaFbSdSwcPu1aSnBAd1mauieNBXpHo0ps1MeJRutlwr1RKT36FHZ+PVOl6OXScP
         O9eDf9d0TnA4oRXpF75vQe8Ccdphadeg6QTHRpK/LqrOtq2Ei2aCgaznPc1vdLETqVua
         y4UHu3JQbEzMtWnrt4V4A7cg9eEYQPdsDCS3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686209860; x=1688801860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZa+Xmw2UuTyqGv2rqVKdPy8xdKDPtJhsWCslYlu0qA=;
        b=hX2ouZwI8lTTC2JhYSfTVTK0JUUe2ycx1qN7mLKaw4DaPBdcVWWt1zdU8wCI5W8lqF
         JC92C48mocVqCkDz1IrQYT2EvvPBkvW/gl06rGsey57DjT5CTnlB+VDO9bRbODNPSqnC
         rfA515C/UIVfE0meuLzJEB3UuhJ4YHhcFeClOiVPPGksyThJPBU4NSNnjPhOPeiA9j9Z
         CbnZktO/CnK+jT+Js6kTlyksKulA0+I17T/hC8vcwXlZPrhym4DMEASIyw89efeU5qdH
         SHgSRyo42SeY02VSeFfhdpuZXOUBRhruDEqRerapRaVchA6iDQGpR3JEEkSOABABIflh
         Rlrg==
X-Gm-Message-State: AC+VfDwx6rxjumxNb9HeOgMm37of5AXs3GFvImlKkvt8+tvehnqgvPX6
	KqFE9wVhE7oNQggfXZSj6Hf61UOe+f7wozZJMbo=
X-Google-Smtp-Source: ACHHUZ4Vwe/2iF0K9+X4COpmI7NBdfUrKxpFProJNquSUeMHiiEU6Yx/rqv2FV2X3sr8viygrPSu8Q==
X-Received: by 2002:a05:6a20:3d1c:b0:118:ed8a:af35 with SMTP id y28-20020a056a203d1c00b00118ed8aaf35mr230616pzi.16.1686209859653;
        Thu, 08 Jun 2023 00:37:39 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.74.131.76])
        by smtp.googlemail.com with ESMTPSA id r3-20020a170902be0300b001a98f844e60sm728112pls.263.2023.06.08.00.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:37:39 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] c-ares: fix CVEs CVE-2023-32067 and CVE-2023-31130
Date: Thu,  8 Jun 2023 13:07:18 +0530
Message-Id: <20230608073718.339757-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 07:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103184

Fix below CVE:
1)CVE-2023-32067 c-ares: 0-byte UDP payload Denial of Service.
2)CVE-2023-31130 c-ares: Buffer Underwrite in ares_inet_net_pton().

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../c-ares/c-ares/CVE-2023-31130.patch        | 328 ++++++++++++++++++
 .../c-ares/c-ares/CVE-2023-32067.patch        |  85 +++++
 .../recipes-support/c-ares/c-ares_1.18.1.bb   |   2 +
 3 files changed, 415 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31130.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31130.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31130.patch
new file mode 100644
index 0000000000..3e507f7cda
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31130.patch
@@ -0,0 +1,328 @@
+From f22cc01039b6473b736d3bf438f56a2654cdf2b2 Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Mon, 22 May 2023 06:51:34 -0400
+Subject: [PATCH] Merge pull request from GHSA-x6mf-cxr9-8q6v
+
+* Merged latest OpenBSD changes for inet_net_pton_ipv6() into c-ares.
+* Always use our own IP conversion functions now, do not delegate to OS
+  so we can have consistency in testing and fuzzing.
+* Removed bogus test cases that never should have passed.
+* Add new test case for crash bug found.
+
+Fix By: Brad House (@bradh352)
+
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/f22cc01039b6473b736d3bf438f56a2654cdf2b2.patch]
+CVE: CVE-2023-31130
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/lib/inet_net_pton.c    | 155 ++++++++++++++++++++-----------------
+ test/ares-test-internal.cc |   7 +-
+ 2 files changed, 86 insertions(+), 76 deletions(-)
+
+diff --git a/src/lib/inet_net_pton.c b/src/lib/inet_net_pton.c
+index 840de50..fc50425 100644
+--- a/src/lib/inet_net_pton.c
++++ b/src/lib/inet_net_pton.c
+@@ -1,19 +1,20 @@
+ 
+ /*
+- * Copyright (c) 2004 by Internet Systems Consortium, Inc. ("ISC")
++ * Copyright (c) 2012 by Gilles Chehade <gilles@openbsd.org>
+  * Copyright (c) 1996,1999 by Internet Software Consortium.
+  *
+  * Permission to use, copy, modify, and distribute this software for any
+  * purpose with or without fee is hereby granted, provided that the above
+  * copyright notice and this permission notice appear in all copies.
+  *
+- * THE SOFTWARE IS PROVIDED "AS IS" AND ISC DISCLAIMS ALL WARRANTIES
+- * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+- * MERCHANTABILITY AND FITNESS.  IN NO EVENT SHALL ISC BE LIABLE FOR
+- * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+- * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
+- * OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ * THE SOFTWARE IS PROVIDED "AS IS" AND INTERNET SOFTWARE CONSORTIUM DISCLAIMS
++ * ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERNET SOFTWARE
++ * CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
++ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
++ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
++ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
++ * SOFTWARE.
+  */
+ 
+ #include "ares_setup.h"
+@@ -35,9 +36,6 @@
+ 
+ const struct ares_in6_addr ares_in6addr_any = { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 } } };
+ 
+-
+-#ifndef HAVE_INET_NET_PTON
+-
+ /*
+  * static int
+  * inet_net_pton_ipv4(src, dst, size)
+@@ -60,7 +58,7 @@ const struct ares_in6_addr ares_in6addr_any = { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,
+  *      Paul Vixie (ISC), June 1996
+  */
+ static int
+-inet_net_pton_ipv4(const char *src, unsigned char *dst, size_t size)
++ares_inet_net_pton_ipv4(const char *src, unsigned char *dst, size_t size)
+ {
+   static const char xdigits[] = "0123456789abcdef";
+   static const char digits[] = "0123456789";
+@@ -261,19 +259,14 @@ getv4(const char *src, unsigned char *dst, int *bitsp)
+ }
+ 
+ static int
+-inet_net_pton_ipv6(const char *src, unsigned char *dst, size_t size)
++ares_inet_pton6(const char *src, unsigned char *dst)
+ {
+   static const char xdigits_l[] = "0123456789abcdef",
+-    xdigits_u[] = "0123456789ABCDEF";
++        xdigits_u[] = "0123456789ABCDEF";
+   unsigned char tmp[NS_IN6ADDRSZ], *tp, *endp, *colonp;
+   const char *xdigits, *curtok;
+-  int ch, saw_xdigit;
++  int ch, saw_xdigit, count_xdigit;
+   unsigned int val;
+-  int digits;
+-  int bits;
+-  size_t bytes;
+-  int words;
+-  int ipv4;
+ 
+   memset((tp = tmp), '\0', NS_IN6ADDRSZ);
+   endp = tp + NS_IN6ADDRSZ;
+@@ -283,22 +276,22 @@ inet_net_pton_ipv6(const char *src, unsigned char *dst, size_t size)
+     if (*++src != ':')
+       goto enoent;
+   curtok = src;
+-  saw_xdigit = 0;
++  saw_xdigit = count_xdigit = 0;
+   val = 0;
+-  digits = 0;
+-  bits = -1;
+-  ipv4 = 0;
+   while ((ch = *src++) != '\0') {
+     const char *pch;
+ 
+     if ((pch = strchr((xdigits = xdigits_l), ch)) == NULL)
+       pch = strchr((xdigits = xdigits_u), ch);
+     if (pch != NULL) {
++      if (count_xdigit >= 4)
++        goto enoent;
+       val <<= 4;
+-      val |= aresx_sztoui(pch - xdigits);
+-      if (++digits > 4)
++      val |= (pch - xdigits);
++      if (val > 0xffff)
+         goto enoent;
+       saw_xdigit = 1;
++      count_xdigit++;
+       continue;
+     }
+     if (ch == ':') {
+@@ -308,78 +301,107 @@ inet_net_pton_ipv6(const char *src, unsigned char *dst, size_t size)
+           goto enoent;
+         colonp = tp;
+         continue;
+-      } else if (*src == '\0')
++      } else if (*src == '\0') {
+         goto enoent;
++      }
+       if (tp + NS_INT16SZ > endp)
+-        return (0);
+-      *tp++ = (unsigned char)((val >> 8) & 0xff);
+-      *tp++ = (unsigned char)(val & 0xff);
++        goto enoent;
++      *tp++ = (unsigned char) (val >> 8) & 0xff;
++      *tp++ = (unsigned char) val & 0xff;
+       saw_xdigit = 0;
+-      digits = 0;
++      count_xdigit = 0;
+       val = 0;
+       continue;
+     }
+     if (ch == '.' && ((tp + NS_INADDRSZ) <= endp) &&
+-        getv4(curtok, tp, &bits) > 0) {
+-      tp += NS_INADDRSZ;
++        ares_inet_net_pton_ipv4(curtok, tp, INADDRSZ) > 0) {
++      tp += INADDRSZ;
+       saw_xdigit = 0;
+-      ipv4 = 1;
++      count_xdigit = 0;
+       break;  /* '\0' was seen by inet_pton4(). */
+     }
+-    if (ch == '/' && getbits(src, &bits) > 0)
+-      break;
+     goto enoent;
+   }
+   if (saw_xdigit) {
+     if (tp + NS_INT16SZ > endp)
+       goto enoent;
+-    *tp++ = (unsigned char)((val >> 8) & 0xff);
+-    *tp++ = (unsigned char)(val & 0xff);
++    *tp++ = (unsigned char) (val >> 8) & 0xff;
++    *tp++ = (unsigned char) val & 0xff;
+   }
+-  if (bits == -1)
+-    bits = 128;
+-
+-  words = (bits + 15) / 16;
+-  if (words < 2)
+-    words = 2;
+-  if (ipv4)
+-    words = 8;
+-  endp =  tmp + 2 * words;
+-
+   if (colonp != NULL) {
+     /*
+      * Since some memmove()'s erroneously fail to handle
+      * overlapping regions, we'll do the shift by hand.
+      */
+-    const ares_ssize_t n = tp - colonp;
+-    ares_ssize_t i;
++    const int n = tp - colonp;
++    int i;
+ 
+     if (tp == endp)
+       goto enoent;
+     for (i = 1; i <= n; i++) {
+-      *(endp - i) = *(colonp + n - i);
+-      *(colonp + n - i) = 0;
++      endp[- i] = colonp[n - i];
++      colonp[n - i] = 0;
+     }
+     tp = endp;
+   }
+   if (tp != endp)
+     goto enoent;
+ 
+-  bytes = (bits + 7) / 8;
+-  if (bytes > size)
+-    goto emsgsize;
+-  memcpy(dst, tmp, bytes);
+-  return (bits);
++  memcpy(dst, tmp, NS_IN6ADDRSZ);
++  return (1);
+ 
+-  enoent:
++enoent:
+   SET_ERRNO(ENOENT);
+   return (-1);
+ 
+-  emsgsize:
++emsgsize:
+   SET_ERRNO(EMSGSIZE);
+   return (-1);
+ }
+ 
++static int
++ares_inet_net_pton_ipv6(const char *src, unsigned char *dst, size_t size)
++{
++  struct ares_in6_addr in6;
++  int                  ret;
++  int                  bits;
++  size_t               bytes;
++  char                 buf[INET6_ADDRSTRLEN + sizeof("/128")];
++  char                *sep;
++  const char          *errstr;
++
++  if (strlen(src) >= sizeof buf) {
++    SET_ERRNO(EMSGSIZE);
++    return (-1);
++  }
++  strncpy(buf, src, sizeof buf);
++
++  sep = strchr(buf, '/');
++  if (sep != NULL)
++    *sep++ = '\0';
++
++  ret = ares_inet_pton6(buf, (unsigned char *)&in6);
++  if (ret != 1)
++    return (-1);
++
++  if (sep == NULL)
++    bits = 128;
++  else {
++    if (!getbits(sep, &bits)) {
++      SET_ERRNO(ENOENT);
++      return (-1);
++    }
++  }
++
++  bytes = (bits + 7) / 8;
++  if (bytes > size) {
++    SET_ERRNO(EMSGSIZE);
++    return (-1);
++  }
++  memcpy(dst, &in6, bytes);
++  return (bits);
++}
++
+ /*
+  * int
+  * inet_net_pton(af, src, dst, size)
+@@ -403,18 +425,15 @@ ares_inet_net_pton(int af, const char *src, void *dst, size_t size)
+ {
+   switch (af) {
+   case AF_INET:
+-    return (inet_net_pton_ipv4(src, dst, size));
++    return (ares_inet_net_pton_ipv4(src, dst, size));
+   case AF_INET6:
+-    return (inet_net_pton_ipv6(src, dst, size));
++    return (ares_inet_net_pton_ipv6(src, dst, size));
+   default:
+     SET_ERRNO(EAFNOSUPPORT);
+     return (-1);
+   }
+ }
+ 
+-#endif /* HAVE_INET_NET_PTON */
+-
+-#ifndef HAVE_INET_PTON
+ int ares_inet_pton(int af, const char *src, void *dst)
+ {
+   int result;
+@@ -434,11 +453,3 @@ int ares_inet_pton(int af, const char *src, void *dst)
+     return 0;
+   return (result > -1 ? 1 : -1);
+ }
+-#else /* HAVE_INET_PTON */
+-int ares_inet_pton(int af, const char *src, void *dst)
+-{
+-  /* just relay this to the underlying function */
+-  return inet_pton(af, src, dst);
+-}
+-
+-#endif
+diff --git a/test/ares-test-internal.cc b/test/ares-test-internal.cc
+index 96d4ede..161f0a5 100644
+--- a/test/ares-test-internal.cc
++++ b/test/ares-test-internal.cc
+@@ -81,6 +81,7 @@ TEST_F(LibraryTest, InetPtoN) {
+   EXPECT_EQ(0, ares_inet_net_pton(AF_INET6, "12:34::ff/0", &a6, sizeof(a6)));
+   EXPECT_EQ(16 * 8, ares_inet_net_pton(AF_INET6, "12:34::ffff:0.2", &a6, sizeof(a6)));
+   EXPECT_EQ(16 * 8, ares_inet_net_pton(AF_INET6, "1234:1234:1234:1234:1234:1234:1234:1234", &a6, sizeof(a6)));
++  EXPECT_EQ(2, ares_inet_net_pton(AF_INET6, "0::00:00:00/2", &a6, sizeof(a6)));
+ 
+   // Various malformed versions
+   EXPECT_EQ(-1, ares_inet_net_pton(AF_INET, "", &a4, sizeof(a4)));
+@@ -118,11 +119,9 @@ TEST_F(LibraryTest, InetPtoN) {
+   EXPECT_EQ(-1, ares_inet_net_pton(AF_INET6, ":1234:1234:1234:1234:1234:1234:1234:1234", &a6, sizeof(a6)));
+   EXPECT_EQ(-1, ares_inet_net_pton(AF_INET6, ":1234:1234:1234:1234:1234:1234:1234:1234:", &a6, sizeof(a6)));
+   EXPECT_EQ(-1, ares_inet_net_pton(AF_INET6, "1234:1234:1234:1234:1234:1234:1234:1234:5678", &a6, sizeof(a6)));
+-  // TODO(drysdale): check whether the next two tests should give -1.
+-  EXPECT_EQ(0, ares_inet_net_pton(AF_INET6, "1234:1234:1234:1234:1234:1234:1234:1234:5678:5678", &a6, sizeof(a6)));
+-  EXPECT_EQ(0, ares_inet_net_pton(AF_INET6, "1234:1234:1234:1234:1234:1234:1234:1234:5678:5678:5678", &a6, sizeof(a6)));
++  EXPECT_EQ(-1, ares_inet_net_pton(AF_INET6, "1234:1234:1234:1234:1234:1234:1234:1234:5678:5678", &a6, sizeof(a6)));
++  EXPECT_EQ(-1, ares_inet_net_pton(AF_INET6, "1234:1234:1234:1234:1234:1234:1234:1234:5678:5678:5678", &a6, sizeof(a6)));
+   EXPECT_EQ(-1, ares_inet_net_pton(AF_INET6, "12:34::ffff:257.2.3.4", &a6, sizeof(a6)));
+-  EXPECT_EQ(-1, ares_inet_net_pton(AF_INET6, "12:34::ffff:002.2.3.4", &a6, sizeof(a6)));
+   EXPECT_EQ(-1, ares_inet_net_pton(AF_INET6, "12:34::ffff:1.2.3.4.5.6", &a6, sizeof(a6)));
+   EXPECT_EQ(-1, ares_inet_net_pton(AF_INET6, "12:34::ffff:1.2.3.4.5", &a6, sizeof(a6)));
+   EXPECT_EQ(-1, ares_inet_net_pton(AF_INET6, "12:34::ffff:1.2.3.z", &a6, sizeof(a6)));
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
new file mode 100644
index 0000000000..f6bcaee534
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
@@ -0,0 +1,85 @@
+From b9b8413cfdb70a3f99e1573333b23052d57ec1ae Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Mon, 22 May 2023 06:51:49 -0400
+Subject: [PATCH] Merge pull request from GHSA-9g78-jv2r-p7vc
+
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e1573333b23052d57ec1ae.patch]
+CVE: CVE-2023-32067
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/lib/ares_process.c | 41 +++++++++++++++++++++++++----------------
+ 1 file changed, 25 insertions(+), 16 deletions(-)
+
+diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
+index 87329e3..605e5f8 100644
+--- a/src/lib/ares_process.c
++++ b/src/lib/ares_process.c
+@@ -457,7 +457,7 @@ static void read_udp_packets(ares_channel channel, fd_set *read_fds,
+ {
+   struct server_state *server;
+   int i;
+-  ares_ssize_t count;
++  ares_ssize_t read_len;
+   unsigned char buf[MAXENDSSZ + 1];
+ #ifdef HAVE_RECVFROM
+   ares_socklen_t fromlen;
+@@ -500,32 +500,41 @@ static void read_udp_packets(ares_channel channel, fd_set *read_fds,
+       /* To reduce event loop overhead, read and process as many
+        * packets as we can. */
+       do {
+-        if (server->udp_socket == ARES_SOCKET_BAD)
+-          count = 0;
+-
+-        else {
+-          if (server->addr.family == AF_INET)
++        if (server->udp_socket == ARES_SOCKET_BAD) {
++          read_len = -1;
++        } else {
++          if (server->addr.family == AF_INET) {
+             fromlen = sizeof(from.sa4);
+-          else
++          } else {
+             fromlen = sizeof(from.sa6);
+-          count = socket_recvfrom(channel, server->udp_socket, (void *)buf,
+-                                  sizeof(buf), 0, &from.sa, &fromlen);
++          }
++          read_len = socket_recvfrom(channel, server->udp_socket, (void *)buf,
++                                     sizeof(buf), 0, &from.sa, &fromlen);
+         }
+ 
+-        if (count == -1 && try_again(SOCKERRNO))
++        if (read_len == 0) {
++          /* UDP is connectionless, so result code of 0 is a 0-length UDP
++           * packet, and not an indication the connection is closed like on
++           * tcp */
+           continue;
+-        else if (count <= 0)
++        } else if (read_len < 0) {
++          if (try_again(SOCKERRNO))
++            continue;
++
+           handle_error(channel, i, now);
++
+ #ifdef HAVE_RECVFROM
+-        else if (!same_address(&from.sa, &server->addr))
++        } else if (!same_address(&from.sa, &server->addr)) {
+           /* The address the response comes from does not match the address we
+            * sent the request to. Someone may be attempting to perform a cache
+            * poisoning attack. */
+-          break;
++          continue;
+ #endif
+-        else
+-          process_answer(channel, buf, (int)count, i, 0, now);
+-       } while (count > 0);
++
++        } else {
++          process_answer(channel, buf, (int)read_len, i, 0, now);
++        }
++      } while (read_len >= 0);
+     }
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 5614d1310f..beaf886c93 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
            file://CVE-2022-4904.patch \
+           file://CVE-2023-31130.patch \
+           file://CVE-2023-32067.patch \
           "
 SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
 
-- 
2.25.1


