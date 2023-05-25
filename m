Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B08CC7EE43
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:47 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6076.1684997861149654560
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="97288408"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="97288408"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:39 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A7FA6CA1EB
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:36 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DFDEAF504
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D44D2FC8EBE;
	Thu, 25 May 2023 15:57:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-u-msgpack-python: upgrade 2.7.2 -> 2.8.0
Date: Thu, 25 May 2023 14:57:19 +0800
Message-Id: <1684997851-2098-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10--1.635600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyc2kGz0N2bplfW
	IQC27i4v4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2aY5ZGw7wyeH1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXt0H8LFZNFG76sBnwpOylLN9cd
	mEN3Pf0DQLknx8A8AZ4XubtNQ95hMEVmIpJyy83nKNMb3OGXIRjcaDVnIDfRJNH5ikCpcpGWTZd
	mEexPCUuNjW98BCoDSIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102819

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Migrate module to package.
 Migrate documentation to Sphinx.
 Improve types and formatting in docstrings.
 Add type stubs.

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...pack-python_2.7.2.bb => python3-u-msgpack-python_2.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-u-msgpack-python_2.7.2.bb => python3-u-msgpack-python_2.8.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.2.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.2.bb
rename to meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
index 7231a51953..8baedcb951 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "A portable, lightweight MessagePack serializer and deserializer written in pure Python."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=31e3e7e79c4e2dafffffdd0b4d40c849"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=17df11353545c53a2df0ce7655859306"
 
-SRC_URI[sha256sum] = "e86f7ac6aa0ef4c6c49f004b4fd435bce99c23e2dd5d73003f3f9816024c2bd8"
+SRC_URI[sha256sum] = "b801a83d6ed75e6df41e44518b4f2a9c221dc2da4bcd5380e3a0feda520bc61a"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


