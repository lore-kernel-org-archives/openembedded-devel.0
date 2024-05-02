Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3045CC25B79
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.6687.1714628976236244315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CH+mc4oN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628976; x=1746164976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uUySc32TbDQXNULaYVOdsEDT5esAX++qTqoxyt+Ij5Y=;
  b=CH+mc4oN/rp07kP7rr8Xfbk4enPi1mUJDcn/OJrbp0MUrRasX3/2Pf4W
   xcnCHNhibFnRbVXf3RKwLQjZB0qwFwrpxdXsD/yWMzEI3rQCQM3XBl+sa
   Ag6yIf0S+sSQiuX7pupJEEONZeOxkwS2+1aN8NaYxymCuOlR3hhppn/ZI
   huFH2fvfVvJdtmLAB5nD+h6p/sNYMm27YX3sjOhPNzV9gE7ygmYcP+vKy
   Z235lc+zZUY/2no/RRfiojEgHy/dKVZ9JIYOtQNJSUX2nwsjJyiHFIN36
   Vq9ceNoAC/yLM8k/40LF3TmFQvK/dV7+0jBxbeH/cKX5GAtqgfSSztKTb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="144837169"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="144837169"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:33 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 80870E8FBF
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B2074FCEC8
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 463102008BCDD
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:30 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E86651A0002;
	Thu,  2 May 2024 13:49:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/30] python3-virtualenv: upgrade 20.25.0 -> 20.26.0
Date: Thu,  2 May 2024 10:48:21 -0400
Message-Id: <20240502144829.241208-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-4.103400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgDBQ+XBh4YJbOE
	dy34ZwwEynJamoOoK2YVDQr3tunC4G94Ipa1otxoP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJoY9TLJt4hY6vzFXadcrPDbSJySLYV4H5xBPco8X9FwaoyQ
	HhyNahX/Zm4LX5R53TMMEFTW6OlX7hIydW6ONV07RDZ5u+Ndf/AYLx7rnbR8rDQ8m3TqgloelpC
	XnG+JjvDGBZ1G8r1Sf2D6gx/0ozp
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110227

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed a case when template variable is WindowsPath
- Allow builtin interpreter discovery to find specific Python versions given a general spec

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.25.0.bb => python3-virtualenv_20.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.25.0.bb => python3-virtualenv_20.26.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.26.0.bb
index 1858fee25..55f7f4611 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "bf51c0d9c7dd63ea8e44086fa1e4fb1093a31e963b86959257378aef020e1f1b"
+SRC_URI[sha256sum] = "ec25a9671a5102c8d2657f62792a27b48f016664c6873f6beed3800008577210"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


