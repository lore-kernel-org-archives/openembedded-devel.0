Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04163C4450A
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:30:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9451.1768995015286227574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NKAD7MTt;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995015; x=1800531015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kHFjl5/piYnNEkPb0QE9s1sI/dLgvstv6ooxnPngQHg=;
  b=NKAD7MTtT9uliiKYR7xapIjoDIATRyg6o6URheQy1ya8Spb1pabVmou6
   zXvPwHPBRlqf/NAblh84ZJ21fAK/c8IZ42rPgoQJfrHRwWrPVWRkKbQHp
   qxJcAfc/Pl8nqHp5qzFvT6mFMdOiH8dy15acetI+MYi952WamMjXodHJz
   q8OVt/beAiIjkFj4sqYGQxb++CIuyS6zytK/q7AVrhqWCjrYxHMXzkczr
   RvcEIt152q8AALR+FXXD3AESTmCFW43j1t2+rJNpGxlGNC+eLeMA4lLxo
   PPLe3jdXGu4vCJrw6c1c3SOa0M1m70p+nrXx7J5UpwJ8AELWelVwzBzmW
   A==;
X-CSE-ConnectionGUID: NO2CuB38SYaeEFBeeAE/PQ==
X-CSE-MsgGUID: UHj05F/MQFisMTHAAKRyUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="214509339"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="214509339"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:30:13 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id AC610100034E
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:13 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 62110C026EE
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id BC0671404866;
	Wed, 21 Jan 2026 11:30:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/30] python3-py7zr: upgrade 1.1.0 -> 1.1.2
Date: Wed, 21 Jan 2026 19:29:03 +0800
Message-ID: <20260121112921.857-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123703

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-py7zr_1.1.0.bb => python3-py7zr_1.1.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-py7zr_1.1.0.bb => python3-py7zr_1.1.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_1.1.0.bb b/meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-py7zr_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb
index 7a7a7f45ee..5a0fe86ebd 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "087b1a94861ad9eb4d21604f6aaa0a8986a7e00580abd79fedd6f82fecf0592c"
+SRC_URI[sha256sum] = "2aee212c5516ddcbeb76874dc3ece38b4566fc003f51600032c723cfea89ac56"
 
 CVE_PRODUCT = "py7zr"
 
-- 
2.43.0


