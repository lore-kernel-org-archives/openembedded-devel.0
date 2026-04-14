Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24A4F531DE
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15989.1776163238016945631
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YwTWsS7n;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163243; x=1807699243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ta6isRPqYmUF8pXQOUHkIo884yJiG8vQtyN5ADPL8EI=;
  b=YwTWsS7n0Zox+wZA14OazRrAyc18LkIQV4j6JwQY6IBGVFu4uwtSREsq
   16ndxiWE2dKAhpqRL5rIbcnS5wkmQMBcwxPy+7DKDLl7lWYhOf7RD+vKa
   adRoNps3aPnPuBzDaggFXnQxJHCKrXn87XfOX8eAVOY3HwPbSuw+rpiT5
   YnLK/BxksGtr3nASki8JDi2LSGhwqcvncdfUAXb48bN5Qd2PM5rT2aRjc
   OzXfl65rF+j+flTq+Jw1g7eSvDRY5+DgObQJ5Ktp5/o4CQyv8ny4fm8/j
   mKpvpaA+B7TYt5hroko0I95DQ3bVd1In6W9VghGhJBWp61X/ckUDlLcA+
   w==;
X-CSE-ConnectionGUID: jdoIuVOaQ9SyR4e4L1cUXw==
X-CSE-MsgGUID: bRl178FoQeKWzx5NUy0eFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="225584023"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="225584023"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:43 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E73ED1C1C71D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:43 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9F66314003D0
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2ED3F14000E2;
	Tue, 14 Apr 2026 10:40:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/32] python3-virtualenv: upgrade 21.2.0 -> 21.2.1
Date: Tue, 14 Apr 2026 18:38:42 +0800
Message-ID: <20260414103845.1728-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126333

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Upgrade embedded pip/setuptools/wheel
- Enhance upgrade workflow: age check, dedup, issue tracking
- fix(create): use commonpath for correct path validation
- ci(workflows): add zizmor security auditing
- Add current and previous maintainers
- fix(ci): restore git credentials for release and upgrade jobs
- Fix broken Installation link in README
- fix: use terminal width for help formatting instead of hardcoded 240
- fix(nushell): surface actionable hint in deactivate error output
- ci: fix setup-uv warnings and drop brew@3.9
- fix(ci): fix pre-release push and release note generation
- fix(ci): check out repo in publish job for gh release notes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-virtualenv_21.2.0.bb => python3-virtualenv_21.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.2.0.bb => python3-virtualenv_21.2.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.2.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index dda29c549d..3ff03e43c7 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "1720dc3a62ef5b443092e3f499228599045d7fea4c79199770499df8becf9098"
+SRC_URI[sha256sum] = "b66ffe81301766c0d5e2208fc3576652c59d44e7b731fc5f5ed701c9b537fa78"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


