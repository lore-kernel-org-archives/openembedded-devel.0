Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324D6C3ABAB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:16:04 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.7607.1745900155386015167
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aNEVpm4c;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900156; x=1777436156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AKjNj2gHhRAu/TF9l1nFXG32FNySvkiOvz479ZLrgMc=;
  b=aNEVpm4c7G/BISCDrl3UpovZgMHSgocKxvFhP3s0JYfhdQhAVkpqzeUR
   fbzjjosT9NL91zZu1cHxJcOBuW/MvNLaiFXhPezCK3CfqqQ5uxSh8qLL0
   PBuwdUO5LBYD1gUun1x6WDpvUc0aS9YOI0WbIpYautTE2YrjUExnQXIQb
   FD02s7dJbG+qAGWRsB0g2OC9L7dllTJcAzisyEGwT1XN0nOhWzs+wGa8G
   imQU/MJuz9HQVD6eKF3wx8ZvmF11n66bO1ev/HH6oguyoYjf8y5Lmh0TI
   7R/rpaED7sWb4lAHArXlF9ZGXozwc9yEhOG4c+792kfivFR/8SH1FPcdk
   w==;
X-CSE-ConnectionGUID: haRlMG+wSLOqXWVV9P9wGw==
X-CSE-MsgGUID: y++y4mjNRVCcbpJ6zFK02A==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="198038356"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="198038356"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:54 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E317DBD50
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EE3EBF49B
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D302B1A0071;
	Tue, 29 Apr 2025 12:15:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/23] python3-pycares: upgrade 4.6.0 -> 4.6.1
Date: Tue, 29 Apr 2025 12:15:37 +0800
Message-Id: <1745900138-26424-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117228

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycares_4.6.0.bb => python3-pycares_4.6.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.6.0.bb => python3-pycares_4.6.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.6.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pycares_4.6.1.bb
index aa87112c88..7f1f3cf0fa 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.6.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "b8a004b18a7465ac9400216bc3fad9d9966007af1ee32f4412d2b3a94e33456e"
+SRC_URI[sha256sum] = "8a1d981206a16240eedc79b51af3293575715d4b0b971f4eb47e24839d5ab440"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.43.0


