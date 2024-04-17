Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71C4C41513
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2717.1713318090793267641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VcU+Thru;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318091; x=1744854091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iDUdmxvFlVVa1ODfQ8g+TU6heBtf9Amit8y4kaU22GQ=;
  b=VcU+ThruWgtG8FFqY7YjeBpr8DGZiwo8n0IyS3GskIfIY/G3nxITuJy6
   Yq9f6vnIodkyUmbIKaENNVtzgmDc0GAVq3ukBousIl8WYbNvdFSzlHobX
   vkfwRTLBhh/KROwSNDG7JWy6ojx/0OaDOy2qrVQFDh8dF0ekIteu7xD+l
   3YzXI2XNOwQfJwment2tmDY8nOa90lkdgdhSh+Zj8ooje0KkHeJE5t/3Q
   kg/zBZJBFRHRB+tbVB8hzjyS8QKTMHuf9UfhnVIaIbCgysf4k0W5Zif4g
   kwnWpOfNnPr4TCylPvFE5eReNUYy9U1B+Nhf7TRIzYUm8+IqTaiCk8sAk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="135163773"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="135163773"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BE02E0AA2
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A1FEAECA21
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33ED16B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D5F601A0002;
	Wed, 17 Apr 2024 09:41:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/49] python3-cbor2: upgrade 5.6.2 -> 5.6.3
Date: Wed, 17 Apr 2024 09:40:29 +0800
Message-Id: <1713318061-17128-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--0.136600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgUvmHwwr7Gkb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzbY3IKfQ4xY4qql
	yG6ycQ4dDxGQvTcV71RbSRK0M5Vtgm+OtkjHYqzlxpuzLC8n8UBHufjsOKgU1wO9rcTFaOd82nX
	TOjGR9XiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110003

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed decoding of epoch-based dates being affected by the local time zone in the C extension

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_5.6.2.bb => python3-cbor2_5.6.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.6.2.bb => python3-cbor2_5.6.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.2.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.6.2.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
index c0987a9a1..c9c98b6fb 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
@@ -4,7 +4,7 @@ DEPENDS +="python3-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "b7513c2dea8868991fad7ef8899890ebcf8b199b9b4461c3c11d7ad3aef4820d"
+SRC_URI[sha256sum] = "e6f0ae2751c2d333a960e0807c0611494eb1245631a167965acbc100509455d3"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


