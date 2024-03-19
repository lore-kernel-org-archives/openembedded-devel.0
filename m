Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D145DC54E8A
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8159.1710827206450089136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qjbknFA4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827218; x=1742363218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=H1Lgsqf6aD3HX/QOeojdQSRp69QIXwlU065Xh02Wbo4=;
  b=qjbknFA4VD3eBOGcGjBDreKT33/I40tQvXKbPA9OHVO24HytAG8vaAK8
   HUdoR7C0J3MiU34XuAQmd+AC4nYhT39QrbnpkeGHWQW97M8krbOhnnAMd
   fi+tbvnwwvHeX+dY0+87Zgr6zn5PeM6Ej8Pjs6kNF2lmaBSGuIfr3Bf1D
   y5DRtNVMwRT6aAkBLASQOhCvLiXZVe/zWiIx9wt8chC9i0FgbsMGW29SD
   bI1oNcEbqs8fyGTrrDfkIGPWVuyIwQ1zMtX3zG4ktFU8Csz6L+obuF7XW
   XRMKDjs/lYRrmnkmZakeNDf/yCOah9zEOkFRox6jBQAfC9FbCwIqrNsiT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152674102"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152674102"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:57 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B05AC141214
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6A73B4E25
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 834E9E2B0A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2CDD01A006B;
	Tue, 19 Mar 2024 13:46:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 48/50] thingsboard-gateway: upgrade 3.4.4 -> 3.4.5
Date: Tue, 19 Mar 2024 13:45:37 +0800
Message-Id: <1710827139-30056-48-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--6.026300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrBgA+oehWZhFeNs5tWYvjCU89
	3SeL1XuD2ODcUJmtdLEAhRZaKQhPMm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2lNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO31Kz
	k40dEY9cr9ktMIxybX3KAC08eRd36V8aVaJVgOpIUacAiNQCAo
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109465

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://thingsboard.io/docs/reference/releases/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hingsboard-gateway_3.4.4.bb => thingsboard-gateway_3.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.4.4.bb => thingsboard-gateway_3.4.5.bb} (95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.4.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.5.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.4.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.5.bb
index e14179891..c3eccb7f5 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "94ee246ced4aa1f31d992f1571baae3282cc73eee76336fa9e9791adfeca13bc"
+SRC_URI[sha256sum] = "673596b4f358cf7cca77bc5743bc1e50a2958dca5ccd815c0979d46fd43c9200"
 
 inherit pypi setuptools3
 
-- 
2.34.1


