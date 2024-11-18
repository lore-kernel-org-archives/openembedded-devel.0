Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344C1D49200
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:27 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.37268.1731922216162759929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IusrTFAd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922219; x=1763458219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IMFORHWXSRQt8wtMBrrXVG8VP47kYxRV7WRg8jTwrm8=;
  b=IusrTFAdzmy3Zw5KFizaqkIKA3MoLk74m9ICTT6C92wfnbL3M3FDo32M
   qZLMXDVKasdWWJJCp4GyIS2NtJuOXUYi1lRgBfTG4u+ydA/y6JPeBK0cu
   ZTNAowj9DtRyzfO/DYg5tfibGHvkCHMykehF8NeW+hF18fw8sjtU6FoOC
   HCWWn/P4hYARudWDGI1sCU0RkGJhMCn3iF34Ts3WHC9fC4wJoR1Y44aP8
   83vmE0cy+p4pQ6Xc+owAGSTIgOX4cnyvl+SHa6JYb4EYeqAOjPCVt4Gyy
   /Y7UriKEPMJTjVJXhiP8tmHklQJTTsIePUNShzQXJ3p4a06WkzBk2KbL3
   A==;
X-CSE-ConnectionGUID: LMDtnh5IRBqUuCcxO7BceA==
X-CSE-MsgGUID: 8qjV0hNST42Mc0/onY6gyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180782267"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180782267"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:17 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 59FE9D4C39
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DCBAED52B8
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 754FFE368F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 269BD1A000B;
	Mon, 18 Nov 2024 17:30:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/32] python3-jedi: upgrade 0.19.1 -> 0.19.2
Date: Mon, 18 Nov 2024 17:29:44 +0800
Message-Id: <1731922195-5266-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8Kraz8cRVqK8GJM6M4mezkNMAefToEzqnOcVk8rm96wq87FZbBUo99uq5pFo
	Wqnq6QvEaNxRYyaQm14BeMDcAbDtLmzxTAiNZPux0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113886

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Python 3.13 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-jedi_0.19.1.bb => python3-jedi_0.19.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jedi_0.19.1.bb => python3-jedi_0.19.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb b/meta-python/recipes-devtools/python/python3-jedi_0.19.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-jedi_0.19.2.bb
index 56395c3b5..1a150c38d 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.19.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
 
 PYPI_PACKAGE = "jedi"
 
-SRC_URI[sha256sum] = "cf0496f3651bc65d7174ac1b7d043eff454892c708a87d1b683e57b569927ffd"
+SRC_URI[sha256sum] = "4770dc3de41bde3966b02eb84fbcf557fb33cce26ad23da12c742fb50ecb11f0"
 
 RDEPENDS:${PN} = " \
 	python3-parso \
-- 
2.34.1


