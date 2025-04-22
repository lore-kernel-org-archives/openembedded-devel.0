Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9635C3ABA2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.35428.1745311775512011294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aAgYTddf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311776; x=1776847776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GPajxl5l1KWlDqtKiQXfwYXRla6sqB+zV+BDHgcyLWs=;
  b=aAgYTddfiLBzTMKJcg18VBlvTWb7k887zHSi9Zg2EXRPKa8IXtXaoUMH
   W3/LzrDLAFbA9kiS0iZiX7AH/5secBPqsYW9IZTTa1okVGwTPg+fMQyqM
   pu0fRCW+NZWzPGFm6CKeuG41LN1aWRqIkcHFtKXMhVbdarbpUu/TraUgR
   +m315exWGSXcKQOFpoMN4+uHyXQ84Ri6HrY0gkl1iB0WL886lb4yjWa88
   +PzVfJnZ2OGqddcjwXrf4/1wMN+Cn0wU7znWQB4WwZaZKkNZNj+eU6Y+d
   4PpcgpsODJGyPWbkz6Z52X41MqzjcLT/WGds/o7lmXzZk9eQ4vEpEB4Y9
   A==;
X-CSE-ConnectionGUID: syhnn4FmSjyXVYqc+TCyjA==
X-CSE-MsgGUID: FmdGtGH7RFmTzwcu2WHmOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="185691856"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="185691856"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:35 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC673E077F
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 319A5D3F34
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:33 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E53711A009A;
	Tue, 22 Apr 2025 16:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/30] python3-moteus: upgrade 0.3.79 -> 0.3.81
Date: Tue, 22 Apr 2025 16:49:13 +0800
Message-Id: <1745311761-1912-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117034

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.79.bb => python3-moteus_0.3.81.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.79.bb => python3-moteus_0.3.81.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.81.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.81.bb
index 4944e13ff4..bb8f572180 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.81.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fae569f0c2e208059e081cf0fcca2e8f71c6c1de582836c745bb884af1e35bf4"
+SRC_URI[sha256sum] = "6f0f3b5ec38c044cf28546e4693b22644c3e9be7a1338933d20b67d0fd55eccc"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.43.0


