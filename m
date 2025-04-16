Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BACC369D1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.14614.1744794155967851428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=px8ykoiQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794156; x=1776330156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Z4KeppZCUEMFNqLsjLQsUlCAZ3E8HQZo39C+iCpJd4I=;
  b=px8ykoiQqUykjTfeBWjz7AYTPUU90Eyz/7RmqTTqD1eZDDeW7sTOPuG4
   /KW4wkoQsP5ku0UJDM5T28I6Ien3PYRwYKP4soPuSxkUOTaxOOBqJF3PQ
   /PlLETJ/DsQ/2POGNB2cIRUoAZjnydeu/dm+kZR+YvjcO9YFGfaM8veOi
   O/LEPP23chztWRAxFRyBVkAi0Cskw62rjeZtU0p/HN7Y1rZ8hI1n1J4m0
   TPo5cIXSmy91vV+ZaDzn46ep6Ex3M0QDnAbG3g/UdLT9K4Kr0lU6DDE/+
   xdyqmxuCVJsIVmFZ5aOV7j4LLVMMu0o1xtg32G3rm5Bf2MVyxL0ecO52b
   A==;
X-CSE-ConnectionGUID: etRk0/tORjmx58gZ4Z/3/Q==
X-CSE-MsgGUID: jZq5HPyBSYmQukTsTiLKsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="175523881"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="175523881"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 93605D5013
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 53C1CD50F5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 127F41A009B;
	Wed, 16 Apr 2025 17:02:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/31] python3-pyzmq: upgrade 26.3.0 -> 26.4.0
Date: Wed, 16 Apr 2025 17:02:10 +0800
Message-Id: <1744794136-908-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116889

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyzmq_26.3.0.bb => python3-pyzmq_26.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_26.3.0.bb => python3-pyzmq_26.4.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_26.3.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_26.4.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pyzmq_26.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_26.4.0.bb
index c7225aa259..286750950a 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_26.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_26.4.0.bb
@@ -29,7 +29,7 @@ SRC_URI:append = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "f1cd68b8236faab78138a8fc703f7ca0ad431b17a3fcac696358600d4e6243b3"
+SRC_URI[sha256sum] = "4bd13f85f80962f91a651a7356fe0472791a5f7a92f227822b5acf44795c626d"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest cython
 
-- 
2.43.0


