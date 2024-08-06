Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D095BC53212
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.2883.1722934017677000776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CRXrN4Lh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934026; x=1754470026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/rTvaouBS6fNYudWtM6GrVJ9RHPPOwA4fJakuzsnQAY=;
  b=CRXrN4LhBbEUkhMGoIAjpOmeLVQtrtCn6mT+yMMPXy/9XbE9oyTz1mrG
   8iVsiM1UEF8oXPXKa9QJ5IP0Gc90TX5enAu0m0R2TxVMB1jU0J/oZUHs9
   bQXEx2+7Qid/1IM/gYA+AmIV/mV+nARzb1n72d7FV61FoNVogcAzwc2ys
   y21uc0wZkDLs2DWmIBSMIIV3tFQOunGWRuU2L5dAXI4Qc7sCOFxHmAsR7
   t1FRlwbJ7O0BVu2gd0VDZhozRrJ2y4ZRM1zxa96OHCjlELxXUS7wKZo9I
   bJhS2OLqt+uJ52jUnJUPXWsTeVGSYytB1MvCLxq+E4XKCQ7zmKR9LeQo6
   g==;
X-CSE-ConnectionGUID: 4E+L9JEuSWmB4G/E8GLf1g==
X-CSE-MsgGUID: 2fYkc5SjTiKLgngoCNtDZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169165598"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169165598"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:05 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8019ACC142
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CB6B1D7479
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 61600E5A19
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0FECA1A0002;
	Tue,  6 Aug 2024 16:47:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 53/60] python3-validators: upgrade 0.32.0 -> 0.33.0
Date: Tue,  6 Aug 2024 16:46:27 +0800
Message-Id: <1722933994-32549-53-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGNA4NqdM7aY0uce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SkpPpjURvXDjDsh/My5hUd/qhQ89MLkDsw7/jPZGR2A2lYl
	106QfORuG4xrLRp+DvAbdQM4PkhkOihP2B593R6IqMlLTilJzMS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111568

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-validators_0.32.0.bb => python3-validators_0.33.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-validators_0.32.0.bb => python3-validators_0.33.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.32.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.33.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-validators_0.32.0.bb
rename to meta-python/recipes-devtools/python/python3-validators_0.33.0.bb
index 606143197..38775cce5 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.33.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-validators.github.io/validators"
 LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3fb4b9e6db86c69a33d5e3ee013ab59"
-SRC_URI[sha256sum] = "9ee6e6d7ac9292b9b755a3155d7c361d76bb2dce23def4f0627662da1e300676"
+SRC_URI[sha256sum] = "535867e9617f0100e676a1257ba1e206b9bfd847ddc171e4d44811f07ff0bfbf"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


