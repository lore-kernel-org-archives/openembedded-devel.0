Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B96CD129E
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.39362.1711983107682411689
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f2SJexMD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983107; x=1743519107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RrBSBfVs+Rrq/lrWmRFS/UaCeKI4CkwypMd1XzKEj1k=;
  b=f2SJexMD+jKHtSyAQXTCTdHk2K8Nxc06GjnoDNTmNzT53O1k4w9qNJcT
   RzWtVpFWBP+Ps84/RcyqYxf0fJWpAFflAe3KSBW7iukX26aMaiJ4BDxBo
   b2SSZuDX7XpexjdtdOmmJs5ASPNuZE7toHux+RhIFvI8nj95cUuJhk5Ie
   9ZScxCnHUH/9htva+nOWIUw6GTBT6S1aiqhQTGCSto7W8eIkvw4bvS8SV
   PTHV9vT3ot4YV7zyXuKrwdXTUR3CFTQ2mh92YqKjl03wU7jTTkoH7XC2+
   bUdpV9TLgcE8KI/RbBGyY/9DNKOzI3jcjAkSB2hhRIFtkP806OmtrpxMx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133053929"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133053929"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:45 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CA8DD46CA
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD19D1B860
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A42521EEEF
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 309571A000B;
	Mon,  1 Apr 2024 22:51:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/47] python3-thrift: upgrade 0.16.0 -> 0.20.0
Date: Mon,  1 Apr 2024 22:51:10 +0800
Message-Id: <1711983079-16849-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-0.435700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSA6HV5wETgDxb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5uYMNZlevXKUzBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6M5h
	cE2qcZ3H7pWc7sxdTekvX7qypsbOnvxBhITsY1s/v2gwyuywnCK9I0/5O3mBqUAc/sY9oTNBV1J
	Yc7WO6STgoKJOWnwLyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109754

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/apache/thrift/blob/v0.20.0/CHANGES.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-thrift_0.16.0.bb => python3-thrift_0.20.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-thrift/{python3-thrift_0.16.0.bb => python3-thrift_0.20.0.bb} (85%)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.20.0.bb
similarity index 85%
rename from meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python3-thrift_0.20.0.bb
index 63065e00b..6a0a66aef 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.20.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for the Apache Thrift RPC system"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
-SRC_URI[sha256sum] = "2b5b6488fcded21f9d312aa23c9ff6a0195d0f6ae26ddbd5ad9e3e25dfc14408"
+SRC_URI[sha256sum] = "4dd662eadf6b8aebe8a41729527bd69adf6ceaa2a8681cbef64d1273b3e8feba"
 
 inherit pypi setuptools3
 
-- 
2.34.1


