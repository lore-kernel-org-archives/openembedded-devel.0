Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B5EC35FFB
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.4207.1741683333101797981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WQoNaIG/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683334; x=1773219334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=d/KH/n2LSNv/I3JmTqCM6LJZe0iDD3XiwaKqvl42O9w=;
  b=WQoNaIG/LjbdqFfsq1pwTwA8Ab/frMzVt3+KPkfUnLlbVoGP225Xw+wl
   RYaZq7bKB4myQ5/SlorlqS11Ynefw9K3wEnw5sygS1Zu1+0FEpyPMe9Z5
   Nl3PvK8wMq13C7eRHeoZH6OigP8BmP5IyTO6dsktNqjS2jh+4uTbT6joe
   wNV/fMDFiy1FoW8va1LBZT1sJh5ZiYQaDzIpEnnB9H6Pxp89QqSXMfayA
   3xG+QKHXRAU1/chBZ1Lwu77bQOBS8u8g3xmgnBAbrO2ge7xEefVhSd6MW
   fimhw+JEfa83nw+DWqLL8GzCBYhojr7zyT45YPG5k9R0qSJMzsU6lRCP1
   A==;
X-CSE-ConnectionGUID: YbbMV+dBQD+/Sdox0fbivw==
X-CSE-MsgGUID: W6Qjb9e6Q/uOWSnJDzhSRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="171602372"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="171602372"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AB3FD4C39
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EBC7BDC81
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D1A8B1A0071;
	Tue, 11 Mar 2025 16:55:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/36] python3-ipython: upgrade 8.32.0 -> 9.0.2
Date: Tue, 11 Mar 2025 16:54:56 +0800
Message-Id: <1741683310-8681-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115872

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.32.0.bb => python3-ipython_9.0.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.32.0.bb => python3-ipython_9.0.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.32.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.0.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.32.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.0.2.bb
index 7823d43d17..f3ebb74215 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "be2c91895b0b9ea7ba49d33b23e2040c352b33eb6a519cca7ce6e0c743444251"
+SRC_URI[sha256sum] = "ec7b479e3e5656bf4f58c652c120494df1820f4f28f522fb7ca09e213c2aab52"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


