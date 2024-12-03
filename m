Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39DAE6C5E5
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8205.1733185017914802578
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ix/KNTmq;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185020; x=1764721020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gg2jFFArVTd6g0ut25Ja8krzCyRvsCljc+KRzHWLM8Q=;
  b=ix/KNTmqTXXDYZUAq0rWTS1zKw3/SbMmOlPM63dunvLpCMIXPDIFnEAS
   Ss/OiYIhIn6twEVVIyVMUMfIJYYjOGy53StCUpPNdvgqYlGfbkxEu5hE8
   N/pwVZHYY1F/435owBWHyLcIFojCKxHa1jkIofLcH2nvu20Hn/CgwXmRI
   477xeI3k+A8V1FyQAaTQguAxqvqdjG29ZPwhNc1WZzoyfBgFN3kthoQ0J
   aPCoEtPJn+whfCeAhdNsxhA1pngUzYpt6SBPINatsHczQeAnN19kwN0J7
   CQZwjrndxaPIafdbeQqDKzA++bhH2i+shCkzigdWOUX2bOvmKt8BQ1pcT
   w==;
X-CSE-ConnectionGUID: I4oqVdF5RD+NmyBHAuvsig==
X-CSE-MsgGUID: P/19m3m5RJ+zNjwdryT8kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="170725142"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="170725142"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 45A4DE60AF
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DE5AD4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B021B6CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 516901A0003;
	Tue,  3 Dec 2024 08:16:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/34] python3-fastjsonschema: upgrade 2.20.0 -> 2.21.0
Date: Tue,  3 Dec 2024 08:16:23 +0800
Message-Id: <1733184999-27041-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--7.792300-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTmOEENgsUAuYjmS
	FvfDzVPY6LmRq4bR/xcXIQarK0WBEPfHNVcOky6g+s0+QZYAcN/jLrHqvAiSy9+CFgPG/6VdP0m
	fcDXjvI+hFci9DnaI0uXL+m54lN5/5t7lqsm8XxID2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whhFjW2X28b8BjsKXyzHgcEbGYkyyELuGKSbKItl61J/yZ+in
	TK0bC9eKrauXd3MZDUo/n33twdbYgXS9RANxMQHgepflvyMd8tYzm9P+mVmUlGDMCj2x/Pm
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114159

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Updated test suite
* Fixed detecting when infinity is reached with multipleOf
* Fixed that min/max items/lenght/properties can be float
* Fixed that everything with empty `not` is invalid
* Fixed missing re import when using regex pattern
* Improved regexp for email format to comfort test suite
* Improved regexp for date format to comfort test suite
* Improved regexp for ipv4 format to comfort test suite
* Added partial support of idn-hostname format
* Added `detailed_exceptions` flag (default to True to avoid breaking change)i
  - when used, results are twice as fast

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...astjsonschema_2.20.0.bb => python3-fastjsonschema_2.21.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.20.0.bb => python3-fastjsonschema_2.21.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.0.bb
index 4dd9444a9a..c763a09048 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRC_URI[sha256sum] = "3d48fc5300ee96f5d116f10fe6f28d938e6008f59a6a025c2649475b87f76a23"
+SRC_URI[sha256sum] = "a02026bbbedc83729da3bfff215564b71902757f33f60089f1abae193daa4771"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.34.1


