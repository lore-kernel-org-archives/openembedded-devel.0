Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31ADC07E8C
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2719.1713318093373379123
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EhP6oDmX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318093; x=1744854093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HVW9Fac3VsKhQaFj4WnyKldyzfYBrC2qKvE/siSpxoY=;
  b=EhP6oDmXRLZAc0z72XXI+V7X3eGQ4xNlGjUdL/ImfAzlsIjrAbqeWK02
   JUw26XDANovekPC+OtwWnbH5czmsmv7D3GdJSBJ6b30e+1TlspPLPTFO8
   ysAmlUbjmupP6Ir3/05LwluDT+0yA2ihy4oQzNznMN+5k7IscQ1Uv+PK9
   TEvH5WDM4OY0LTGQNjuYA2+leuocpBg98R7GFSwm4OHdxQ/AjFLT9lfIS
   19VTd3vktS34LUAQc4DF7S7AIvt6nrim3WYF6T7M0bfTD1hcA6NwzrMxM
   plGDRZyDMe4dhBe+vGMm5kTrZoTZFq2LxyTd06Xob/fzePWX00ei+zAMm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="144252855"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="144252855"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D8D7E05B1
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5EA9CFD907
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EA6876B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 97FCB1A0002;
	Wed, 17 Apr 2024 09:41:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/49] python3-eth-typing: upgrade 4.0.0 -> 4.1.0
Date: Wed, 17 Apr 2024 09:40:33 +0800
Message-Id: <1713318061-17128-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--0.050600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyohlnMbn2V9JNz
	RdNorxPXdctRQzVroje+daZEFcM/u+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtexksR5WcgAmCwpQ4GHpWkJzOYA5P4g8Y2PISsRiH3F1dNdbtvXDcyD2nH
	8c+CsK4yyJYVHomwR6/cvmecARs9lvDnRbWUh38HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110008

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Add python3.12 support
-Merge template updates, adding build tests for all docs formats, add blocklint to lint tools

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-eth-typing_4.0.0.bb => python3-eth-typing_4.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-typing_4.0.0.bb => python3-eth-typing_4.1.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_4.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-typing_4.1.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-eth-typing_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-typing_4.1.0.bb
index 3ca311db5..4491de979 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_4.1.0.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "9af0b6beafbc5c2e18daf19da5f5a68315023172c4e79d149e12ad10a3d3f731"
+SRC_URI[sha256sum] = "ed52b0c6b049240fd810bc87c8857c7ea39370f060f70b9ca3876285269f2938"
 
 inherit pypi setuptools3
-- 
2.34.1


