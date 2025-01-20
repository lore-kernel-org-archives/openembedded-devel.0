Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2941C02188
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.32741.1737360857036511562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZTWd9d4D;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360860; x=1768896860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GPnwqFm6s8PGuliQdVoyJO/sDntSv/IjNpvku7SOA9Q=;
  b=ZTWd9d4D6pfLZrS33gzhFDzm4QEt0koDFuHvOIMy9lO+/NvepjZ4eS2n
   hM1xoR7zXHfSB2ITbNxvHBKNBObIAK6Qr1AWZLC/x3PemGHDGdTnLQTZh
   EJq9OSiXQJcgLZr/yQQiRqI6YBmHe57Hmjplfe7dXR1en6Y5581eKuzc9
   amr/UtcUimw4kuP3aK67t+2Un7X7g+DPCF8w8n1rLXkIEhtWbhXC9M+BZ
   hyzfvniLh2dhDP+uwVDDuTfGpSLKUJit8j//JgobnRzjU5kZdak38TJZn
   wpsnltdxima4Ue39O+JgOE+5qgdJrAvZdia06Vzk5hLKB/ZqMHntKbqyi
   g==;
X-CSE-ConnectionGUID: g6SWy6OrTrydjI2Bn/RO1Q==
X-CSE-MsgGUID: 3t9u/k8pRiWwazaVmU+brA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="175491032"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="175491032"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F3374DCFD3
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C7F6ED7485
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F6AD6BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0ACCA1A0071;
	Mon, 20 Jan 2025 16:14:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/32] python3-cloudpickle: upgrade 3.1.0 -> 3.1.1
Date: Mon, 20 Jan 2025 16:13:50 +0800
Message-Id: <1737360846-4824-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-3.032500-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrWq/snXbxpCCU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v99LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrSMvSExLn3ldx26mzNPW+Alj9VNk6sPs5+sek0pD4CRJ/M7JLioh1u73sH
	cNlt+8r1bzcTbJcKAzBI+YvuDW5Ag/fsx/n0CvFR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114975

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Various fixes to support for Python 3.14

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-cloudpickle_3.1.0.bb => python3-cloudpickle_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cloudpickle_3.1.0.bb => python3-cloudpickle_3.1.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.0.bb b/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cloudpickle_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cloudpickle_3.1.1.bb
index 7e378e7abb..7e2fadda1c 100644
--- a/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cloudpickle_3.1.1.bb
@@ -14,5 +14,5 @@ inherit pypi python_flit_core
 
 SRC_URI += "https://raw.githubusercontent.com/cloudpipe/cloudpickle/v${PV}/LICENSE;downloadfilename=LICENSE.cloudpickle;name=license"
 
-SRC_URI[sha256sum] = "81a929b6e3c7335c863c771d673d105f02efdb89dfaba0c90495d1c64796601b"
+SRC_URI[sha256sum] = "b216fa8ae4019d5482a8ac3c95d8f6346115d8835911fd4aefd1a445e4242c64"
 SRC_URI[license.sha256sum] = "3029ea34173e9fdc233ad315dc6b100bd1ea71f529b1c1af97664a272fdc55f5"
-- 
2.43.0


