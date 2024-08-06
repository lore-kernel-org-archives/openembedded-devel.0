Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D7CC5472D
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2889.1722934023407604320
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DCPIFamx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934023; x=1754470023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/8wJCSUTyeIKEhg+ewMD8QrLGALqoVy+TN7ITguJNek=;
  b=DCPIFamxQc50S/B0a+yUeLREgn+94JuhRvLx8BepKh7IeoIWvl7+/we0
   HaYC9bsfCR5MReeDalI/a6A/k1IbnG5hAs6dOsPjKL56Tp6j+ZXg3Lokz
   ivoVmOjWHUSTyZ/+mZet5Dz04eUZWQjN9rsgCif/w88hD2Pio2KCKXpSq
   Ge7MTKSbutGwhBFD9j85SWi4yBfTJC2TfrHPA3XMLxvo7SQfqtfDeayfA
   IqIpzHJNfSZs1PdWY5qhs6H4kLfGVhU5JfP8VuhaH3QHwrISNbn2mQ8SP
   FJ1xT+1blX7Me6C0Olx+DSvD6M6brvLctCRUUz8RafddIc3W4an6OiPu6
   g==;
X-CSE-ConnectionGUID: e+9kDw1WRHedNm0Xvqji0A==
X-CSE-MsgGUID: OTd0rnoPTo6ofXkUelHg6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="158213950"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="158213950"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:01 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4141CD4240
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8529BBF491
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C2D720050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B9C9A1A0002;
	Tue,  6 Aug 2024 16:46:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/60] python3-langtable: upgrade 0.0.67 -> 0.0.68
Date: Tue,  6 Aug 2024 16:46:12 +0800
Message-Id: <1722933994-32549-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrbT9BpYvT0pkQOXpXKeqpHZTHh7SHLJt/Vd1znySbmRgwh2/Ni4U/l0iAe
	+1fSE+gG5SPiKQodNX85bwsaByCheUm53ZcvJK8B0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111558

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-langtable_0.0.67.bb => python3-langtable_0.0.68.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.67.bb => python3-langtable_0.0.68.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.67.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.68.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.67.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.68.bb
index fe8dd0a0f..64eb57dd3 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.67.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.68.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "04c81012b5a9f018567a480bff0b7228e8db95e86fea0eb3d45894d8b8b80e64"
+SRC_URI[sha256sum] = "3965a4d57a066a595ea8a87f6a5295412e65a7f39dbaad95c7327d48b11799fe"
 
 inherit pypi setuptools3 python3native
 
-- 
2.34.1


