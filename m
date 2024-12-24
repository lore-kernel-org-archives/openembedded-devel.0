Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4195E77190
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.30508.1735032444345337866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oxAZjKfj;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032449; x=1766568449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kBzvHKGVab0ppbBxODsMEQtKWKcTzLKRwcL2WcenreI=;
  b=oxAZjKfjDO0RcIASpjn7ot5YGj2g+ann62AImmNt9UG4zFpARvTxMqa0
   bk/KeRqRbAflxcB0CoDHw2qaitMBODykGRA93Z2itMvPHh0nhMTxn2CTO
   HRfmTw2UjYyWwp9XqfejROvjLCQdi2+FzJxkh5m6RCZhxu2GrZB7OAA3U
   fLWHXoOaB2XG9ShpRfhj7EnzDYcGF5dSqYGm9lFpHYfvFPYaE8U4xyNRi
   IwOSkxUNTxCp778pCSyPs9F5XWAkVmFBmjVI0GwEvoFtVNkzIfiQeZJyI
   7+bX75nG+dSbt5Dqzjm4kk7ZkdORhuizIJdexR2195mNbR+g2rI/Kj/T/
   w==;
X-CSE-ConnectionGUID: nPRD7/9STBqSwamU+TItdQ==
X-CSE-MsgGUID: JycHe2dcS+6C5KRKtMmJxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="172125392"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="172125392"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:27 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CACC5D4807
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A22E4D6FE5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FA276B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DD55D1A0071;
	Tue, 24 Dec 2024 17:27:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/67] python3-pyroute2: upgrade 0.7.12 -> 0.8.1
Date: Tue, 24 Dec 2024 17:26:43 +0800
Message-Id: <1735032421-13513-49-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--2.027800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbysfKvxKNqkE/5hD
	mI9zl/n34CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOKLRT775j3r7EK+1v9ofiO9HxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6swF
	PyL8C1SEZMICoyOkfxFSgPkII3MVg3MFpARRJKuyWbfU/P/9II+NN3poo60i1Mz3RNeIQgC/BNJ
	PTzIC8dEbetn52a/CmCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114520

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- ndb: fix route replace
- ndb: fix af_bridge_fdb indexes
- rtnl: probe API
- tc: htb rate64
- ipvs: basic support
- decoder: support pcap format
- ethtool: get/set channels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyroute2_0.7.12.bb => python3-pyroute2_0.8.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.7.12.bb => python3-pyroute2_0.8.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.8.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.8.1.bb
index a12fa0ac4c..048b0ca075 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.8.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "54d226fc3ff2732f49bac9b26853c50c9d05be05a4d9daf09c7cf6d77301eff3"
+SRC_URI[sha256sum] = "b91f4a1f7abb9824637b1fe67e6e4a0a071d98d4a1a1b47ef792304ff3adad11"
 
 inherit python_setuptools_build_meta pypi ptest
 
-- 
2.43.0


