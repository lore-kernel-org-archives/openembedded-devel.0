Return-Path: <radovan.scasny@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8676C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 16:17:50 +0000 (UTC)
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web08.11046.1637338669120771458
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 08:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: radovan.scasny@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 1AJGHjVT028709
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 17:17:46 +0100
Received: from dev.vm7.ccp.siemens.com ([144.145.220.58])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 1AJGHj7A026646;
	Fri, 19 Nov 2021 17:17:45 +0100
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 1BB5A506D5F;
	Fri, 19 Nov 2021 17:17:45 +0100 (CET)
From: Radovan Scasny <radovan.scasny@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Radovan Scasny <radovan.scasny@siemens.com>
Subject: [meta-oe][dunfell][PATCH v2] c-ares: Fix multiple security
 vulnerabilities
Date: Fri, 19 Nov 2021 17:16:40 +0100
Message-Id: <20211119161640.822-1-radovan.scasny@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 16:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94065

Below are patches for security vulnerabilites

1. 0002-avoid-read-heap-buffer-overflow-332.patch
   https://github.com/c-ares/c-ares/issues/333

2. 0003-Avoid-buffer-overflow-in-RC4-loop-comparison-336.patch
   https://github.com/c-ares/c-ares/pull/336

3. 0004-ares_parse_-a-aaaa-_reply-could-return-larger-naddrt.patch
   CVE-2020-8277

Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
---
 ...-avoid-read-heap-buffer-overflow-332.patch | 34 +++++++++++
 ...-overflow-in-RC4-loop-comparison-336.patch | 42 ++++++++++++++
 ...aa-_reply-could-return-larger-naddrt.patch | 58 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.16.1.bb   |  3 +
 4 files changed, 137 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0002-avoid-read-heap-buffer-overflow-332.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0003-Avoid-buffer-overflow-in-RC4-loop-comparison-336.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0004-ares_parse_-a-aaaa-_reply-could-return-larger-naddrt.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0002-avoid-read-heap-buffer-overflow-332.patch b/meta-oe/recipes-support/c-ares/c-ares/0002-avoid-read-heap-buffer-overflow-332.patch
new file mode 100644
index 0000000000..cafb801cbd
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0002-avoid-read-heap-buffer-overflow-332.patch
@@ -0,0 +1,34 @@
+From 1b98172b141fe874ad43e679e67506f9b2139043 Mon Sep 17 00:00:00 2001
+From: lutianxiong <50396812+ltx2018@users.noreply.github.com>
+Date: Fri, 22 May 2020 20:02:21 +0800
+Subject: [PATCH] avoid read-heap-buffer-overflow (#332)
+
+Fix invalid read in ares_parse_soa_reply.c found during fuzzing
+
+Fixes Bug: #333
+Fix By: lutianxiong (@ltx2018)
+
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/1b98172b141fe874ad43e679e67506f9b2139043] 
+Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
+
+---
+ ares_parse_soa_reply.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/ares_parse_soa_reply.c b/ares_parse_soa_reply.c
+index 2a2cac8..7cfaed2 100644
+--- a/ares_parse_soa_reply.c
++++ b/ares_parse_soa_reply.c
+@@ -69,6 +69,9 @@ ares_parse_soa_reply(const unsigned char *abuf, int alen,
+   status = ares__expand_name_for_response(aptr, abuf, alen, &qname, &len);
+   if (status != ARES_SUCCESS)
+     goto failed_stat;
++
++  if (alen <= len + HFIXEDSZ + 1)
++    goto failed;
+   aptr += len;
+ 
+   qclass = DNS_QUESTION_TYPE(aptr);
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/c-ares/c-ares/0003-Avoid-buffer-overflow-in-RC4-loop-comparison-336.patch b/meta-oe/recipes-support/c-ares/c-ares/0003-Avoid-buffer-overflow-in-RC4-loop-comparison-336.patch
new file mode 100644
index 0000000000..3b602a655f
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0003-Avoid-buffer-overflow-in-RC4-loop-comparison-336.patch
@@ -0,0 +1,42 @@
+From 6d6cd5daf63b812734343bd020677829b13db2ac Mon Sep 17 00:00:00 2001
+From: Fionn Fitzmaurice <1897918+fionn@users.noreply.github.com>
+Date: Fri, 3 Jul 2020 07:39:54 +0800
+Subject: [PATCH] Avoid buffer overflow in RC4 loop comparison (#336)
+
+The rc4 function iterates over a buffer of size buffer_len who's maximum
+value is INT_MAX with a counter of type short that is not guaranteed to
+have maximum size INT_MAX.
+
+In circumstances where short is narrower than int and where buffer_len
+is larger than the maximum value of a short, it may be possible to loop
+infinitely as counter will overflow and never be greater than or equal
+to buffer_len.
+
+The solution is to make the comparison be between types of equal width.
+This commit defines counter as an int.
+
+Fix By: Fionn Fitzmaurice (@fionn)
+
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/6d6cd5daf63b812734343bd020677829b13db2ac]
+Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
+
+---
+ ares_query.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ares_query.c b/ares_query.c
+index b38b8a6..5bbb2f5 100644
+--- a/ares_query.c
++++ b/ares_query.c
+@@ -45,7 +45,7 @@ static void rc4(rc4_key* key, unsigned char *buffer_ptr, int buffer_len)
+   unsigned char y;
+   unsigned char* state;
+   unsigned char xorIndex;
+-  short counter;
++  int counter;
+ 
+   x = key->x;
+   y = key->y;
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/c-ares/c-ares/0004-ares_parse_-a-aaaa-_reply-could-return-larger-naddrt.patch b/meta-oe/recipes-support/c-ares/c-ares/0004-ares_parse_-a-aaaa-_reply-could-return-larger-naddrt.patch
new file mode 100644
index 0000000000..25530982df
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0004-ares_parse_-a-aaaa-_reply-could-return-larger-naddrt.patch
@@ -0,0 +1,58 @@
+From 0d252eb3b2147179296a3bdb4ef97883c97c54d3 Mon Sep 17 00:00:00 2001
+From: bradh352 <brad@brad-house.com>
+Date: Thu, 12 Nov 2020 10:24:40 -0500
+Subject: [PATCH] ares_parse_{a,aaaa}_reply could return larger *naddrttls than
+ passed in
+
+If there are more ttls returned than the maximum provided by the requestor, then
+the *naddrttls response would be larger than the actual number of elements in
+the addrttls array.
+
+This bug could lead to invalid memory accesses in applications using c-ares.
+
+This behavior appeared to break with PR #257
+
+Fixes: #371
+Reported By: Momtchil Momtchev (@mmomtchev)
+Fix By: Brad House (@bradh352)
+
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/0d252eb3b2147179296a3bdb4ef97883c97c54d3]
+CVE: CVE-2020-8277
+Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
+
+---
+ ares_parse_a_reply.c    | 3 ++-
+ ares_parse_aaaa_reply.c | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/ares_parse_a_reply.c b/ares_parse_a_reply.c
+index d8a9e9b..e71c993 100644
+--- a/ares_parse_a_reply.c
++++ b/ares_parse_a_reply.c
+@@ -197,7 +197,8 @@ int ares_parse_a_reply(const unsigned char *abuf, int alen,
+ 
+   if (naddrttls)
+     {
+-      *naddrttls = naddrs;
++      /* Truncated to at most *naddrttls entries */
++      *naddrttls = (naddrs > *naddrttls)?*naddrttls:naddrs;
+     }
+ 
+   ares__freeaddrinfo_cnames(ai.cnames);
+diff --git a/ares_parse_aaaa_reply.c b/ares_parse_aaaa_reply.c
+index 0d39bfa..346d430 100644
+--- a/ares_parse_aaaa_reply.c
++++ b/ares_parse_aaaa_reply.c
+@@ -200,7 +200,8 @@ int ares_parse_aaaa_reply(const unsigned char *abuf, int alen,
+ 
+   if (naddrttls)
+     {
+-      *naddrttls = naddrs;
++      /* Truncated to at most *naddrttls entries */
++      *naddrttls = (naddrs > *naddrttls)?*naddrttls:naddrs;
+     }
+ 
+   ares__freeaddrinfo_cnames(ai.cnames);
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
index 36bb9be172..8379d5b102 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -13,6 +13,9 @@ SRC_URI = "\
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
     file://ares_expand_name-should-escape-more-characters.patch \
     file://ares_expand_name-fix-formatting-and-handling-of-root.patch \
+    file://0002-avoid-read-heap-buffer-overflow-332.patch \
+    file://0003-Avoid-buffer-overflow-in-RC4-loop-comparison-336.patch \
+    file://0004-ares_parse_-a-aaaa-_reply-could-return-larger-naddrt.patch \
 "
 SRCREV = "74a1426ba60e2cd7977e53a22ef839c87415066e"
 
-- 
2.20.1


