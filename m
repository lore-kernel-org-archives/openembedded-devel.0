Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8839CFC534
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.50495.1728896174284022729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G3mG+DG7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896175; x=1760432175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=A56zv9eFv2HASXCeNgkMF1o66C1RKrY5h8oj/ngLyAQ=;
  b=G3mG+DG7k8b0q+Gb89fvRsA/k0zn9IXiFwCCfwzREZJ9URYBHiPHnghA
   wEHmjIJLZm75+Z0YiNf+HLi92WiobmjXrel7hho3Iag8NzOIGQz0kB8dL
   yy9Bm1AoB5oBejOxvX1bxyz2Ed3CCM54Nnc7+TQEuFaPdKwqxgk89goXe
   0NS08MaPj0xQRTc6jkYpvOxeE+u+3KJqAmP3T1VQKdqE33q4hBAH8YEmn
   E5UQ6PxioFoAK9XXUJFRKOW/6xmCPp9H6WyASyt+e64CegbbJWk3MV59v
   zK0oOaKWzsRnLMySGRPLqJQX/E0gxxt7P+RBYB0UIfmrDVZ9UJQi0QCAl
   Q==;
X-CSE-ConnectionGUID: hYMs3X3AQZeuxk7JRqKHMg==
X-CSE-MsgGUID: ygnEuSUMQSWzSzAMcZ2lJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="164060391"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="164060391"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:14 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D3397D800A
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2860CD4BD2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AAC396B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5A1191A000A;
	Mon, 14 Oct 2024 16:56:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/54] python3-simpleeval: upgrade 0.9.13 -> 1.0.0
Date: Mon, 14 Oct 2024 16:55:02 +0800
Message-Id: <1728896115-2944-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-2.880700-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhPUt
	SCGaNXOrg+KYTANwVp19+b2UAY3sBmva9iDAeV19fOaYwP8dcX5VxJia/7DuCJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/+TAXNPNyDOEYA3qL69rXq5pEX
	AOzwbtMeLzNWBegCW2wgn7iDBesS0nRE+fI6etkqz1XdZV/da3508tLtvb2irsJ1EyePdk4P85J
	XVqtvd5KPnz8lVRLjgzaTWLjQB9Nztpfzfa9TiPYzcFGOA/d+p/2bDsabNU20u/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112889

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
===========
- Fix a sandbox escape via generators and _frame methods.
- Supporting dictionary comprehensions
- A custom exception rather than KeyError when names not found
- Dropping support for old python versions - if you need pre 3.9, then you can use an older version
- Various cleanups & tidying warnings, deprecation warnings etc.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-simpleeval_0.9.13.bb => python3-simpleeval_1.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-simpleeval_0.9.13.bb => python3-simpleeval_1.0.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
rename to meta-python/recipes-devtools/python/python3-simpleeval_1.0.0.bb
index af2c4a1e2..686f54b41 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A simple, safe single expression evaluator library"
 HOMEPAGE = "https://pypi.org/project/simpleeval/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=dc9277482effe59b734b004cbcc1fee7"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=83843c8f0f3beb18af2f282faecbdebe"
 
-SRC_URI[sha256sum] = "4a30f9cc01825fe4c719c785e3762623e350c4840d5e6855c2a8496baaa65fac"
+SRC_URI[sha256sum] = "f3d259deeb751d34c63e56747bab384efad63a2dbdb4f130281c42279788ac3c"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


