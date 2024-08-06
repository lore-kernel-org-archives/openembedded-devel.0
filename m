Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D17C54742
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2890.1722934024776036929
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aYZu684H;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934026; x=1754470026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WsFmeY1wqkLEAHidwQrjtvQkm5NHC49EOPAhan219vI=;
  b=aYZu684HmYbhahWqqSfU72TdPFjARoqzh/6l/LEVGV3RSPscmcoZ5QsK
   HHttgl2TxlAteR3PyCXi1NfkW2dHT3zyRYPjWzB47v9UhOrM/LefIoruY
   tHbRC7LZDEFU6gel2krs5KPUYye+fh6UjPseIDMOBbMlij3PUB4VEJr0J
   DxPY8HsN1fW0AaLem8sPToJUIzgyrlFYmQm0LPAGnlL/XfaDdufVhck4k
   Ior4CGoTnj9Wemz7Boym6kG8+u6MdcbA5z62IT3mQ68FYWrybonLmypRc
   R01SCUS8/UuEw5l2UGZL4nUpvKLQWySp/C/cz9R6F7CQtS/qes6MwRR0A
   g==;
X-CSE-ConnectionGUID: mH/CqkPwT7mNp/lrQUzJAQ==
X-CSE-MsgGUID: WuMwuVLRR8qW0cs1N/8fsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169882468"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169882468"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:05 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E9374DB3BF
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 397F5D50E2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CCDC020076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C0111A000C;
	Tue,  6 Aug 2024 16:47:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 55/60] python3-xmlschema: upgrade 3.3.1 -> 3.3.2
Date: Tue,  6 Aug 2024 16:46:29 +0800
Message-Id: <1722933994-32549-55-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrUtKoxQcUwF2+LHMTBebopKUDUvnYUts+zSnBP3IBQ61PVoM7xAv8yTVTL
	/f6VJzQiJtCGTgTqWVRHg9izTGnAS+44DZjOQdDR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111570

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_3.3.1.bb => python3-xmlschema_3.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_3.3.1.bb => python3-xmlschema_3.3.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.3.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xmlschema_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb
index a80f6c2db..f927bd622 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "2066ecbc9728112073f6f44d17c5c16723aff1c7d22a7c4c6421e2d68ec5f0ea"
+SRC_URI[sha256sum] = "a2f021f21d0b5ab371e9bcb5a1d5c34b9ba2c74ad3e32854474c4159bf94e158"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.34.1


