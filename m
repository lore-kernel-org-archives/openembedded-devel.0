Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C1CE7718D
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.30502.1735032438455142389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HPAWlDlW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032450; x=1766568450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=D5jQIZzR2oeeqe/5eravhJtec6MT4HWdKvr1Jq13izg=;
  b=HPAWlDlWFneVfPA9/90s2jzlEbA2CrdZdFIKAWYk5EuI3IgCRjTZFiCc
   gglV6bvJGi/JIPnNhsAQxr+bbBxtXkkuYlcPQrzUreLmv+exrtiT9nDzE
   jw8RzNjAmEJc/uRJZcCW96EPRtmao/kh8kcEcIX2NOsLrASxXMnyoMjdN
   zIWk+kDk3PfAA28lJO7s84Q6UzwRILpVOM3MVoi6jDRQF0w9eAsmzpeBd
   HyMH8dvTVOUlmGXWZznXqWsdT771i4nl0k1nroMOzHmDxNV+yk0wfDJMQ
   tVK1qZ1qnbmQhfKOscGYNPheUWaF5Vh7sXV8x4g13LtkljSQeKK+vz25T
   w==;
X-CSE-ConnectionGUID: vTExhvQ8QnCEIVHDxAoADQ==
X-CSE-MsgGUID: wPts7GHpSwy2KLpHl0zI9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="164248063"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="164248063"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 93ACA96741
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B242D5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 004D86B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9D5D51A006C;
	Tue, 24 Dec 2024 17:27:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 52/67] python3-pytest-freezer: upgrade 0.4.8 -> 0.4.9
Date: Tue, 24 Dec 2024 17:26:46 +0800
Message-Id: <1735032421-13513-52-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-1.286700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu8GLW9IO2MLSBX
	kADE0McYcE5S/jwk5uQNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7Oki
	GGidO7I9AYdLFXr37PgYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2eVW
	/ZdL52j060LjP6f/BNbx8Buc1kF6v12YuUxtrpnPkjgTG0R6C9W10GYspcrmLM0TJ/2PEUneksz
	rHfLnwRFS7b4/oQaRRT3B7YO6DX0fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114523

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- 3.6 and 3.7 eol
- fix: pytest-freezer actually depends on freezegun>=1.1
- move landing page to markdown

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pytest-freezer_0.4.8.bb => python3-pytest-freezer_0.4.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-freezer_0.4.8.bb => python3-pytest-freezer_0.4.9.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.9.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb
rename to meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.9.bb
index 8b4f0dd7f6..212be0ef8b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-freezer_0.4.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-freezer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1661a0f2b9b83ed73b8e05b5683b10d0"
 
-SRC_URI[sha256sum] = "8ee2f724b3ff3540523fa355958a22e6f4c1c819928b78a7a183ae4248ce6ee6"
+SRC_URI[sha256sum] = "21bf16bc9cc46bf98f94382c4b5c3c389be7056ff0be33029111ae11b3f1c82a"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


