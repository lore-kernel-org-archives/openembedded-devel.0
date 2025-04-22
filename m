Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47ACC3ABA8
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.35429.1745311775803059543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lID3hPNW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311776; x=1776847776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3kpMiXRkY1vKYmi4Yvdoii3Nu59IAQcPyxAcET/m4dU=;
  b=lID3hPNWwSHTMYYwMrDcV9KTfX4yyLf4mp0JYLaLaXMgrfAvay2K2QPp
   Z7HtyE4NMKLLAwsJDWMifLzYj5k3X1CC1yP4ljNGGoWwXvKorrNiANJ8X
   N41oFH6flaKOa4H3d7a5TPPKlB8DP3md+EeheanLrZJGAjM5OpqxiqLfT
   y6HXhysprGkCl4uKe4tIF8fmCjh3qQZeMYtioMhQWBbtH8aWzwD7IuxGZ
   /3a0BZHwlsRM7NJTjPHd3FhgGYIKoJYEx2iBNIuliRoBhLDOlmtsFBQVW
   BXPAGl3Yk6Gcjh4aanWVsYAfIXH2p8Hot0G/gzxFsqwzewFotDjgc1C6f
   g==;
X-CSE-ConnectionGUID: g+ANQY/0RQWrZGgVVVaJ3w==
X-CSE-MsgGUID: 8lNjZTItRwqzidenbEL5GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197342733"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197342733"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:34 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B03896743
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 27C82D3F31
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B26901A009A;
	Tue, 22 Apr 2025 16:49:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/30] python3-dill: upgrade 0.3.9 -> 0.4.0
Date: Tue, 22 Apr 2025 16:49:04 +0800
Message-Id: <1745311761-1912-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117030

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- update travis badge link
- fix buiding documentation with sphinx 8.x
- add initial support for python 3.14
- Bump starlette from 0.37.2 to 0.40.0 in /docs
- fix typo in requirements.txt
- updated copyright for 2025
- Bump jinja2 from 3.1.4 to 3.1.5 in /docs
- support pypy-3.11
- update docs requirements; CI for pypy3.11
- fix CodeType support for PyPy3.11 7.3.19+
- move travis build of 3.9 to focal
- Bump jinja2 from 3.1.5 to 3.1.6 in /docs

License-Update: updated copyright year to  2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-dill_0.3.9.bb => python3-dill_0.4.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dill_0.3.9.bb => python3-dill_0.4.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.9.bb b/meta-python/recipes-devtools/python/python3-dill_0.4.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-dill_0.3.9.bb
rename to meta-python/recipes-devtools/python/python3-dill_0.4.0.bb
index bc5a7e5003..d421b1a887 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.9.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.4.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Serialize all of python"
 HOMEPAGE = "https://pypi.org/project/dill/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a41509b57cc475ed93f8cb1dbbfaeec1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed5ea77287d7d542949d6dd0bc288ac0"
 
-SRC_URI[sha256sum] = "81aa267dddf68cbfe8029c42ca9ec6a4ab3b22371d1c450abc54422577b4512c"
+SRC_URI[sha256sum] = "0633f1d2df477324f53a895b02c901fb961bdbf65a17122586ea7019292cbcf0"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


