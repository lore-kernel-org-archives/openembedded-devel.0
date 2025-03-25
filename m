Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE26C36010
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:29 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.61110.1742893331453657027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OhXZ1/Yz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893343; x=1774429343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KjNaWzN5OjkazR3pHtPMtFp1r3Exa5e1flYZQEgpQQ8=;
  b=OhXZ1/Yz40p76nv/f2W796PcWuSdBBw/r/hiKL2RABhOlF/zGwuWVo0g
   pJBt6cf1GXz6oEBqkFqlpEIj/NXaEaVQuDU4JW7jsBaMNO8RdGBemnD9M
   kUcO9kkX6PLsdqgomu4G8tlQyOb4pIY/LeK8p3sT68+GkvWJqg/R5ZfSV
   M4yoAUSlmDfNYfdXyOF59aRw9h2c8jtFcdPqqT7xvWD+hCCKZDhg1DVuW
   /T91iJYMj2rhvcT48za3Kli0AMUU8Wri+UDhjEEvQJoO7SXP+jxST+0tV
   ZiuXAVfuWj2cghsLz6eIrhnCoVqBgOEUOtM8PUlReDKyd4QJXoUz6jZsW
   w==;
X-CSE-ConnectionGUID: 1KH8dR0KTjy5Lwu7ptjGbg==
X-CSE-MsgGUID: Xip2TT+/TKG0g5HFzj8Idg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="173638144"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="173638144"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:22 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 211DEDC737
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8E5BD72B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9DF5B1A0078;
	Tue, 25 Mar 2025 17:02:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/45] python3-web3: upgrade 7.8.0 -> 7.9.0
Date: Tue, 25 Mar 2025 17:01:47 +0800
Message-Id: <1742893312-3809-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116263

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  https://github.com/ethereum/web3.py/blob/v7.9.0/docs/release_notes.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_7.8.0.bb => python3-web3_7.9.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_7.8.0.bb => python3-web3_7.9.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.8.0.bb b/meta-python/recipes-devtools/python/python3-web3_7.9.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_7.8.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_7.9.0.bb
index 3b8c098280..3b740329f4 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.9.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d34d9701a1461e4bd71a904ac4cf7be"
 
-SRC_URI[sha256sum] = "712bc9fd6b1ef6e467ee24c25b581e1951cab2cba17f9f548f12587734f2c857"
+SRC_URI[sha256sum] = "3c4487a7ac57e0a187bd7ee03db455d94f354d15cca45f097f15f7281ad1a01f"
 
 inherit pypi setuptools3
 
-- 
2.43.0


