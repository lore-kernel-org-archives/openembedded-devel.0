Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF547CD6E67
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:09:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21234.1780394942211242392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HP7WIdDS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394943; x=1811930943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uLilr2N9WDXkoqPMyUVTExmNrlVWsY9aIACKO4WaL+A=;
  b=HP7WIdDSgzR8fPUKkixcnpqYdXYyamLD+FqwZ55sUu9Xd2MPSTEvfNF6
   ZrNFaN2dobeAdrKXJ8+Vvv1I7mHCoIk19O21RxLwjsWCg2CMy9oE0RWd4
   PpvBi+YPKEVr0uXYz81GHScCt7kHxlYEE0Gm2JZmaIjSN0TU4hLLHsPr6
   e8sFNDWVewZ8/gCCjQ9uJ//Pzf3z8mCVfO7s4/H3y7tC6UJI77gFbWGOf
   D07Yol/rvDLMdh8RWZYa13+z59ikg8bfLuPkE515dQ9KCoUB5617CXxwv
   u7TLDILKePGd40/WqNjapEbW2Pt4pYtZ2vhQlcny8YdQbMzpwdbomng5h
   Q==;
X-CSE-ConnectionGUID: 1xd3NZv7RTOk/qM/gowkfg==
X-CSE-MsgGUID: dVEvaNI8TZGZSyGb6THdhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242743094"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242743094"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:09:01 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B2F6642A335
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:09:00 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6404E180CCF5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:09:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7AB4418005A7;
	Tue,  2 Jun 2026 10:08:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/38] python3-virtualenv: upgrade 21.3.3 -> 21.4.2
Date: Tue,  2 Jun 2026 18:07:50 +0800
Message-ID: <20260602100755.2117-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127356

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-virtualenv_21.3.3.bb => python3-virtualenv_21.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.3.3.bb => python3-virtualenv_21.4.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.3.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.4.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.3.3.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.4.2.bb
index 073f6f25a1..de4c20f7c4 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.4.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "f5bda277e553b1c2b3c1a8debfc30496e1288cc93ce6b7b71b3280047e317328"
+SRC_URI[sha256sum] = "38e6ee0a555615c0ea9da2ac7e9998fe8dc3b911dd33ad8eaad2020957653b0c"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


