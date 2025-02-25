Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B68CC282C7
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2298.1740525897826058160
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vwf+F7xm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525903; x=1772061903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XEDzSewdslP3Yzp7S9Gzw3hubLxbqxbAO3lV01kunsM=;
  b=Vwf+F7xmPs0wbrMSYiC69l7A83ArR8LLQ7TFXK1/LAbWBIcupZ4lg6Oy
   6rYIhTyPHXu+N6LcbBri7EllTgKlU85eHdYd5Z50kJppOWC0TpzT34mia
   d4PONE47L+EKNpAmWqzkF+k6D5/JvBq9RUxb04JkTC7UYRq8Q+de7jViK
   EEeng7t9Vy5dvzXYEcbOULa+UagmmzRWYq7yqIYFzpWIsUyOwmny0RmyK
   TEuy8ySesG3OxBbrWZ2TK3Rc1GZo4jCh10mvT0oi8i/W4bunC+uFXAgKt
   boqG/ZlTEQHzBf2FN7FEintcilXtPUQY7RwIGrqACZ0ZgY9rTG8AV8cYo
   g==;
X-CSE-ConnectionGUID: xJBn3M8mRnuOBreyNEMzPA==
X-CSE-MsgGUID: 38+nTa9bQqO3gMtK82MTDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="178507190"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="178507190"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:02 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 289B8DBB80
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DF931D7298
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 83F651A006C;
	Wed, 26 Feb 2025 07:24:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/51] python3-pymisp: upgrade 2.5.4 -> 2.5.7.1
Date: Wed, 26 Feb 2025 07:24:27 +0800
Message-Id: <1740525881-21103-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115633

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Remove tests from wheel.
- Make mypy happy.
- Move email MSG to PW protected archive to fool bumb AVs.
- Enrich event/attribute endpoints.
- Update readme.
- Allow MD in docs.
- Remove ref to recommonmark.
- Added missing properties for Notes and Opinions.
- Notes, Opinions and Relationships are no longer
  AnalystDataBehaviorMixin.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.4.bb => python3-pymisp_2.5.7.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.4.bb => python3-pymisp_2.5.7.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.4.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.7.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.4.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.7.1.bb
index c644f34581..87d45940a2 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "368fef2152d9d276d8b476b0f1c72376e9ead49bf58631e31bdb5d7ed86d603f"
+SRC_URI[sha256sum] = "522f357fb9efd11acd14f423e577c3c8996c3bf90c9d66c2f3e83af31d669159"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


