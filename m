Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251A9ED7BB8
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15987.1776163232941856575
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WoN/UW9Y;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163233; x=1807699233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xO2/EZQca8fRZSs7B2eNbIO2/KS+jwzGnmYAlK88LbU=;
  b=WoN/UW9YoN1fzImoEXiD1s6PfuZIOp0ILw9cCyE5hB/5KVyZXeWIcOeF
   LWnH+LhhjfhvQO/qekWOLynu5jDHHBwlLTl5NBp6W9u5VQECysfJfHgMb
   3GkHh6675aTQbcLgZnx8R2KfASk8B5qvYxHCo6rJvtop/SaQLJFLpPZY7
   l78g6WsIi+yL4nxLcugp9MsSR8zXpDTxrK7kqL2dD4DS9Pg0S2StwagiC
   1nbk8LBjRQQ+01SNgzKf/izMtn6RIE70Qb96oJBZtjFz4KXaYJrWlFIpR
   5zXGJNBY3fVTRFU9D0hXwRtDzR4yLJERHcvbfcyNEOzA1ozic7+IMVM5J
   A==;
X-CSE-ConnectionGUID: 7HsYJ7XtRzuze97GqNUYwA==
X-CSE-MsgGUID: lYXYp0YFQYWHTcZOwT/GgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="224383890"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="224383890"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:31 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 691D01C1C70E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:31 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2184D8D65DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id A3D2C1400109;
	Tue, 14 Apr 2026 10:40:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/32] python3-pytest-httpx: upgrade 0.36.0 -> 0.36.2
Date: Tue, 14 Apr 2026 18:38:36 +0800
Message-ID: <20260414103845.1728-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126327

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026.

Fixed:
  Document how to ignore query parameters while matching on URL.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pytest-httpx_0.36.0.bb => python3-pytest-httpx_0.36.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-httpx_0.36.0.bb => python3-pytest-httpx_0.36.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.0.bb b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.bb
index 1cdf3d3d23..ac1a53d224 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.2.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Send responses to httpx."
 HOMEPAGE = "https://github.com/Colin-b/pytest_httpx"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8dcb0d82b1d402b6be745fc78dde254b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b6746540997ba13df3f30783db069bc"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-SRC_URI[sha256sum] = "9edb66a5fd4388ce3c343189bc67e7e1cb50b07c2e3fc83b97d511975e8a831b"
+SRC_URI[sha256sum] = "05a56527484f7f4e8c856419ea379b8dc359c36801c4992fdb330f294c690356"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


