Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79467C71141
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.78441.1749526436040581345
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TN7ULR6m;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526436; x=1781062436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jrDzpiLJeExssxUzNAwg1HYZ8OvAli6yxErk1JAipvI=;
  b=TN7ULR6mLE3dcW7cgexbdsR1H+y/A8zXUgwmG5SOd0dp2/pKdzivvyYl
   gXGT+0oXsWpF3hpR9DNSNt50p8C2fkwpGskVOhC2Ya5vKhnMfDpijo9v7
   jb4GQ83mLGEakPjcf8WS1Jr9TDLqc7qiIf8EnAXE2RJL41+dSl6pCcoZi
   da6Ivyu/6apGQ1aBnEnnjz2IjvksqTsfgnNA74pv7TxykISaotpVoqDvB
   85Ji3s9fp7mwYQfHHadd9fljUA4CUWi32VF9jku3EKML2IPucu1sUiMzN
   JLFOlBWvMnixY4VoHnU80G4hTNJU7F37Z8/trG+b5CK3lm+IJrPusf3rD
   w==;
X-CSE-ConnectionGUID: wSl/jKjlRa2uT8W65txJ6g==
X-CSE-MsgGUID: 3GehQxTWTdeOZCC/qGsncQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202261513"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202261513"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 70A47C68FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 21821D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:51 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A0B621A0071;
	Tue, 10 Jun 2025 11:33:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/64] python3-networkx: upgrade 3.4.2 -> 3.5
Date: Tue, 10 Jun 2025 11:33:12 +0800
Message-ID: <20250610033330.924-46-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117840

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2025

Changelog:
==========
https://github.com/networkx/networkx/releases/tag/networkx-3.5
---
 .../{python3-networkx_3.4.2.bb => python3-networkx_3.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_3.4.2.bb => python3-networkx_3.5.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_3.4.2.bb b/meta-python/recipes-devtools/python/python3-networkx_3.5.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-networkx_3.4.2.bb
rename to meta-python/recipes-devtools/python/python3-networkx_3.5.bb
index 33caf7529d..a386313ddd 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_3.5.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python package for creating and manipulating graphs and networks"
 HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=810f34d8853910e36388f63c0e87f0ed"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7592b173aee2da0e062f9cfa0378e9d"
 
-SRC_URI[sha256sum] = "307c3669428c5362aab27c8a1260aa8f47c4e91d3891f48be0141738d8d053e1"
+SRC_URI[sha256sum] = "d4c6f9cf81f52d69230866796b82afbccdec3db7ae4fbd1b65ea750feed50037"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


