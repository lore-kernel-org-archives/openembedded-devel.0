Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B35EC3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.43042.1744017453354804852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EP9A7TEt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017454; x=1775553454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Zs1VhQX9iQmxG8og60/+U20wCxJjBydwm/3zY7sHYFU=;
  b=EP9A7TEtmSeRcsz5mm9243c6CchLEk2dYaFQIf+YQ8yajMJZRSQpUDoH
   48EeQrGzAM99rXHNOZMvbaPpIzOxNPeP8JAv92Jq2CVLm9aEheyAnZgqY
   pBUa32L01DlFpYRmUmm5XER6PzWDjs4oehklvUOWO1Rmp37y/mia1Byvf
   +DD2kGVC+fAPJ443wj8oQ99n0ZFws1Jk4qmj/qA11su1Y4gW/6eEgM6WU
   r6QVycc9MJcwMJilPbspyEQZTncNZODQ0lchwE4UkLTdMCOThhTqCveMI
   2BtTLtDBDDbDlSeKW9vxGjUpO01khj1b3PQZ9a7OZdGIOXstJGUfvL6I1
   A==;
X-CSE-ConnectionGUID: jy56gKJ0SVqJoi6icSMQMQ==
X-CSE-MsgGUID: 5AU2dYpZRjmJ3fu/VmxDGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="194838454"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="194838454"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29D7BEAC03
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E2A5ABF49E
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 715401A0071;
	Mon,  7 Apr 2025 17:17:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/30] python3-termcolor: upgrade 2.5.0 -> 3.0.1
Date: Mon,  7 Apr 2025 17:17:08 +0800
Message-Id: <1744017431-22217-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116654

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-termcolor_2.5.0.bb => python3-termcolor_3.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_2.5.0.bb => python3-termcolor_3.0.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_2.5.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_3.0.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-termcolor_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_3.0.1.bb
index 6df8341c8b..a88482f5d4 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_3.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "998d8d27da6d48442e8e1f016119076b690d962507531df4890fcd2db2ef8a6f"
+SRC_URI[sha256sum] = "a6abd5c6e1284cea2934443ba806e70e5ec8fd2449021be55c280f8a3731b611"
 
 DEPENDS += " \
 	python3-toml-native \
-- 
2.43.0


