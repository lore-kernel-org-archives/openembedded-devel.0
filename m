Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E21C87FC8
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.4255.1753153990390718791
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qS+oi9ds;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153992; x=1784689992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vo2xTOqeyibCKUjoCcAwUc+O3X6+YkgD9bE7HotJF6g=;
  b=qS+oi9dswU3kcqv6sUyviOnwIhgLfaS7cCryppndPuDOJFr0oS9b/PmY
   JlzACy8RrYK7wxIMEVgdMtRepuI7JP6363bitDkOMiokdal+yRqVxKaHa
   JHHrluBYJyuAhhFgbRuN2xNlUpFJDMmCqTsuBx/kECGEnku5eOJTWv7ga
   r+YKu/90uD995+0F8zU6RPxe4H4zKw6i/QlaoOy3+VhUOuDArt99NqT+U
   RLLCJ5Jzew4qEn/Mg4pSovehyklLI+P3tw/cWNkWgBfN5pY7K+6uKW5o6
   5qXVmmidGuxudjEMMPmNzjGJxRE0CCpeRyZa5fKxMdW1hcglDOdSM82un
   A==;
X-CSE-ConnectionGUID: W1Rz+75ZSkaxGRXh2lbeJQ==
X-CSE-MsgGUID: sodccXFUTQ+43147UjHEYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="206935434"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="206935434"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:09 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 502ED1C0008B
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B503D180050E
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:07 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ACEA71A008F;
	Tue, 22 Jul 2025 11:13:04 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 15/21] python3-twitter: upgrade 4.15.0 -> 4.16.0
Date: Tue, 22 Jul 2025 11:12:23 +0800
Message-ID: <20250722031245.884-15-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118682

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

Licence Update:
|# --- PKG-INFO
|# +++ PKG-INFO
|# @@ -1 +1 @@
|# -License: MIT
|# +Classifier: Development Status :: 5 - Production/Stable

License-Update: Changed from 'MIT' to classifier-based license declaration
Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-twitter_4.15.0.bb => python3-twitter_4.16.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_4.15.0.bb => python3-twitter_4.16.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
index c35b97a9e4..1aa713ccc3 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Twitter for Python"
 DESCRIPTION = "Python module to support twitter API"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=9;endline=9;md5=8227180126797a0148f94f483f3e1489"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=9;endline=9;md5=77d9066068d13ffd309659977e9909c9"
 
-SRC_URI[sha256sum] = "1345cbcdf0a75e2d89f424c559fd49fda4d8cd7be25cd5131e3b57bad8a21d76"
+SRC_URI[sha256sum] = "1d95cbdc50bf6353a387f881f2584eaf60d14e00dbbdd8872a73de79c66878e3"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.43.0


