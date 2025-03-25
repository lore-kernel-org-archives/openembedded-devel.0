Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AD1C369A5
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.61528.1742893334031795773
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kt6cF4xX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893340; x=1774429340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dq1c0XyYSwldshl8RmYQh5PoVuznBQlWeL0HsBhPDok=;
  b=kt6cF4xXfq5e+zK/nTOV2eJC9UWCKeMgpbGK7QrHP2OkOX4+a4LdPS7k
   Z9huMeV2UrsPotUBXo64H/zwFR0/Y+ykFusuHkNpkf2NBcRrCNPx78HSG
   ET0F3/W5uiltB94JK9zCFkV6vI/UIYCvSyQ0WrKpohGOQ7A2gD9IOi7Xa
   Eecc3e7uOfoGwlv0Wkpj364Uw0ukDus2hYYeBo7Pz/f7l8E1AgGwgWQKu
   7oOLojsRY8dCsEnYbrZG0SPPF5oK6MRiIcPx3ab3zZTNuVrewNYwg2oxc
   1s4trEqAG/oTIsL0R72OYabJq6k8e0jp/zC9z1AigGUGTc93/cSXp59Ra
   g==;
X-CSE-ConnectionGUID: io2eS3oXRS+P+AuiO7X/Sw==
X-CSE-MsgGUID: TvAx1XERQjGFeBPMU2PIWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="182159870"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="182159870"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 45635D4807
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A1DFD72B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C2CFA1A0078;
	Tue, 25 Mar 2025 17:02:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/45] python3-grpcio-reflection: upgrade 1.70.0 -> 1.71.0
Date: Tue, 25 Mar 2025 17:01:34 +0800
Message-Id: <1742893312-3809-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116249

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reflection_1.70.0.bb => python3-grpcio-reflection_1.71.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.70.0.bb => python3-grpcio-reflection_1.71.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.70.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.70.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb
index 08d94a0084..308e1e0430 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "af46ce13e57fd7602deaef5b1d1903f6644f8982cc00f62fa9fa5b928acf6a49"
+SRC_URI[sha256sum] = "51504e977057ffabe66d1ed55557b15e969c42bb3a1f28ee45d730dd5f983bb5"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


