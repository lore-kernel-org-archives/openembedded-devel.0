Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E57BC54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8226.1710827208223500752
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VODuWU8h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827209; x=1742363209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8cQrYAaQmjlb21ZSCbObnldUCHqxJzivobkxOr4oI7Q=;
  b=VODuWU8hdkPLR2lx4nF4KSnINPcuAnyrjhd00UYWiPJEyOeb1LQSEuCq
   vNlJu07W0nebsJUB7e/mKIz7ZyRhwETqdINhB8YlDL16VGuDkp7veYwGh
   m+dGhKHYxTb92KWRJl2jzeytUhoQP21dRoW/TIzP/pkiI/RXQ65wcn3Rh
   ljVdnhz7kcwf3f8+FZLSR3iVSdqGY3kg/alP2DUSVgqQlCfPLBfnzAxng
   dHXrMSy7LTXJpj36VrG3se/mNWtBO5DguCSeXqK5LC/um69cqZQuF/GM6
   vMz745CVtOJcngZxTNL8WkaqSoOit6Er5o9gerj73PGcM4e7SP/+s0U5H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152562826"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152562826"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C7CB02A0DFD
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 106BF2014B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D01622880B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3EA7C1A006B;
	Tue, 19 Mar 2024 13:46:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/50] python3-mypy: upgrade 1.8.0 -> 1.9.0
Date: Tue, 19 Mar 2024 13:45:23 +0800
Message-Id: <1710827139-30056-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--4.032900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytIrbHX375DeKTz
	q4wH3yI2rmxr85cm8eje6rH+xTsuLQ8LKInWUps8qhcdnP91eXGMI0q8NnpvzpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprQFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq08/3TkPEskbzhfH3NCEeBtB3jX54EqcbcNTRX30bhPQUkmP
	9lEqyiry/UYHWggiI9+3rvdEGIkYDHRq4v/hPOETXAWdoxgL0odJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109451

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix missing type store for overloads
-Fix 'WriteToConn' object has no attribute 'flush'
-Improve TypeAlias error messages
-Support narrowing unions that include type[None]
-Support TypedDict functional syntax as class base type
-Accept multiline quoted annotations
-Allow unary + in Literal
-Substitute type variables in return type of static methods
-Consider TypeVarTuple to be invariant
-Add alias support to field() in attrs plugin
-Improve attrs hashability detection

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mypy_1.8.0.bb => python3-mypy_1.9.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.8.0.bb => python3-mypy_1.9.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.8.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.9.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.9.0.bb
index 2e6c7cc07..e51264f8a 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.9.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "6ff8b244d7085a0b425b56d327b480c3b29cafbd2eff27316a004f9a7391ae07"
+SRC_URI[sha256sum] = "3cc5da0127e6a478cddd906068496a97a7618a21ce9b54bde5bf7e539c7af974"
 
 BBCLASSEXTEND = "native"
 
-- 
2.34.1


