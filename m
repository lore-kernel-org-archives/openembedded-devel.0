Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F23EA3C45
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:41 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128847.1775730871027615941
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tc7pi+qi;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730871; x=1807266871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NaOYyBRlJgVDu+q+31pqo/ySYvt9ZqnAEeG+D7ZaE5Q=;
  b=Tc7pi+qinPDqtElguP+Q3VA210ya8HYxygR1fg4OBmqCZmFom9W5aH7G
   +QYZYrMNnEe3b/ZO084yBZhHdVSEmjdMlb9IqDGX9Afmnyzch67Wfb+jo
   paQ23mazrFA7Iq0GgBL5y4cLeEV7w6HrqRDQM+P5fYOTO6/f8N+AJ1Sht
   /qKnSZMoTTtpceBxzraWS0AaZXIRwVfifu6I1UVNyuEsry7nXyRRTdSTJ
   J7Mt8Jg6ru/rENq4vx/JFY7H0TIt+4fYvk+ECbItG9Wno9KsGWPl+zadZ
   KutbTljD1Aoll5PSE6q38oLHFU+NMY1QZH9kJSNq9CsIccMddjCM652qI
   Q==;
X-CSE-ConnectionGUID: qCe+xHMyREyYnuEvl1U7lA==
X-CSE-MsgGUID: X3IJwdwyTPag/6daZOPPsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="215190672"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="215190672"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:29 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 760FE1002BB9
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:29 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 329AAC0082A
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id BBD944045FC;
	Thu,  9 Apr 2026 10:34:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/37] python3-werkzeug: upgrade 3.1.7 -> 3.1.8
Date: Thu,  9 Apr 2026 18:32:19 +0800
Message-ID: <20260409103223.1574-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126182

From: Wang Mingyu <wangmy@fujitsu.com>

Request.host and get_host return the empty string if the header is missing or has invalid characters.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-werkzeug_3.1.7.bb => python3-werkzeug_3.1.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.7.bb => python3-werkzeug_3.1.8.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
index 29ef2db10a..4e1be5cb2f 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "fb8c01fe6ab13b9b7cdb46892b99b1d66754e1d7ab8e542e865ec13f526b5351"
+SRC_URI[sha256sum] = "9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44"
 
 CVE_PRODUCT = "werkzeug"
 
-- 
2.43.0


