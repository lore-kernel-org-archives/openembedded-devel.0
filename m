Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1265CE8D4F
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.11284.1726716762802514062
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PDG6zS8h;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716763; x=1758252763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LGHODGq+pcnILbmfbvtbmWBIq0xU8uw2+Da7ObQ5q9I=;
  b=PDG6zS8hCMnmfd8z9Q+N0wM52pppqeJ2f5h8dhOAulAR0fbVySWdTw6d
   ALuknCiT15HKrcBOhl+D0/ZIEkZd2AeQxmKrA0/WjzKlp7PExczJCJjsH
   /5mo+UXHcsaiqyHN+vWuVPqncFBYjrDwCst3qQDd0qtEsKIHI91nbt15U
   YZROeDAkCPKYA1abeSwjuHjshyiWkpReiNk9TZu4bEG1sYMX1DUpXN7Ek
   SSIT+OnX2nzmb+ipd0BWDXWJvDGoz3U7z3AIZwSfKdcauHG+2/RKuuFsw
   JrRy6l4drojtIRgiMYiYkHM9GGYB4x6nSoWDfXx7FrqoYrmG+QJRtgVC8
   g==;
X-CSE-ConnectionGUID: 4wlVPajBQ/CQCOWeW2E8Og==
X-CSE-MsgGUID: D+7mGe7HQmSVrdQYdx4+Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="153125212"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="153125212"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:36 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 316E0C9440
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 52A3CD5107
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3079228921
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8E7581A01E9;
	Thu, 19 Sep 2024 11:32:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/28] python3-platformdirs: upgrade 4.3.1 -> 4.3.6
Date: Thu, 19 Sep 2024 11:31:59 +0800
Message-Id: <1726716733-14548-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10--8.358800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvMcZL/toKwUpgi
	FFysuNo+syDSD6cvfmrPYZsYJTXok2JZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW74Xkcr5uQiOxAISLmT6dDEHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIfiAqrjYtFiQ8CZ
	LaLAQ1+woCKkvPUn+kDlf8vzW7w9OvxbfzwyhAan7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112382

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix readme download target
- Split build and publish for release
- Use upstream setup-uv with uv python
- Bump astral-sh/setup-uv from 2 to 3
- [pre-commit.ci] pre-commit autoupdate
- don't include outdated changelog in docs
- Fix multi-path returned from _path methods on MacOS
- Use uv as installer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_4.3.1.bb => python3-platformdirs_4.3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.3.1.bb => python3-platformdirs_4.3.6.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.3.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.3.6.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.3.6.bb
index a994197ef..02d8c3cec 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.3.6.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "63b79589009fa8159973601dd4563143396b35c5f93a58b36f9049ff046949b1"
+SRC_URI[sha256sum] = "357fb2acbc885b0419afd3ce3ed34564c13c9b95c89360cd9563f73aa5e2b907"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


