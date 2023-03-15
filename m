Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0D7C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:05:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.8884.1678889104014474132
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l5TcfDCK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889102; i=@fujitsu.com;
	bh=sLmbCKHT1pSYq6WcSFWh5XqlejBdTLL0zJeieClg8lE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=l5TcfDCKSCFWwGZ0iXSmTMXu7aAEf/M/pYvCXboDlfhMM9TT8r8DJTQUs/ICUlyT+
	 dflGm1FUzUPASmJf/Pulw8z5VYjZNVC0D3ueNOZcHTLIUc/NnZh5gPDpx8U0Ovqhck
	 wXpxHnmbwEjPypLAI2zzuUDd1T8hsXV8C8s5+5rPz8eS+Cip+4owPDHQkSOMw9aGyo
	 d/rTlh7qezmxaHMflRp5R5nr3JT31234u78tRLWsw4p0zn7DEl6vaLzFJgFBZjbZVN
	 3fObmlf3FC3rYXBAdOO9JHkeb/t427LU4ZntOsRLGX06xsUK1i2wwXTDZJgPLfFLcX
	 cHJzjXS46QAgQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWbf3gmC
  KwbffchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b0iRuYCm5pVpx+/Z+9gbFFpYuRi0NI4AGj
  xJUVUxghnMtMEl03DrN3MXICOXsYJR4ulgOx2QSkJG7c/88GYosI6Essnb2HGcRmFlCRePG7B
  6xeWMBO4vf3y2A2i4CqxP01s8BsXgEniQMLvjOC2BICChJTHr4H6+UUcJb4/LYXKM4BtMtJ4u
  NGa4hyQYmTM5+wQIyXkDj44gUzRKuixOzLzSwQdoVE4/RDTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM5sWpRWWpRbqGhnpJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIHBm1KcdnwH48u+v3qHGCU5mJREef+sEUgR4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MH774xgipBgUWp6akVaZg4wkmDSEhw8SiK8qeeB0rzFBYm5xZnpEKlTjLocm/Z1HWAWYsnLz0
  uVEudtASkSACnKKM2DGwGL6kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmXgVzCk5lXArf
  pFdARTEBH8M4TADmiJBEhJdXANIdNIfAet0N5oFjEGTX5Wzm91YVclZvf7Jzy7LjsxoXp09Y0
  RwoyzBdIe3/UfXdZX2vdSjNrtx/vp0bOEZX7f1F+pcqrKwE8C9f7+pkwy7R6bHTxfPLnT/lza
  dfsAuninAcTk54Kr7rQIDG/mb3gWNXaUl2JXKO/71+ozs1sSj54ziPfSy1zOXOXxJaqX0a+7J
  Olg1l12TcEXau0sIvI0XqafOzsuqRXHE92JR6f5ePQsOtwZ2IlW+mLZpvCH0dmfYtbOGGh769
  wrz/bwmICF8jb+tWJrko5EXdl/5k3wvvCl7zS5xcT/Psynv2In8PL+HbvYzmHG/7O4TA+dbJn
  x5KylrcaGed2vJvY0CChxFKckWioxVxUnAgAG/QrzmUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-728.messagelabs.com!1678889101!50664!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1386 invoked from network); 15 Mar 2023 14:05:01 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:05:01 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D4F1D73
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:00 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C62597C
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:04:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] snappy upgrade 1.1.9 -> 1.1.10
Date: Wed, 15 Mar 2023 22:04:39 +0800
Message-ID: <1678889082-20604-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889082-20604-1-git-send-email-wangmy@fujitsu.com>
References: <1678889082-20604-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101539

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
removed since it's not available in 1.1.10.

Changelog:
==========
* Performance improvements
* Compilation fixes for various environments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 -------------------
 .../{snappy_1.1.9.bb => snappy_1.1.10.bb}     |  6 +-
 2 files changed, 2 insertions(+), 75 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
 rename meta-oe/recipes-extended/snappy/{snappy_1.1.9.bb => snappy_1.1.10.bb} (84%)

diff --git a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
deleted file mode 100644
index 27357d88a..000000000
--- a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 4728803cc8687431449c8c9fbfabb1da04943400 Mon Sep 17 00:00:00 2001
-From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
-Date: Wed, 5 May 2021 14:16:46 +0300
-Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
-
-Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag to
-fix the following compilation errors and a warning with GCC:
-
-[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
-/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
--I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
--march=i586 -mtune=i686 -Wall -Wextra -fno-exceptions -fno-rtti -O3
--DNDEBUG -fPIC   -std=c++11 -o CMakeFiles/snappy.dir/snappy.cc.o -c
-/tmp/snappy-1.1.9/snappy.cc
-/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
-function might not be inlinable [-Wattributes]
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
-unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, const
-uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T = char*; uint8_t = unsigned
-char; ptrdiff_t = int]':
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-CMakeFiles/snappy.dir/build.make:137: recipe for target
-'CMakeFiles/snappy.dir/snappy.cc.o' failed
-
-Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
-macro (i.e. __attribute__((always_inline)) ) it is necessary to use C++
-inline specifier.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Submitted [https://github.com/google/snappy/pull/128]
----
- snappy.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/snappy.cc b/snappy.cc
-index 79dc0e8..51157be 100644
---- a/snappy.cc
-+++ b/snappy.cc
-@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, size_t size) {
- }
- 
- SNAPPY_ATTRIBUTE_ALWAYS_INLINE
--size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-+inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-   const uint8_t*& ip = *ip_p;
-   // This section is crucial for the throughput of the decompression loop.
-   // The latency of an iteration is fundamentally constrained by the
diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
similarity index 84%
rename from meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
rename to meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
index 0d58345d7..08e4357d8 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
@@ -10,10 +10,8 @@ compression ratio."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main \
-    file://0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch \
-"
-SRCREV = "2b63814b15a2aaae54b7943f0cd935892fae628f"
+SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main"
+SRCREV = "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
 S = "${WORKDIR}/git"
 
 
-- 
2.34.1


