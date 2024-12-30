Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B39E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:31:00 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.58985.1735543850252819700
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m/u578Wh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543851; x=1767079851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aRHRtXXRzv/8WudRFgmeVGW4h88KSS8sWWVFkGGmJC8=;
  b=m/u578WhnG1CvaHtyY9H4H8pCAQlDvxrRqheLnuTEVeHPqgA3iX3WUkt
   iW6prYLhjAJxdMaiX+TxCiYRJygdKoSZ9u3lSP9K//GDkoLlRPIN8nYMd
   tRexxCtvU1b97GZFpDfR+K+3rvXl4ioFkzkPj6Dq1jckMKCTA/uMz9IgR
   NsdVgFgozR7BeGoK6AwnQiFWh8jqCZdWUTW4suTUWf9dEM/CTVPU1OYPx
   Yea/GUh+N8Bp0zsY8F8rTPQOfVegAHw0F9IH3bxMTdVeqvjo/6hBzZX+j
   Hx5a7XHjiwuJqGf4xxQcYNKT3rlxWXOGDaqm7Ufue5LZ8RZWbQFlocVmL
   A==;
X-CSE-ConnectionGUID: mwneue6LSEO8xg89+IQSmw==
X-CSE-MsgGUID: kDKoSfHfRD2wmEegIn5ARQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="185248943"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="185248943"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 518C3D4C2B
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 290D2D4F42
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BCA8B20076D0F
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:45 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8496E1A006C;
	Mon, 30 Dec 2024 15:30:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/18] python3-starlette: upgrade 0.42.0 -> 0.44.0
Date: Mon, 30 Dec 2024 15:30:35 +0800
Message-Id: <1735543836-2512-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDXJZ/LISwyXPm2cd7j0YvfJx3mn2kvXH5gmr4cqzLrTeqItHX90cqZ66fgOP/UyoITLrz
	uLuPbTSrSXusScAwYIIzhbWl/8nZTyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114596

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.42.0.bb => python3-starlette_0.44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.42.0.bb => python3-starlette_0.44.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.42.0.bb b/meta-python/recipes-devtools/python/python3-starlette_0.44.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.42.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.44.0.bb
index ed539ed9df..192c76997c 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.42.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.44.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "91f1fbd612f3e3d821a8a5f46bf381afe2a9722a7b8bbde1c07fb83384c2882a"
+SRC_URI[sha256sum] = "e35166950a3ccccc701962fe0711db0bc14f2ecd37c6f9fe5e3eae0cbaea8715"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


