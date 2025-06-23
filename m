Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E302C7EE39
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.13709.1750662713074935053
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gLblkQT1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662714; x=1782198714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AMcgmbJcFun498jJd5Hpk5c4D14IR6tLqP5obhN68ao=;
  b=gLblkQT1JUMfxVNbYs4qObkwFZFCe0VDGG3XVpzX29bV9+FEMH9JwPYO
   azobiwEpRkL/g9ndi+crVBWd2EZmcPRKOQeOLLFnGp1BQ0kwXora53zAq
   LHf9/1YB8AOl4Q4J8b0dXu8hpUBmCsgY40pd7H2ECoZ+KbWABtnsXqD2J
   XSr3hc13sOxsy/lLl02cG1XXADDNH/Z6yjENUGwwmUooW6nNnzx0ktFkk
   9wG0YPMEdVUIgACmLZ9SbrmdEly8yNE+RGrDDAO1TUL9VGs2i/fiqre/x
   KABGmj/3us2t0Nt70T/OzPP5LAA8SIKWhcBI9ndaBaAjSEbMkuCmKJS+5
   Q==;
X-CSE-ConnectionGUID: 7jDfgDCxSr657l3RgH5Z3g==
X-CSE-MsgGUID: AF3AwWNVScq/ATn7TZhxOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="182501862"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="182501862"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:52 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B8D24D8E65
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 73563D4E07
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:49 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 236611A0071;
	Mon, 23 Jun 2025 15:11:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/30] python3-bandit: upgrade 1.8.3 -> 1.8.5
Date: Mon, 23 Jun 2025 15:11:17 +0800
Message-ID: <20250623071138.402-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118038

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix the rendering of the CI/CD doc
- Fix for publish to PyPI failure

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bandit_1.8.3.bb => python3-bandit_1.8.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.8.3.bb => python3-bandit_1.8.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.8.3.bb b/meta-python/recipes-devtools/python/python3-bandit_1.8.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.8.3.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.8.5.bb
index 76e0ad2a32..2cf13183e7 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.8.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "f5847beb654d309422985c36644649924e0ea4425c76dec2e89110b87506193a"
+SRC_URI[sha256sum] = "db812e9c39b8868c0fed5278b77fffbbaba828b4891bc80e34b9c50373201cfd"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.43.0


