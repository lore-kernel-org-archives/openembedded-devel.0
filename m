Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8DAC2BA18
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2431.1718161118426030738
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P5JfhVZV;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161119; x=1749697119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XwWmW2ZHb7Wr4T0lKo5iB2t8e0n02oQf6Izkh/bBjKg=;
  b=P5JfhVZVfSojlCVcK/WwQFwTqgirG/vqIpqWSLFK8B/2XjWY+vO33Ii1
   jiTxQc3Pgzkbn8HTITOZ2GbJuiGPVv5Bs9n9jIUvgi+Xi+d5i3HVMRqeT
   GyGSDH47xiZ1gLIXHY1Rt9PAgfEzXbQID7DDf868q09V+06kceXPZ13/2
   vhvi/L23RycvmrGPdgyAvfRL9veFMToz8EFB1M9pJRp1XQ53E9Z2LquXP
   ZziT+P0ItHpQnCDWp1lReNal1NL2gLiczSDIc+b7Uxpr6fDsrzvBY7CcO
   hsnUaii7+wdTpTPMGEKh9szKEyalanG91hMT1AELAZ1wdSNamaVbPtPQi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="161975266"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="161975266"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:36 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CB55CD8003
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0EBBBD8AE6
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F536401E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3B64E1A0002;
	Wed, 12 Jun 2024 10:58:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 03/43] python3-bidict: upgrade 0.23.0 -> 0.23.1
Date: Wed, 12 Jun 2024 10:57:36 +0800
Message-Id: <1718161096-29710-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-1.537700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvqWOQST6GEByxX
	wd9S2XGh4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0548icqvB+icULOOp
	5xxUy7oaBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5q0L
	S/Kugr3MXPVxSLHz7CL2MkcfU4uPdXbuM4yGIwQvM9/f5Hp2xoTNhrkoBrtYXQicmaFcS6C1/wS
	m3OWx/AYSE4cIgb7mSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110840

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fix a regression in 0.23.0 that could defeat type inference of a bidict's key
  type and value type when running in Python 3.8 or 3.9.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bidict_0.23.0.bb => python3-bidict_0.23.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bidict_0.23.0.bb => python3-bidict_0.23.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.23.0.bb b/meta-python/recipes-devtools/python/python3-bidict_0.23.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bidict_0.23.0.bb
rename to meta-python/recipes-devtools/python/python3-bidict_0.23.1.bb
index 5667e4927..cd9e365ff 100644
--- a/meta-python/recipes-devtools/python/python3-bidict_0.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bidict_0.23.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://bidict.readthedocs.io/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e907308cc9356afa99ac0eec6b20211b"
 
-SRC_URI[sha256sum] = "3959ca59d4d6997702d642bf1e5fd93cba299863723fc289545198f70c468578"
+SRC_URI[sha256sum] = "03069d763bc387bbd20e7d49914e75fc4132a41937fa3405417e1a5a2d006d71"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


