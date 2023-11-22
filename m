Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C65C61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:59:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.11927.1700624229610241593
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 19:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QXbcjfKe;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: wen.yan.tan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700624229; x=1732160229;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z3LC19QzQzrt93E+Qofusirg5MSyih7BY1IyGsL+J3Q=;
  b=QXbcjfKeQlDbat+HYfxSpotbLXQzQ07JtYiz7AHJbn+aaduIxForFDuY
   5m0RDkY6zfbL9PWh22f13HqPrJuMU03rezxfL5wuFKRYjBYx4Gj7lrMbq
   5ROWj+fetV7MW7OgBq2Bo0MOHA5Vjh7m5wIhS7dIDtJseWdVJArayO8po
   m0VL0SMQ+P9hpNXYmitdzFAmxrCymh8zP0z0av7C3Zw1/A+97rsSh+bKy
   5pRaGQTSaw+ZzjtY3fjDVem+OWpiOrAoDiNgEpmqnbRhJ1AueshGeXsIE
   GzIpDG8ESmuVfPiCiLJKOSn/Xqa3+J+Fjg0MNZbnShvHt7xeMeLCjkndI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="394811236"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="394811236"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 19:37:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1098256474"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="1098256474"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 19:37:07 -0800
From: "Tan Wen Yan" <wen.yan.tan@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [nanbield][meta-oe][PATCH] yajl: fix CVE-2017-16516, CVE-2022-24795, CVE-2023-33460
Date: Wed, 22 Nov 2023 11:16:42 +0800
Message-Id: <20231122031642.2711291-1-wen.yan.tan@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 12:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107010

From: Ross Burton <ross.burton@arm.com>

Take three CVE fixes from Fedora, as the upstream repository is now
dead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tan Wen Yan <wen.yan.tan@intel.com>
---
 .../yajl/yajl/CVE-2017-16516.patch            | 37 ++++++++++++
 .../yajl/yajl/CVE-2022-24795.patch            | 59 +++++++++++++++++++
 .../yajl/yajl/CVE-2023-33460.patch            | 35 +++++++++++
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |  6 +-
 4 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch

diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch b/meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch
new file mode 100644
index 000000000..1241ff9e3
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch
@@ -0,0 +1,37 @@
+From 0b5e73c4321de0ba1d495fdc0967054b2a77931c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Mon, 10 Jul 2023 13:36:10 +0100
+Subject: [PATCH] Fix for CVE-2017-16516
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Description: Fix for CVE-2017-16516
+ Potential buffer overread: A JSON file can cause denial of service.
+Origin: https://github.com/brianmario/yajl-ruby/commit/a8ca8f476655adaa187eedc60bdc770fff3c51ce
+
+CVE: CVE-2017-16516
+Upstream-Status: Submitted [https://github.com/lloyd/yajl/issues/248]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/yajl_encode.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/yajl_encode.c b/src/yajl_encode.c
+index fd08258..0d97cc5 100644
+--- a/src/yajl_encode.c
++++ b/src/yajl_encode.c
+@@ -139,8 +139,8 @@ void yajl_string_decode(yajl_buf buf, const unsigned char * str,
+                     end+=3;
+                     /* check if this is a surrogate */
+                     if ((codepoint & 0xFC00) == 0xD800) {
+-                        end++;
+-                        if (str[end] == '\\' && str[end + 1] == 'u') {
++                        if (end + 2 < len && str[end + 1] == '\\' && str[end + 2] == 'u') {
++                            end++;
+                             unsigned int surrogate = 0;
+                             hexToDigit(&surrogate, str + end + 2);
+                             codepoint =
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch b/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
new file mode 100644
index 000000000..0dc859099
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
@@ -0,0 +1,59 @@
+From 17de4d15687aa30c49660dc4b792b1fb4d38b569 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Thu, 7 Apr 2022 17:29:54 +0200
+Subject: [PATCH] Fix CVE-2022-24795
+
+There was an integer overflow in yajl_buf_ensure_available() leading
+to allocating less memory than requested. Then data were written past
+the allocated heap buffer in yajl_buf_append(), the only caller of
+yajl_buf_ensure_available(). Another result of the overflow was an
+infinite loop without a return from yajl_buf_ensure_available().
+
+yajl-ruby project, which bundles yajl, fixed it
+<https://github.com/brianmario/yajl-ruby/pull/211> by checking for the
+integer overflow, fortifying buffer allocations, and report the
+failures to a caller. But then the caller yajl_buf_append() skips
+a memory write if yajl_buf_ensure_available() failed leading to a data
+corruption.
+
+A yajl fork mainter recommended calling memory allocation callbacks with
+the large memory request and let them to handle it. But that has the
+problem that it's not possible pass the overely large size to the
+callbacks.
+
+This patch catches the integer overflow and terminates the process
+with abort().
+
+CVE: CVE-2022-24795
+Upstream-Status: Submitted [https://github.com/lloyd/yajl/issues/239]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/yajl_buf.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/yajl_buf.c b/src/yajl_buf.c
+index 1aeafde..55c11ad 100644
+--- a/src/yajl_buf.c
++++ b/src/yajl_buf.c
+@@ -45,7 +45,17 @@ void yajl_buf_ensure_available(yajl_buf buf, size_t want)
+ 
+     need = buf->len;
+ 
+-    while (want >= (need - buf->used)) need <<= 1;
++    if (((buf->used > want) ? buf->used : want) > (size_t)(buf->used + want)) {
++        /* We cannot allocate more memory than SIZE_MAX. */
++        abort();
++    }
++    while (want >= (need - buf->used)) {
++        if (need >= (size_t)((size_t)(-1)<<1)>>1) {
++            /* need would overflow. */
++            abort();
++        }
++        need <<= 1;
++    }
+ 
+     if (need != buf->len) {
+         buf->data = (unsigned char *) YA_REALLOC(buf->alloc, buf->data, need);
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
new file mode 100644
index 000000000..47454dc8a
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
@@ -0,0 +1,35 @@
+Fix memory leaks.  Taken from the Fedora packaging (https://src.fedoraproject.org/rpms/yajl)
+where it was backported from openEuler.
+
+CVE: CVE-2023-33460
+Upstream-Status: Submitted [https://github.com/lloyd/yajl/issues/250]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/src/yajl_tree.c b/src/yajl_tree.c
+index 3d357a3..56c7012 100644
+--- a/src/yajl_tree.c
++++ b/src/yajl_tree.c
+@@ -143,7 +143,7 @@ static yajl_val context_pop(context_t *ctx)
+     ctx->stack = stack->next;
+ 
+     v = stack->value;
+-
++    free (stack->key);
+     free (stack);
+ 
+     return (v);
+@@ -444,7 +444,14 @@ yajl_val yajl_tree_parse (const char *input,
+              snprintf(error_buffer, error_buffer_size, "%s", internal_err_str);
+              YA_FREE(&(handle->alloc), internal_err_str);
+         }
++        while(ctx.stack != NULL) {
++             yajl_val v = context_pop(&ctx);
++             yajl_tree_free(v);
++        }
+         yajl_free (handle);
++	//If the requested memory is not released in time, it will cause memory leakage
++	if(ctx.root)
++	     yajl_tree_free(ctx.root);
+         return NULL;
+     }
+ 
diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
index cf8dbb183..2a34210f3 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -8,7 +8,11 @@ HOMEPAGE = "http://lloyd.github.com/yajl/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=39af6eb42999852bdd3ea00ad120a36d"
 
-SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https"
+SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https \
+           file://CVE-2017-16516.patch \
+           file://CVE-2022-24795.patch \
+           file://CVE-2023-33460.patch \
+           "
 SRCREV = "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
 
 S = "${WORKDIR}/git"
-- 
2.37.3


