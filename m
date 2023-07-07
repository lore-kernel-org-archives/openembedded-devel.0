Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FFAC001DC
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:16 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.4899.1688699647226579111
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="111930500"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="111930500"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:04 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DDD75CD7E0
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:02 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A25FD99FE
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id D60CA881D9;
	Fri,  7 Jul 2023 12:14:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwloc: upgrade 2.9.1 -> 2.9.2
Date: Fri,  7 Jul 2023 11:13:31 +0800
Message-Id: <1688699627-2519-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-3.868800-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9ePaLJ/Ca3ST3w6
	H06bMgivqumS+d6/Eoa/Z5PWGiyf4Nc7GbbghevG194/5X9VfCxNLPQl0QAltLwHu+XsbkzRFlo
	O+iJRP8y+ade5FHbjBom/zyB+CCQ2IWERHkBDPUncgUVP3Cp+vaVjgXyvS9c/SMg2Oe/b8ExZ1W
	3y/wqn8yqq0O5S3DJ8liiseSCgWjABOHW58ozCWvx0ykrbAxjCwTlc9CcHMZdH8jOVX4Ixttb2e
	7N2CFQyHH8BkCG8K5B3TaF7+lCZvhHyFkyp0mb5YVvyqiyuzVDDwmFzxniWJwIZ++dWnH7bnptr
	8PnHpyni8zVgXoAltjX6XtdE9yLDC24oEZ6SpSmcfuxsiY4QFGug+jST4SRQLyl729+NXsgb8yp
	229xdLfwQ8DhmWwQHG7GC+VtYtp1EfqUzMgG40+uhR1pgRUFW3vNVkszNfQ3ohTsELAl2hOx9n1
	XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103692

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Don't forget L3i when defining filters for multiple levels of caches
  with hwloc_topology_set_cache/icache_types_filter().
* Fix object total_memory after hwloc_topology_insert_group_object().
* Fix the (non-yet) exporting in synthetic description for complex memory
  hierarchies with memory-side caches, etc.
* Fix some default size attributes when building synthetic topologies.
* Fix size units in hwloc-annotate.
* Improve bitmap reallocation error management in many functions.
* Documentation improvements:
  + Better document return values of functions.
  + Add "Error reporting" section (in hwloc.h and in the doxygen doc).
  + Add FAQ entry "What may I disable to make hwloc faster?"
  + Improve FAQ entries "Why is lstopo slow?" and
    "I only need ..., why should I use hwloc?"
  + Clarify how to deal with cpukinds in hwloc-calc and hwloc-bind
    manpages.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/hwloc/{hwloc_2.9.1.bb => hwloc_2.9.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/hwloc/{hwloc_2.9.1.bb => hwloc_2.9.2.bb} (93%)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_2.9.1.bb b/meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb
similarity index 93%
rename from meta-oe/recipes-extended/hwloc/hwloc_2.9.1.bb
rename to meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb
index 7e8cd5f390..487b7da130 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_2.9.1.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_2.9.2.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79179bb373cd55cbd834463a514fb714"
 
 SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.9/downloads/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "7cc4931a20fef457e0933af3f375be6eafa7703fde21e137bfb9685b1409599e"
+SRC_URI[sha256sum] = "0a87fdf677f8b00b567d229b6320bf6b25c693edaa43e0b85268d999d6b060cf"
 UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v2.9/"
 
 inherit autotools bash-completion pkgconfig
-- 
2.34.1


