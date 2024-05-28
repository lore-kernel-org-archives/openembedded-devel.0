Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45EDC25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:48 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.12696.1716860986640454366
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PRgf8v/t;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860987; x=1748396987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+Zl9C2Ogsb4F6VqQn5pjUWyCZDFMgpuBGOkj0CU+nRo=;
  b=PRgf8v/tCe4UuWrDRIgsfj3CA519hQN/cLQ3Uj2ssIWckjURf8TPSNdT
   XyHMRHO15+XsEP9GVm7WmeO1pSfsIDWfdZEgULHFlfaV6sfRH6WcTctPY
   +Et39LgVJ136+lfa5YKGIPT5f8wvSM/C/28IGBS6qWHRvcOfegYByyRNA
   VhtpoPJmznW4UsWTEGQl3LOFNU17ShmnZwxCddMKsx6/B+ebBPmT9VLwv
   PlhK8/PUvfq80x0jUzKb2oQRDqtt+ia9jOzETQAjV3uBFViwL/z3JS92o
   d3/kHU9x/5NoAX1XXm5p3qwL/Ec75gs5agJM5pCGryyKTnFDRXtDscCmO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="159728471"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="159728471"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:36 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0258DE445A
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4752AD21AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D86C02007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 84F731A000A;
	Tue, 28 May 2024 09:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/40] python3-pdm: upgrade 2.15.2 -> 2.15.3
Date: Tue, 28 May 2024 09:48:00 +0800
Message-Id: <1716860901-863-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--5.821800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgvfU/riSJXkbJp
	VYyphzqme5UtUuXnmq5P1NcaUw3JSSupJvqHf1A88IK7yRWPRNEZ4i6O6koObzGQt2RbsLmqPQ3
	4v/ILndHgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZFXXsIV9lgAHW9n
	uzdghUMnp5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7ncdd
	NZLgUERAfKmmAbtW6ach5TrRcY1s1M4Bl4psqtxxYVzI3UCCaY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110557

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed pdm venv activate, to also work for windows. And added documentation on
  how to authenticate to Azure Artifacts
- Don't show unsupported formats in pdm export.
- Proxy (HTTP_PROXY env vars) settings are ignored for custom indexes.
- Fix the quoting of venv activate command for powershell.
- Raise an error if the package given by pdm update does not exist in the select
  dependency group but in other groups.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.15.2.bb => python3-pdm_2.15.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.15.2.bb => python3-pdm_2.15.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.15.2.bb b/meta-python/recipes-devtools/python/python3-pdm_2.15.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.15.2.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.15.3.bb
index fee39fd9d..7551de866 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.15.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.15.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "c08e87078c29c00e7ad9681dc6a23419dc5617dcbe6cc205024ef4b4e7e28475"
+SRC_URI[sha256sum] = "c227d81f6bf109626a5643a7bb531c5f5b777a850c4eac8d08b472c1146beee5"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


