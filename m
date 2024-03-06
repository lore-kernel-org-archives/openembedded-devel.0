Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90D2C54E58
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:47 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7735.1709714682398141074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fHGEw+Pi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714683; x=1741250683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0AGWuidQcliqnJyJchjaHdCpIp5fudihqWIAbeNeVm8=;
  b=fHGEw+PiV7w5jmupn76L2p7jB+FWG4NHMp0OxtrA25gzODztj3mI8AG7
   TfN63J1FLniKa2FhRU74MExtaWT9CZxwy1W/a8+7ZuJGywi/YCuNUlWRO
   WOQiN+rS2m5vzkTwVHHxE/Ih1R8m+X9XB8bMNPx9tCjYTmBfqRG9PNRtS
   qUYVq4Sd4GwvUGILHESzEgbLspoyPHk4htmdQ2BZiA6NYwakWjgi5c5VF
   Ko1gtmT4QxHIJnSRD+tBjrPgsS8fyiOVQ+I//6mshrFYSgbGqn7rT9ue0
   kHav/5KHxOkWstA1krjB9XqxnK9+DysYRXPBaonzii901KaZ3u83DIohs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151387335"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151387335"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:41 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E2E9C68B4
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B0C142613
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F8E341189
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B64741A006A;
	Wed,  6 Mar 2024 16:44:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/26] python3-pdm: upgrade 2.12.3 -> 2.12.4
Date: Wed,  6 Mar 2024 16:43:23 +0800
Message-Id: <1709714608-19296-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-0.786400-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrmZiw53dqSN8wAYdq1VTXo5KP
	VSCA9cWVfgsc3BsCzVh9+b2UAY3sBlAKA8rQCOlMkCThXPqsqiuyTrWV4vwyX/EiNA2fIKSTvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgK7YaZ2V2aJQYA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBSuS75W6VrXlpQPH
	UiwFh09irgvuu2RG13yj+n/TkbJh/teLnJ5hGzZi/Sghwwqk+poztSf+DEDQsr1sd2xy7gDqKii
	/7Z0NKHsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109161

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Use env PDM_NO_EDITABLE as the default value for --no-editable option.
-Reset project.environment when importing from setup.py, to fix resolution error.
-Do not fetch package hashes when --frozen-lockfile is passed.
-Make sure non-venv interpreters are used by venv creator.
-Don't cause a hard failure if the local directory doesn't exist.
-Fix the default value for negative CLI flags.
-Auto-gen configuration reference documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.12.3.bb => python3-pdm_2.12.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.12.3.bb => python3-pdm_2.12.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.12.3.bb b/meta-python/recipes-devtools/python/python3-pdm_2.12.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.12.3.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.12.4.bb
index 0862eab6a..ace3d38b0 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.12.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "53cdab727c1469fdc196efd8d7ff8404a3ca91ee43c0a5714736f2020d0a5ddf"
+SRC_URI[sha256sum] = "d04877362f95cf9ffc1d2c38b851f693706e4928840e48986ae576dad5741496"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


