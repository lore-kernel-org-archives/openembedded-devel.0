Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDF2E77191
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.30367.1735032448125228616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=emVb5TZ2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032448; x=1766568448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=p59GgcJUR4DpmhrYHcx9auwFAR0VhvgWUMFNEiktN2k=;
  b=emVb5TZ2LE58DVZgpSkWuK6A1DVtdtJMrO7aO6EH7kfUhFBMDcje4ytW
   N/McZz7rXh1fXat7CZzdL0CvMPTxHfNBZ+qh86QUOXFsChI36pYZgOX1x
   G9Sg+t30fA6aA/kQrGeepWLfITVnRambhUkj8q4R55s5neKZUO+2T35jc
   TI6bGmRUJZpVKCnaODSjux4Eyr9Yf/jgV0yTCTGk3OZQp5q/1WD4ca9QU
   Jqsfi3sORRJYZoPirPx6qlXcalkYO3spLb+GgPLK02jSGcziJVUBGsl/R
   ivDRcLwKF+R5xcZgsCL06nJJBbo0F0e7kSg2lDtz1z4FHcAk5A3fbpfV2
   Q==;
X-CSE-ConnectionGUID: VCWeKYUwTT+LY4J+fPnKEw==
X-CSE-MsgGUID: YDfZxIKIRm2ZElD15j9JoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184807087"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184807087"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:26 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 30DE1D4807
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 00F48D8CAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9144E20071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 393601A0071;
	Tue, 24 Dec 2024 17:27:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/67] python3-pdm-backend: upgrade 2.4.2 -> 2.4.3
Date: Tue, 24 Dec 2024 17:26:36 +0800
Message-Id: <1735032421-13513-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.948400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeU1a43ksVK2hUMi
	dE9ZR67xFcHduoBMovs5UGidmkKLaO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2FR9
	Hau8GO7s9U3lWd/SOEMRCnmbSFFt5IjXx1tpgaMP44CpXGpQfEnQHOfYOKmAgouSD6OOSixwEWo
	sX4QXXIsdl4+xQbLkQuSIaMassh8QQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114518

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Bump validate-pyproject to 0.9.0
- Update dependencies
- Update badge
- Migrate tool config to pyproject.toml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pdm-backend_2.4.2.bb => python3-pdm-backend_2.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm-backend_2.4.2.bb => python3-pdm-backend_2.4.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.2.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pdm-backend_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
index 04686c9138..6cf33491b7 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "1f833e527ae172f34b4b84e2fcf1f65859a2a5ca746e496d8313b3ea6539969f"
+SRC_URI[sha256sum] = "dbd9047a7ac10d11a5227e97163b617ad5d665050476ff63867d971758200728"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


