Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33ABC021BF
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.46634.1739178130648201785
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GW8ZlMBD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178130; x=1770714130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FG09lcA17VxwksskZJOVaKQf9dMIEe/jsA0KkfIKNtw=;
  b=GW8ZlMBD36bNLsE+DKttxmi4fcEozgr0iNVKqOOqHhz33Ky9o2QVLTNp
   gMkYZ7fIKKNcF+P2ZcCn9TOq6r1AFevXAhUmxSCqZtUP59lzA/Xeg1kcF
   cX0nHcwgo4p2NbTcEM0tA4ETQyMtK3TgKWFJryyq+X+lT6ozilCLLjVx+
   4xEXQMP1v4bX06Od0M+Ts+gfOOHd9KCm0Ictw1nfDIyKiUfh4jdt9ulL9
   dO9xZhQE7hjafkNYmSi+DCACdKG7wXb8IH7nA8w+UyvZiNAsSBF7bPZhi
   xUquWludAg7r8cY9SJfcMq+X69J679bJ66G9tdE0xVlvcNiCbRjKEqCXu
   g==;
X-CSE-ConnectionGUID: Ni2jfuwySnWSqXW4HivpXA==
X-CSE-MsgGUID: r/XeES/tTtShD8VmqdqLqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177444543"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177444543"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:09 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F2B44D6EB7
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BBF73CFA5B
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FA141A006C;
	Mon, 10 Feb 2025 17:02:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 57/66] python3-pytest-lazy-fixtures: upgrade 1.1.1 -> 1.1.2
Date: Mon, 10 Feb 2025 17:01:26 +0800
Message-Id: <1739178095-26432-57-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115385

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Bump codecov/codecov-action from 4 to 5 in the github-actions group
- Fix lfc class callable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-fixtures_1.1.1.bb => python3-pytest-lazy-fixtures_1.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-lazy-fixtures_1.1.1.bb => python3-pytest-lazy-fixtures_1.1.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.2.bb
index 103ea655b5..711f2ed0a5 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.2.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "https://github.com/dev-petrov/pytest-lazy-fixtures"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4475e66fcfabe27395e6764c8f69c876"
 
-SRC_URI[sha256sum] = "0c561f0d29eea5b55cf29b9264a3241999ffdb74c6b6e8c4ccc0bd2c934d01ed"
+SRC_URI[sha256sum] = "14ba4154dab52066c1c4d6547cc40bbf60726445cb16f1d2dcc9485cdf38964d"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


