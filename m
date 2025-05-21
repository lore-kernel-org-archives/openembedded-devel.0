Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F024CC678DC
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6741.1747817999049967028
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gW4Su74S;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818006; x=1779354006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WER7lo3hZr3S5H8I39I9TR1zLofJv81lHdqzCJxOqQA=;
  b=gW4Su74SnUOwgcoQcV9+nmrlCO7DD0E6aUbLoJnLW7AchN3v8SlqaSXW
   dJI3PNrskdl8cdRsnRSIBz32TvgQMUIZUrJy5ECLgVo4jKSz7TVr0lPCQ
   BtQJHhrZgK7yjotRX+VkWy0AXWCmBMTOExEdAirDIGyRV52HEA+PwdCXU
   Szwjg42Qr/P7ouWwXB34QGP8cR8YTnrweIz1XCezkhu1KqlycVlLfxPUG
   ZN3Iibqgg3C40yiywWu5VBlGasVQhyHTO2uDTF2BAIn2p9+tceq16iWvm
   csLzwhyjifS7ztfh3LtiXppJH9t0SJ7e3OGDjzFxwb6Rxl9AEJ/1mc1NS
   Q==;
X-CSE-ConnectionGUID: mbIYbYxLTd2oUdRxmJ9PYA==
X-CSE-MsgGUID: 6zy/Xvt1S1mhr+7GoBTcxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="179669872"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="179669872"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 226AAD5004
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D5663CFA50
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 631D51A0078;
	Wed, 21 May 2025 17:00:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/43] python3-virtualenv: upgrade 20.30.0 -> 20.31.2
Date: Wed, 21 May 2025 16:59:30 +0800
Message-Id: <1747817972-28874-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117565

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Reintroduce the --wheel CLI option, even though it has no effect on Python > 3.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.30.0.bb => python3-virtualenv_20.31.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.30.0.bb => python3-virtualenv_20.31.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.30.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.31.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.30.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.31.2.bb
index 4d259bc9df..6c3aa19266 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.30.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.31.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "800863162bcaa5450a6e4d721049730e7f2dae07720e0902b0e4040bd6f9ada8"
+SRC_URI[sha256sum] = "e10c0a9d02835e592521be48b332b6caee6887f332c111aa79a09b9e79efc2af"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


