Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED71E77197
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.30512.1735032447054318345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g0sPVSnk;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032447; x=1766568447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TQNjR6BPmW3XGOVd4qJKEg2nJy8ycGUEZO+3YL+w1+o=;
  b=g0sPVSnko3JnPPe4XQzEg9IfbX81WDGuzJbPNdwMPnz8iVwcmuO5IhgO
   /T65VHrW4k10X36UIVCHwFSxqibkRKzP1pvduqPqS9s1YxQPHpk2VyzXl
   07A6bw1EnEh5q+fL3nzeJTL/pfPL6qXmAJsUslZUsdAwV9AFLQ+sSyD+y
   ZJVGdlj3bI3KnFSUI59hLT8JG7tw2EqHSHX/kWdfHJuuoYaHyymuuPoDT
   4gcM/KnkKWjiEtqpj903D6fqqDEg6Ng3zDDwjhOLbyGXuED5IKpU03Ce1
   JU0M00sdFok5QPn/GobSgIUnM4t9lmnGVaa46VfoqfjB0n1mhq7Gs+HP1
   w==;
X-CSE-ConnectionGUID: vBOSEv4kQOKt5x57z9gHnA==
X-CSE-MsgGUID: clLh3oHMTeW2Mg29ehhCzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="173157107"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="173157107"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:26 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D00032743A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A4FA8D3F36
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 38A1E6BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F3D421A0073;
	Tue, 24 Dec 2024 17:27:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/67] python3-moteus: upgrade 0.3.72 -> 0.3.76
Date: Tue, 24 Dec 2024 17:26:35 +0800
Message-Id: <1735032421-13513-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDVp7XU1MyoMDPPDS1ZKq/i0nz9qzhxrbsrfagWFf3lT6PID3S7BulgrGSYBbhFG0Amv4C
	uddCdrB9vgHHsPxTkQuwPRDi7pIV6qBBhtzPlTslPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114513

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.72.bb => python3-moteus_0.3.76.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.72.bb => python3-moteus_0.3.76.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.72.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.76.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.72.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.76.bb
index be560c7180..b86b0ded02 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.72.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.76.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "3aa30eea9ab9bc7209ab7c6f382650265ab648663edead5c54d69d9f0a3fd36e"
+SRC_URI[sha256sum] = "acc10f7ffe34b6fcb2f1e767d6fb63a1bc0107dbbbd054fca8c2ac5b499de0f7"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.43.0


