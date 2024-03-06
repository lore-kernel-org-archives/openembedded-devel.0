Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BACC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:43:47 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.7743.1709714622566345348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YeN5OSI9;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714622; x=1741250622;
  h=from:to:cc:subject:date:message-id;
  bh=oeLOOCT9xqYWIZoFANK+KlFOiO8j3PexZV4XszBLKUw=;
  b=YeN5OSI9SD9tXEM7zBbwLm8unM0tzHdiSXdqaTMdYmsB59Yb/mP7Xsqm
   mgP3vJXdQa0UuI73+XLk5UWmCWoriQQGmCd/a/iPhay5D42f4R8ZiwLfE
   Qzy9AbfWUP+RVRRPY2uNkII1QlMdFHQVIZGB64d1wiG10wPdBAMv+fgMk
   O/2EnEpBkCqtTgGczV7dzk+p7m7+OQWZEwoVZDhyo+FKIaxnuRK1Mz6QF
   pL3WvTXrKfwOc2qHCJLt02AuP5bt+397iCS9BM5VZl+dCLz7DJ/Lui/47
   gy7lXuOkmoejrEp+pLlfGpfDbxhjIz/McXjQwR2mEKZvDTq6aTidp++7q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="139397588"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="139397588"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:43:39 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 078A3D4805
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D373BF3CA
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BA99F2008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 485B81A006A;
	Wed,  6 Mar 2024 16:43:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/26] abseil-cpp: upgrade 20230802.1 -> 20240116.1
Date: Wed,  6 Mar 2024 16:43:03 +0800
Message-Id: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--2.973800-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrWvaFnGMIvOqKso3EN6f9DNTS
	AFXbQjEd4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYABlNc
	WZ7137CiBkESMI05d4qHvyg1ZsxTfh38bnPLEpPESEYfcJF0pRVn4Ir4HFD2T8XfjqINUwdMjL8
	WDWZGeou0B0MT8S0EkgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyWaiGsgmesJsZc+7sokKGze1CP
	DFniwiB3jOi8EjvLIwl0HSUlHrtFZhgo5pDoVAlwLl6nBSikcadUvSbs6bg8PpA/ISW79QR/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109141

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Added absl::NoDestructor<T> to simplify defining static types that do not need
 to be destructed upon program exit.
-Added configurable verbose logging (also known as VLOG).
-Added absl::Overload(), which returns a functor that provides overloads based
 on the functors passed to it.
-Bzlmod is now officially supported (previously it was supported by the community).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{abseil-cpp_20230802.1.bb => abseil-cpp_20240116.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20230802.1.bb => abseil-cpp_20240116.1.bb} (94%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
similarity index 94%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
index 1ce6ff3fc..9f44d6790 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
@@ -7,8 +7,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-SRCREV = "fb3621f4f897824c0dbe0615fa94543df6192f30"
-BRANCH = "lts_2023_08_02"
+SRCREV = "2f9e432cce407ce0ae50676696666f33a77d42ac"
+BRANCH = "lts_2024_01_16"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
-- 
2.34.1


