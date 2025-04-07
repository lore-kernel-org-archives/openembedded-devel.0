Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F92C369AD
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.42481.1744017450044790475
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QLd360Ow;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017452; x=1775553452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TNxbU35ofoVxZMwo065mMIUH2hXrb4UqLle9oT+Pr5U=;
  b=QLd360Owd+OyatMjleQm6SDaKbenJ1iodmzaQ/7IjKsWR4t299gPpR3g
   JpqAEwfxthpt2ZPhiCOtDJUkmM9Y9Vi8kYGwmCSF+Gty7Vqdp0BD0dV0P
   NxcSp6QV+blAuouR4oR5PaD7hOroBZfFxkivNU+GuQtoMtI4MIJVGFUaD
   IQl4nesfhLMxfVvy/r/X5ZWdg5P7pbS/Fru0AJ4q/mspDXKyZcc8dup24
   u1V2Ij7nYktaV8bZ9WbP56W6w8P2QjR6SGdL0PKG24XyOk00HbtvJVYXY
   1nNcbQccs9pyPfaUdovrIvwO0fpW0ASsEHdL0e+UEQKjpQBFcVXn/i7Uy
   w==;
X-CSE-ConnectionGUID: i24KwSQoTnKf9XuMlGDJhw==
X-CSE-MsgGUID: 3X01hGwcR5qmcqc7wF6mFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195668934"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195668934"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:29 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AA378D480C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 721F0D4C39
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2FD841A009A;
	Mon,  7 Apr 2025 17:17:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/30] python3-pdm: upgrade 2.22.4 -> 2.23.0
Date: Mon,  7 Apr 2025 17:16:59 +0800
Message-Id: <1744017431-22217-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116643

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.22.4.bb => python3-pdm_2.23.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.22.4.bb => python3-pdm_2.23.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb b/meta-python/recipes-devtools/python/python3-pdm_2.23.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.23.0.bb
index e6f35b3c7a..f565819a9a 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.23.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "8483f3d2285039cea7e07c5ba6ac7e1fcba358129f8831fb75065a797d27b923"
+SRC_URI[sha256sum] = "ec5ce439648b42b928f4afa91c2b6251e6a33f40cc83779d899ca970bd9eb131"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


