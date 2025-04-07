Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FA5C369A8
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.43041.1744017452424980640
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NobGWrRx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017452; x=1775553452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uKH/wQn7VFegxzLRhb5WzZAcv0jSbdoJWA4X3qYlmTE=;
  b=NobGWrRx+o1u9XHODdcRJupz3q7FBNFkPT5HzCHmPNH43wU3UTP1Ip1H
   Nx9Ev4psIywQCnHOjXAse0AEiclA7iCJfYKPxc5La7p8gLsLJ9xUA8efY
   8SoRNENdyTK5HDXwuve1iwU9Il96Fx/NwrYxWPXc1OMtuvuQ8xSC9kZjU
   RO/KydTlm+21lBU+gSnKQCTyoWJNZc9DxYPW5NdhambEnbsz4/oYTO60I
   Q8oyf8Y9YzigMOTsMEz9kjeE6U6tUN5JCih3D1eU4vXngY+puI2snnWQF
   yZFVcpYgFFWDux8BECaluqLROhgbQklOiXn6P6cnvJ94NbjZ4VbPYHW7Q
   A==;
X-CSE-ConnectionGUID: T9lHOK/+RmmwpbBqgKdlpQ==
X-CSE-MsgGUID: ksRDpnOaRKi0Ysoq5HgTUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195986454"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195986454"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:29 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E1250D480A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A8DC7D4C3B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 677B61A009A;
	Mon,  7 Apr 2025 17:17:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/30] python3-pyroute2: upgrade 0.8.1 -> 0.9.1
Date: Mon,  7 Apr 2025 17:17:04 +0800
Message-Id: <1744017431-22217-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116649

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyroute2_0.8.1.bb => python3-pyroute2_0.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.8.1.bb => python3-pyroute2_0.9.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.8.1.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.9.1.bb
index 8f5ec7fcb4..cd4ab341b3 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "b91f4a1f7abb9824637b1fe67e6e4a0a071d98d4a1a1b47ef792304ff3adad11"
+SRC_URI[sha256sum] = "5934612ad87a334a2ab3da97090979b46d713427deebfbd34c586dc60a1fd3d5"
 
 inherit python_setuptools_build_meta pypi ptest-python-pytest
 
-- 
2.43.0


