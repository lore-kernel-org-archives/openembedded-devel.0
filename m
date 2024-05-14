Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5D3C25B75
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:40 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10787.1715677833427102751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AzLQi3/Q;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677838; x=1747213838;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FqzyezBilPjRRWfXK6CyS1Wrdvk6csJkmIqu29bvVkk=;
  b=AzLQi3/Qrokv2Y7pVt5v9maTv1mmMM+2Cpf8NnGlz9rZWLi2M0hbykAX
   I0Bt3jswvU7V9gcV0t++1wowZva7vhG8IT3/Kb+KXYI0Uq54E7X/SCY7h
   Mt/z6Drrt3gTVf+qeTRN+b29qOR0LilB2tMh0S1dm4tnJL/cwLU/js6f/
   Kyqeq/WHFfzIbkYHaiLAN/yHzU8JSeKek9vM823NuDip7zzN6uzob2+tB
   ViD5Wf89nR1D9TRjK+U2IizFgHOdgvmpqpR1NDNIm2FD7zr9qN4cgJPGn
   6jVqlOd2yqsbQexmSU7Iqej5NCqR9MXNy4WOa3BdM9YXXmnF85X8QXkQG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="137527408"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="137527408"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 142ADDB614
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 493D4D949A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD53C20076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8AF171A000B;
	Tue, 14 May 2024 17:10:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/44] python3-joblib: upgrade 1.4.0 -> 1.4.2
Date: Tue, 14 May 2024 17:09:59 +0800
Message-Id: <1715677817-2223-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--4.284600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxM+b8yxBqvA+aG
	g/Bit59tZX2hfwUP7YpKhBUJyxjhBu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNT87o4uFUdFRh9HpcK8faW/hFi9V+hn3wPbrokrFJmpNMa5/xzqmrgE9f6ll3YIXfDXlr
	UWznXhhyQrghmZhLFEOIUeubjVn6mJbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110370

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- TST add a test that ensures conservation of byte order during IPC
- DOC fix typos in CHANGES.rst
- DOC typo in docs
- FIX revert MemorizedFunc.call API change

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-joblib_1.4.0.bb => python3-joblib_1.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.4.0.bb => python3-joblib_1.4.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.4.0.bb b/meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-joblib_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb
index 868e3f211..13d2a448d 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "1eb0dc091919cd384490de890cb5dfd538410a6d4b3b54eef09fb8c50b409b1c"
+SRC_URI[sha256sum] = "2382c5816b2636fbd20a09e0f4e9dad4736765fdfb7dca582943b9c1366b3f0e"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.34.1


