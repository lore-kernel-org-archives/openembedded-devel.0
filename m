Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20953C83F27
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:39:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.4346.1753234765502459112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fz6KTVJN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753234765; x=1784770765;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vMoogAXtaT/YH/BTctkUbBgvhti9Yw2zqWmE1kNVlG4=;
  b=fz6KTVJNplRL8lcqFAYW1BuQeWzdHlmG4971ObaOhm+/sS66VcGhgk7E
   miiSOvBlf1TnFfB/AeigLUzmEkhcQ95i1BSmtcIy6/4iaHnidjeNeqmIm
   cWoTsCInVhrgzijc06k6G/1G3l26kce/ELWq/y+5XqAZXW9DaFP9fNxGQ
   TKUrV4qRiQH9eIfOZtp5n5nnwIUKZzukUzIeUHdtlhTx56w89fYFOQiuM
   YV9JZZHGXalHj/tyb/WLfi1p3eZyW8Py/a/btXbu+mYpBJSLCN2O/GB3G
   Ymy+uhDLp83+WHSOCza8w1Eq1gp4dv9VK4WVW1HImfGePB1N7sFMZFa+P
   w==;
X-CSE-ConnectionGUID: ujH1wpObT1eVZXe1qwF8vw==
X-CSE-MsgGUID: VP+CYGlAS3S2+RRgH+4PKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="186027913"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="186027913"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:39:23 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3FCF61C02136
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 01:39:23 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id AF4E2C0083C
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 01:39:22 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8F14C1A009B;
	Wed, 23 Jul 2025 09:39:19 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH v2] python3-twitter: upgrade 4.15.0 -> 4.16.0
Date: Wed, 23 Jul 2025 09:38:57 +0800
Message-ID: <20250723013857.970-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 01:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118706

Changelog:
==========
- Re-improve clarity of OAuth 2.0 User Context example code
- Fix SyntaxWarning
- Install 'build'
- Docs config updates to fix build
- Fix Sphinx context injection removal by readthedocs
- Revert hoverxref upgrade for now until sphinx can be updated
- Fix build error for docs related to 'html_context' setting
- Modernize packaging configuration
- Add new publish workflow to use trusted publisher
- Add dev and test dependencies
- Update publish workflow...
- Add support for posting tweets to Communities

Change to use LICENSE file instead of PKG-INFO, and
license is MIT still

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-twitter_4.15.0.bb => python3-twitter_4.16.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_4.15.0.bb => python3-twitter_4.16.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
index c35b97a9e4..10b7b856bc 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Twitter for Python"
 DESCRIPTION = "Python module to support twitter API"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=9;endline=9;md5=8227180126797a0148f94f483f3e1489"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=48c84b17f84a9a623754604ab73f28fe"
 
-SRC_URI[sha256sum] = "1345cbcdf0a75e2d89f424c559fd49fda4d8cd7be25cd5131e3b57bad8a21d76"
+SRC_URI[sha256sum] = "1d95cbdc50bf6353a387f881f2584eaf60d14e00dbbdd8872a73de79c66878e3"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.43.0


