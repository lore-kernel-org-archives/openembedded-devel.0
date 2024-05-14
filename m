Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCD0C27C65
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.10789.1715677836183320552
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sIRzDydD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677835; x=1747213835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qVS37HZrKIh55gZGZkYGODBcZr4cA2VORo33aty26Jg=;
  b=sIRzDydDSCPjP6LFGgZ055FwtYCiTaSQL3bKCxFmfUjoW07Xx07vdEpo
   XeTHRKe8EwMTnfjq+mnamjDbUguBMsRceprqtHr7lDN6FZYenSb2tMvWM
   5dxvP/yY9gxiXcTES1lWvmpx8eyqnzsnjFyq7HyDg2KpsVJQ6I8eByODy
   4ERv6zXn7Q5Nlgk/1QLgdybS1YFktglaWd/sYSD+IskxzYFVcKVuy1uCR
   G107ANIj9Dhs5Gu6tqd9ZmQ6pcj4X7sglXltDKuBKVipgIN1kVw3yDs8A
   9BswWnKLKe8ZQe+S95Hg/MvYOVcMNO2WcqdfsTRB97ziK5t5IfAvUpoEt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="158246349"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="158246349"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DFEA32D020
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 11223D9469
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A398220076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 50C4B1A000B;
	Tue, 14 May 2024 17:10:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/44] python3-dbus-fast: upgrade 2.21.1 -> 2.21.2
Date: Tue, 14 May 2024 17:09:51 +0800
Message-Id: <1715677817-2223-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-3.443700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysPHjBIcyvbaptO
	/SSTcWMlKqrQ7lLcMnygKELwwYMNFm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZ2ijT8CXY6ckxc/0GXEas7H88PtSDvmu1K2OjnihahSO+IdIJHnLC6xETVWdcBCqg8VO
	JbMIg46j7bl4a0m5FP/4hKkv7qSMzKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110366

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix introspection bogus child paths

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.21.1.bb => python3-dbus-fast_2.21.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.21.1.bb => python3-dbus-fast_2.21.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.1.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.21.1.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.21.2.bb
index 9e2566175..aa1cf2b0b 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "87b852d2005f1d59399ca51c5f3538f28a4742d739d7abe82b7ae8d01d8a5d02"
+SRC_URI[sha256sum] = "8645187b2e86c5141217adcb462d6dbecd37fb2ab8705f66b3773a66206ef83d"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1


