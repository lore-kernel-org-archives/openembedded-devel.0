Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71563C001E0
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.685.1689654371853954200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="103641347"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="103641347"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:11 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 76A60DDC62
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 915ADD5C25
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 154FF200854E2;
	Tue, 18 Jul 2023 13:26:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.2.7 -> 8.2.8
Date: Tue, 18 Jul 2023 12:25:22 +0800
Message-Id: <1689654348-30702-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--7.753100-10.000000
X-TMASE-MatchedRID: ZsQmnj20Xtajz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhMaCZ02+qSX9iz
	xNej0JUTNVvtw8XUaG+vpQIAMDw+aoSV/9xlCg2wYO2LBxTMwiAnhzAhgvoq56EuH17uq9IiKuF
	t6X8/9apbdj2y5mJ/m4t9oqwMPi3wTVAfo9STYMO9UPf7PP8Vb8qspZV+lCSLDOc4AjrDAjP0z7
	bLB716eLpsSljU7Cppo+RxWUSLcK5dOr5VOomwKfBvAgExIEumB4Ntzrj5dXQraVTrt02RmShnj
	l2QKHAnvtoKD5YN6RNz7ytm1EJXF5wnZiwx3fYm/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwUe
	vDt+uW5/XjpbSJS7a0sBtygzCPHvZ+5ImlGNbjfdCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0e
	Ps7A07SQvY0ueKrc1/1tk6QLOJkfeCs35rSjJ3lz5EOhwXCCJJcIYOlxckqQ=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103911

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- CLI:
  . Fixed bug GH-11246 (cli/get_set_process_title fails on MacOS).

- Core:
  . Fixed build for the riscv64 architecture/GCC 12.

- Curl:
  . Fixed bug GH-11433 (Unable to set CURLOPT_ACCEPT_ENCODING to NULL).

- Date:
  . Fixed bug GH-11455 (Segmentation fault with custom object date properties).

- DOM:
  . Fixed bugs GH-11288 and GH-11289 and GH-11290 and GH-9142 (DOMExceptions
    and segfaults with replaceWith).
  . Fixed bug GH-10234 (Setting DOMAttr::textContent results in an empty
    attribute value).
  . Fix return value in stub file for DOMNodeList::item.
  . Fix spec compliance error with '*' namespace for
    DOMDocument::getElementsByTagNameNS.
  . Fix DOMElement::append() and DOMElement::prepend() hierarchy checks.
  . Fixed bug GH-11347 (Memory leak when calling a static method inside an
    xpath query).
  . Fixed bug #67440 (append_node of a DOMDocumentFragment does not reconcile
    namespaces).
  . Fixed bug #81642 (DOMChildNode::replaceWith() bug when replacing a node
    with itself).
  . Fixed bug #77686 (Removed elements are still returned by getElementById).
  . Fixed bug #70359 (print_r() on DOMAttr causes Segfault in
    php_libxml_node_free_list()).
  . Fixed bug #78577 (Crash in DOMNameSpace debug info handlers).
  . Fix lifetime issue with getAttributeNodeNS().
  . Fix "invalid state error" with cloned namespace declarations.
  . Fixed bug #55294 and #47530 and #47847 (various namespace reconciliation
    issues).
  . Fixed bug #80332 (Completely broken array access functionality with
    DOMNamedNodeMap).

- Opcache:
  . Fix allocation loop in zend_shared_alloc_startup().
  . Access violation on smm_shared_globals with ALLOC_FALLBACK.
  . Fixed bug GH-11336 (php still tries to unlock the shared memory ZendSem
    with opcache.file_cache_only=1 but it was never locked).

- OpenSSL:
  . Fixed bug GH-9356 Incomplete validation of IPv6 Address fields in
    subjectAltNames
- PCRE:
  . Fix preg_replace_callback_array() pattern validation.

- PGSQL:
  . Fixed intermittent segfault with pg_trace.

- Phar:
  . Fix cross-compilation check in phar generation for FreeBSD.

- SPL:
  . Fixed bug GH-11338 (SplFileInfo empty getBasename with more than one
    slash).

- Standard:
  . Fix access on NULL pointer in array_merge_recursive().
  . Fix exception handling in array_multisort().

- SQLite3:
  . Fixed bug GH-11451 (Invalid associative array containing duplicate
    keys).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.7.bb => php_8.2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.7.bb => php_8.2.8.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.7.bb b/meta-oe/recipes-devtools/php/php_8.2.8.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.7.bb
rename to meta-oe/recipes-devtools/php/php_8.2.8.bb
index 4dc0399b59..08d041d77a 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.7.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.8.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "5bfb2a35c67921bdcadd5c90cb290ad7537d24da113a5e8bc2d646b02de7488f"
+SRC_URI[sha256sum] = "995ed4009c7917c962d31837a1a3658f36d4af4f357b673c97ffdbe6403f8517"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.34.1


